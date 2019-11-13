#  -*- coding: utf-8 -*-
'''
@author: Swain
@contact: 624420781@qq.com
@file: init_user.py
@time: 2019/03/29 上午 9:43
'''
from django.db.models import F
from common.public_method import return_result
from api.models import Permission,User,Menu,Item
from django.conf import settings
from django.shortcuts import redirect
from django.contrib.auth import authenticate
from django.contrib.auth.views import redirect_to_login
import operator


# def init_user_info(request):
#     #  拿到当前用户的个人信息
#     user = request.userobj
#     user_info = {}
#     user_info['id'] = user.id
#     user_info['username']  =user.username
#     user_info['nickname'] = user.nickname
#     user_info['email'] = user.email
#     user_info['surperman'] = user.surperman
#     item_obj = Item.objects.filter(users__id=user.id).values_list('id',flat=True)
#     user_info['itemList'] = list(item_obj)
#     request.session[settings.SESSION_USER_INFO_KEY] = user_info
#     return True

# def init_user_permission(request):
#     username = request.user
#     user = User.objects.filter(username=username).first()
#     if not user:
#         return False
#     if user.surperman:
#         permission_list = Permission.objects.annotate(permissions__url=F('url')).values('permissions__url')
#     else:
#         permission_list = user.roles.values('permissions__url').distinct()

#     permissions = []
#     # 权限数据处理
#     for each in permission_list:
#         permissions.append(each['permissions__url'])

#     request.session[settings.SESSION_PERMISSIONS_URL_KEY] = permissions
#     return True

# def init_user_menus(request):
#     username = request.user
#     user = User.objects.filter(username=username).first()
#     if not user:
#         return False
#     if user.surperman:
#         menu_list = Menu.objects.annotate(menus__name=F('name'),menus__father_menu_id=F('father_menu_id'),menus__id=F('id'),menus__title=F('title'),menus__weigh=F('weigh'),menus__link=F('link'),menus__icon=F('icon')).values('menus__weigh','menus__id','menus__title','menus__icon','menus__name','menus__link', 
#                                             'menus__father_menu_id',)
#     else:
#         menu_list = user.roles.values('menus__weigh','menus__id','menus__title','menus__icon','menus__name','menus__link', 
#                                             'menus__father_menu_id',).distinct()

#     # 菜单数据处理
#     menu_list_url = {}
#     for each in menu_list:
#         if each['menus__father_menu_id']:
#             if str(each['menus__father_menu_id']) in menu_list_url:
#                 menu_list_url[str(each['menus__father_menu_id'])]['submenu'].append({'title': each['menus__title'],
#                                                         'name': each['menus__name'],
#                                                         'link':each['menus__link'] ,'weigh':each['menus__weigh']})
#             else:
#                 menu_list_url[str(each['menus__father_menu_id'])] = {}
#                 menu_list_url[str(each['menus__father_menu_id'])]['submenu'] = [{'title': each['menus__title'],
#                                                         'name': each['menus__name'],'link':each['menus__link'],'weigh':each['menus__weigh']}]
#         else:
#             if str(each['menus__id']) in menu_list_url:
#                 menu_list_url[str(each['menus__id'])]['title'] = each['menus__title']
#                 menu_list_url[str(each['menus__id'])]['icon'] = each['menus__icon']
#                 menu_list_url[str(each['menus__id'])]['name'] = each['menus__name']
#                 menu_list_url[str(each['menus__id'])]['link'] = each['menus__link']
#                 menu_list_url[str(each['menus__id'])]['weigh'] = each['menus__weigh']
#             else:
#                 menu_list_url[str(each['menus__id'])]={}
#                 menu_list_url[str(each['menus__id'])]['title'] = each['menus__title']
#                 menu_list_url[str(each['menus__id'])]['icon'] = each['menus__icon']
#                 menu_list_url[str(each['menus__id'])]['name'] = each['menus__name']
#                 menu_list_url[str(each['menus__id'])]['link'] = each['menus__link']
#                 menu_list_url[str(each['menus__id'])]['weigh'] = each['menus__weigh']
#                 menu_list_url[str(each['menus__id'])]['submenu'] = []  
#     themenus = list(menu_list_url.values())
#     menus = sorted(themenus, key=operator.itemgetter('weigh'))
#     request.session[settings.SESSION_MENUS_URL_KEY] = menus
#     return True

def add_permission_list(request):
    try:
        data ={}
        data['name'] = request.POST.get("name")
        data['url'] = request.POST.get("url")
        data['code'] = request.POST.get("code")
        data['desc'] = request.POST.get("desc")
        data['status'] = request.POST.get("status")
        Permission.objects.create(**data)
        result = return_result(status=True, code=200, message="添加权限成功")
    except Exception as e:
        result = return_result(status=False, code=500, message="添加权限失败")
    return result







