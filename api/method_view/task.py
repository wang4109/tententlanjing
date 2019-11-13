#  -*- coding: utf-8 -*-
'''
@author: Swain
@contact: 624420781@qq.com
@file: task.py
@time: 2019/11/14
@description: 蓝鲸认证的考试
'''
from django.db.models import F
from common.public_method import return_result,post_url,check_string,dealExcel
from api.models import TempletType,TaskTemplet
from django.http import JsonResponse

from django.core.paginator import Paginator
import uuid
import xlrd
from common.log import logger
#测试接口
def test(request):
    a = request.GET.dict()
    return JsonResponse({'result':True,'message':"success",'data':a})

#获取业务列表
def getBusiness(request):
    data = {'bk_username':'admin'}
    status,code,message,data = post_url('/api/c/compapi/v2/cc/search_business/', data)
    return return_result(status,code,message,data)

#获取模板类型
def getType(request):
    type_obj = TempletType.objects.values('id','name')
    data = list(type_obj)
    return return_result(status=True, code=200, message="查询角色列表成功",data=data)

def loadExcel(request):
    """导入模板文件"""
    files = request.FILES.get("upload_file")
    excel_type = files.name.split('.')[1]
    t = str(uuid.uuid1())
    if excel_type in ['xlsx','xls']:
        new_fname = r'static/static/file/' + t + '.'+excel_type
        dest = open(new_fname,'wb+')
        dest.write(files.read())
        dest.close()
    else:
        return return_result(status=False, code=500, message=u"非常抱歉，上传模版失败")
    status,data = dealExcel(new_fname)
    if not status:
        return return_result(status=False, code=500, message=data)
    data['uuid']=t+'.'+excel_type
    return return_result(status=True, code=0, message=u'上传模版成功！',data = data)

#新增模板
def addTemplet(request):
    try:
        data ={}
        data['name'] = request.POST.get("name")
        data['thetype_id'] = request.POST.get("type")
        data['business'] = request.POST.get("task")
        data['templet'] = request.POST.get("templet")
        data['user'] = request.user
        data['update_user'] = request.user
        name = TaskTemplet.objects.filter(name=data['name'])
        if(name):
            result = return_result(status=False, code=500, message="该模板已存在")
        else:
            templet_obj = TaskTemplet.objects.create(**data)
            result = return_result(status=True, code=200, message="新增模板成功")
    except Exception as e:
        result = return_result(status=False, code=500, message="添加模板失败")
    return result

#删除模板
def delTemplet(request):
    try:
        user = request.user
        templetID = request.POST.get("pk")
        templet_list = TaskTemplet.objects.filter(pk=templetID).first() 
        if templet_list.user == user:
            TaskTemplet.objects.filter(pk=templetID).delete()
            result = return_result(status=True, code=200, message="删除模板成功")
        else:
            result = return_result(status=False, code=501, message="只有创建人才能删除！")
    except Exception as e:
        result = return_result(status=False, code=500, message='删除模板不成功')
    return result

# 模板列表
def templetList(request):
    username = request.user
    search_dict = {}
    search_dict['user']=username
    name = request.GET.get('name')
    thetype_id = request.GET.get('type')
    business = request.GET.get('business')
    if name:
        search_dict['name'] = name
    if thetype_id:
        search_dict['thetype_id'] = thetype_id
    if business:
        search_dict['business'] = business
    task_obj = TaskTemplet.objects.filter(**search_dict).order_by("-createTime")
    #  分页
    page = int(request.GET.get('page', 1))# 第几页
    size = int(request.GET.get('size', 10))
    size = 1 if size < 1 else size# 每页
    task_list = Paginator(object_list=task_obj, per_page=size)#  per_page条数据为一页，实例化分页对象
    try:
        page_obj = task_list.page(page)
    except PageNotAnInteger:
        page_obj = task_list.page(1)  #  首次进入给第一页
        page = 1
    except EmptyPage:
        page_obj = task_list.page(task_list.num_pages)  #  空页给最后一页
        page = task_list.num_pages
    
    data = []
    for task_item in page_obj:
        data.append({
            "id": task_item.pk,
            "user": task_item.user,
            "updateUser": task_item.update_user,
            "templetName": task_item.name,
            "business": task_item.business,
            "type": task_item.thetype.name,
            "updateTime": task_item.update_time,
            "createTime": task_item.createTime,
            "templetUrl": r"static/static/file/" + task_item.templet,
        })
    context = {"task_list":data, "page": page,
                "size": size, "total": task_list.count}
    result = return_result(status=True, code=200, message="查询用户列表成功",data=context)
    return result





