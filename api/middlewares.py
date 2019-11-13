#  -*- coding: utf-8 -*-
'''
@author: Swain
@contact: 624420781@qq.com
@file: middlewares.py
@time: 2019/04/01 下午 15:10
'''
from django.db.models import F
from django.conf import settings
import re
from common.public_method import return_result,bk_user
from django.shortcuts import redirect
from django.contrib.auth import authenticate
from api.models import User,Menu,Permission,Role
import json
class RbacMiddleware(object):
    """
    检查用户的url请求是否是其权限范围内
    """
    def process_view(self, request, view, args, kwargs):
        
        request_url = request.path_info
        username = request.user
        #  如果不是api接口，放行
        if not re.match('^/api/', request_url):
            return None
        user = User.objects.filter(username=username).first()
        if not user:
            user_info = bk_user(str(username))
            data ={}
            data['username'] = username
            data['nickname'] = user_info['chname']
            data['email'] = user_info['email']
            data['phone'] = user_info['phone']
            role_obj = Role.objects.filter(id = 1)
            user_obj = User.objects.create(**data)
            user_obj.roles.add(*role_obj)
            # user = User.objects.filter(username=username).first()
            user = user_obj

        request.userobj = user

        #考试没要求权限控制
        return None

        if user.surperman:
            permission_list = Permission.objects.annotate(permissions__url=F('url')).values('permissions__url')
        else:
            permission_list = user.roles.values('permissions__url').distinct()

        # 权限数据处理
        permissions = [each['permissions__url'] for each in permission_list]

        if not permissions:
            return return_result(status=False, code=500, message="没有获取到用户权限信息!")

        #  如果请求url在白名单，放行
        for url in settings.SAFE_URL:
            if url == request_url:
                return None

        if request_url in permissions:
            return None
        else:
            return return_result(status=False, code=500, message="没有权限访问")
