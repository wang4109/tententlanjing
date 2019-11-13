#  -*- coding: utf-8 -*-
'''
@author: Swain
@contact: 624420781@qq.com
@file: user.py
@time: 2019/05/08 上午 9:43
'''
from common.public_method import return_result,post_url
from api.models import User,Role
from django.core.paginator import Paginator
import json
def user_list(request):
    user_list = User.objects.order_by("-createTime")
    #  分页
    page = int(request.GET.get('page', 1))# 第几页
    size = int(request.GET.get('size', 10))
    size = 1 if size < 1 else size# 每页
    user_obj = Paginator(object_list=user_list, per_page=size)#  per_page条数据为一页，实例化分页对象
    try:
        page_obj = user_obj.page(page)
    except PageNotAnInteger:
        page_obj = user_obj.page(1)  #  首次进入给第一页
        page = 1
    except EmptyPage:
        page_obj = user_obj.page(user_obj.num_pages)  #  空页给最后一页
        page = user_obj.num_pages
    
    data = []
    for userItem in page_obj:
        data.append({
            "id": userItem.pk,
            "username": userItem.username,
            "rolename": [role.name for role in userItem.roles.all()],
            "rolepk": [role.pk for role in userItem.roles.all()],
            "nickname": userItem.nickname,
            "email": userItem.email,
            "phone": userItem.phone,
            "createTime": userItem.createTime,
        })
    context = {"user_list":data, "page": page,
                "size": size, "total": user_obj.count}
    result = return_result(status=True, code=200, message="查询用户列表成功",data=context)

    return result

def role_list(request):
    role_obj = Role.objects.values('pk','name')
    data = list(role_obj)
    return return_result(status=True, code=200, message="查询角色列表成功",data=data)

def bk_user_list(request):
    data = {'bk_username':'admin'}
    status,code,message,data = post_url('/api/c/compapi/v2/bk_login/get_all_users/', data)
    return return_result(status,code,message,data)

def add_user(request):
    try:
        data ={}
        data['username'] = request.POST.get("username")
        data['nickname'] = request.POST.get("nickname")
        data['email'] = request.POST.get("email")
        data['phone'] = request.POST.get("phone")
        user = User.objects.filter(username=data['username'])
        if(user):
            result = return_result(status=False, code=500, message="该用户已存在")
        else:
            roles = request.POST.get("roles")
            role_obj = Role.objects.filter(id__in = json.loads(roles))
            user_obj = User.objects.create(**data)
            user_obj.roles.add(*role_obj)
            result = return_result(status=True, code=200, message="新增用户成功")
    except Exception as e:
        result = return_result(status=False, code=500, message="添加用户失败")
    return result

def edit_role(request):
    try:
        pk = request.POST.get("pk")
        roles = request.POST.get("roles")
        user_obj = User.objects.get(pk=pk)
        role_obj = Role.objects.filter(id__in = json.loads(roles))
        user_obj.roles = role_obj
        user_obj.save()
        result = return_result(status=True, code=200, message="修改用户权限成功")
    except Exception as e:
        result = return_result(status=False, code=500, message="修改用户权限失败")
    return result

def del_user(request):
    try:
        pk = request.POST.get("pk")
        user_obj = User.objects.filter(id=pk).first()
        if user_obj.surperman:
            result = return_result(status=False, code=500, message="不能删除该用户")
        else:
            user_obj.delete()
            result = return_result(status=True, code=200, message="删除用户成功")
    except Exception as e:
        result = return_result(status=False, code=500, message="删除用户失败")
    return result


