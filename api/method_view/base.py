#  -*- coding: utf-8 -*-
'''
@author: Swain
@contact: 624420781@qq.com
@file: base.py
@time: 2019/03/29 上午 9:43
@description: 基础类接口，框架的基本功能
'''
from django.db.models import F
from common.public_method import return_result,post_url
from api.models import Menu
import operator

#获取菜单项（去掉RBAC）
def get_menus(request):
    menu_list = Menu.objects.values('weigh','id','title','icon','name','url','father_menu_id')

    # 菜单数据处理
    menu_list_url = {}
    for each in menu_list:
        if each['father_menu_id']:
            if str(each['father_menu_id']) in menu_list_url:
                menu_list_url[str(each['father_menu_id'])]['children'].append({'title': each['title'],
                                                        'name': each['name'],'icon': each['icon'],
                                                        'url':each['url'] ,'weigh':each['weigh']})
            else:
                menu_list_url[str(each['father_menu_id'])] = {}
                menu_list_url[str(each['father_menu_id'])]['children'] = [{'title': each['title'],'icon': each['icon'],
                                                        'name': each['name'],'url':each['url'],'weigh':each['weigh']}]
        else:
            if str(each['id']) in menu_list_url:
                menu_list_url[str(each['id'])]['title'] = each['title']
                menu_list_url[str(each['id'])]['icon'] = each['icon']
                menu_list_url[str(each['id'])]['name'] = each['name']
                menu_list_url[str(each['id'])]['url'] = each['url']
                menu_list_url[str(each['id'])]['weigh'] = each['weigh']
            else:
                menu_list_url[str(each['id'])]={}
                menu_list_url[str(each['id'])]['title'] = each['title']
                menu_list_url[str(each['id'])]['icon'] = each['icon']
                menu_list_url[str(each['id'])]['name'] = each['name']
                menu_list_url[str(each['id'])]['url'] = each['url']
                menu_list_url[str(each['id'])]['weigh'] = each['weigh']
                menu_list_url[str(each['id'])]['children'] = []  
    themenus = list(menu_list_url.values())
    menus = sorted(themenus, key=operator.itemgetter('weigh'))
    return return_result(status=True, code=200, message="获取菜单成功",data=menus)

def get_name(request):
    name = str(request.user)
    return return_result(status=True, code=200, message="获取用户名成功",data=name)

def testa(request):
    data = {'bk_username':'swain'}
    status,code,message,data = post_url('/api/c/compapi/v2/bk_login/get_all_users/', data)
    return return_result(status,code,message,data)




# def get_menus(request):
#     user = request.userobj
#     if user.surperman:
#         menu_list = Menu.objects.annotate(menus__name=F('name'),menus__father_menu_id=F('father_menu_id'),menus__id=F('id'),menus__title=F('title'),menus__weigh=F('weigh'),menus__url=F('url'),menus__icon=F('icon')).values('menus__weigh','menus__id','menus__title','menus__icon','menus__name','menus__url', 
#                                             'menus__father_menu_id',)
#     else:
#         menu_list = user.roles.values('menus__weigh','menus__id','menus__title','menus__icon','menus__name','menus__url', 
#                                             'menus__father_menu_id',).distinct()
#     # 菜单数据处理
#     menu_list_url = {}
#     for each in menu_list:
#         if each['menus__father_menu_id']:
#             if str(each['menus__father_menu_id']) in menu_list_url:
#                 menu_list_url[str(each['menus__father_menu_id'])]['children'].append({'title': each['menus__title'],
#                                                         'name': each['menus__name'],'icon': each['menus__icon'],
#                                                         'url':each['menus__url'] ,'weigh':each['menus__weigh']})
#             else:
#                 menu_list_url[str(each['menus__father_menu_id'])] = {}
#                 menu_list_url[str(each['menus__father_menu_id'])]['children'] = [{'title': each['menus__title'],'icon': each['menus__icon'],
#                                                         'name': each['menus__name'],'url':each['menus__url'],'weigh':each['menus__weigh']}]
#         else:
#             if str(each['menus__id']) in menu_list_url:
#                 menu_list_url[str(each['menus__id'])]['title'] = each['menus__title']
#                 menu_list_url[str(each['menus__id'])]['icon'] = each['menus__icon']
#                 menu_list_url[str(each['menus__id'])]['name'] = each['menus__name']
#                 menu_list_url[str(each['menus__id'])]['url'] = each['menus__url']
#                 menu_list_url[str(each['menus__id'])]['weigh'] = each['menus__weigh']
#             else:
#                 menu_list_url[str(each['menus__id'])]={}
#                 menu_list_url[str(each['menus__id'])]['title'] = each['menus__title']
#                 menu_list_url[str(each['menus__id'])]['icon'] = each['menus__icon']
#                 menu_list_url[str(each['menus__id'])]['name'] = each['menus__name']
#                 menu_list_url[str(each['menus__id'])]['url'] = each['menus__url']
#                 menu_list_url[str(each['menus__id'])]['weigh'] = each['menus__weigh']
#                 menu_list_url[str(each['menus__id'])]['children'] = []  
#     themenus = list(menu_list_url.values())
#     menus = sorted(themenus, key=operator.itemgetter('weigh'))
#     return return_result(status=True, code=200, message="获取菜单成功",data=menus)







