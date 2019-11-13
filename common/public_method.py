#  -*- coding: utf-8 -*-
'''
@author: Swain
@contact: 624420781@qq.com
@file: public_method.py
@time: 2019/03/29 上午 10:43
'''

import json
from account.http import http_post
import time,datetime
from django.http import JsonResponse,FileResponse
from common.log import logger
import base64
import random
import io
from django.conf import settings
import xlrd
def return_result(status,code,message,data=[]):
    '''返回序列化后的结果'''
    if status:
        result = {"status":True,"code":code,"message":message,"data":data}
    else:
        result = {"status": False,"code":code, "message": message,"data":data}
        logger.error(message)
    return JsonResponse(result)

def htmltostr(data):
    '''html参数转义'''
    result = data.replace('&nbsp;', ' ').replace('&#39;', "'").replace('&lt;', '<').replace('&gt;', '>').replace(
        '&quot;', '''"''').replace('&amp;', '&')
    return result

def dealExcel(content):
    """处理文件"""
    try:
        data = xlrd.open_workbook(content)

        #取第一个sheet
        table = data.sheet_by_index(0)
    
        #获取总行数：sheet1.nrows;获取总列数：sheet1.ncols
        nrows = table.nrows
        parm_data = []
        merge = []

        step = ''
        step_num = 0
        rol = 0
        queue = [0]
        for i in range(1, nrows):
            if table.row(i)[0].value:
                step = table.row(i)[0].value
                if step_num != 0:
                    merge.append({
                            "row": queue.pop(0), "col": 0, "rowspan": step_num, "colspan": 1
                        })
                    queue.append(rol)
                step_num = 0
            if not check_string(step + table.row(i)[2].value + table.row(i)[3].value + table.row(i)[4].value):
                logger.warning(u"导入模版失败%s", e)
                return False,u'模板包含非法字符，请检查!'
            rol += 1
            step_num += 1
            parm_data.append({
                'step': step,
                'id': rol,
                'operate_attention': table.row(i)[2].value,
                'comment': table.row(i)[3].value,
                'responser': table.row(i)[4].value,
            })
        merge.append({
                "row": queue.pop(0), "col": 0, "rowspan": step_num, "colspan": 1
            })
        return True,{'parm_data':parm_data,'merge':merge}
    except Exception, e:
        logger.warning(u"导入模版失败")
        return False,u"导入模版失败"

def check_string(s):
    '''校验字符串是否含不合法参数,返回true表示不含不合法参数'''
    danger = ['`', '~', '@', '#', '$', '^', '&', '*', '=', '|', '{', '}', "'", ':', '"',
                '\\', '[', '/', ']', '<', '>', '/', '?']
    if any(i in s for i in danger):
        return False
    return True

def date_conversion(data):
    '''日期字符串转换datetime对象'''
    conversion_time = datetime.datetime.strptime(data, "%Y-%m-%d %H:%M:%S")
    return conversion_time


def base64_encode(content):
    """base64编码"""
    return base64.b64encode(content)


def base64_decode(content):
    """base64解码"""
    return base64.b64decode(content)

def get_unique_id():
    '''生成唯一ID，时间精确到毫秒再组合随机5位数字'''
    result = '{0:%Y%m%d%H%M%S%f}'.format(datetime.datetime.now()) + ''.join(
        [str(random.randint(1, 10)) for i in range(5)])
    return result

def dump_word(content):
    '''导出word'''
    doc = htmltostr(content)
    name = get_unique_id()+'.doc'
    response =FileResponse(base64_decode(DUMP_WORD_HEADER)+doc+base64_decode(DUMP_WORD_FOOTER))
    response['Content-Type']='application/octet-stream'
    response['Content-Disposition']='attachment;filename="{0}"'.format(name)
    return response

def post_url(url,data):
    '''post请求'''
    data['app_code'] = settings.APP_ID
    data['app_secret'] = settings.APP_TOKEN
    result, resp = http_post(settings.BK_PAAS_HOST+url, data)
    resp = resp if result and resp else {}
    ret = resp.get('result', False)
    res = resp.get('data', {})
    message = resp.get('message','用户信息获取失败')
    code = 200 if ret else 500 
    return ret,code,message,res

def bk_user(name):
    data = {'bk_username':name}
    status,code,message,data = post_url('/api/c/compapi/v2/bk_login/get_user/', data)
    return data

DUMP_WORD_HEADER = "TWltZS1WZXJzaW9uOiAxLjAKQ29udGVudC1CYXNlOiBodHRwOi8vd3d3LmNuYmxvZ3MuY29tL0NHQ29uZy8KQ29udGVudC1UeXBlOiBNdWx0aXBhcnQvcmVsYXRlZDsgYm91bmRhcnk9Ik5FWFQuSVRFTS1CT1VOREFSWSI7dHlwZT0idGV4dC9odG1sIgoKLS1ORVhULklURU0tQk9VTkRBUlkKQ29udGVudC1UeXBlOiB0ZXh0L2h0bWw7IGNoYXJzZXQ9InV0Zi04IgpDb250ZW50LUxvY2F0aW9uOiBodHRwOi8vd3d3LmNuYmxvZ3MuY29tL0NHQ29uZy8KCjwhRE9DVFlQRSBodG1sPgo8aHRtbCB4bWxuczp2PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOnZtbCIKeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIgp4bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIgp4bWxuczptPSJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiCnhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4KPGhlYWQ+CjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4KPHN0eWxlPgp0YWJsZSB7CiAgICBib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOwp9CnRhYmxlewogICAgd2lkdGg6MTAwJTsKfQp0YWJsZSB0ZCB7CiAgICBib3JkZXItd2lkdGg6IDFweDsKICAgIGhlaWdodDogMjVweDsKICAgIGJvcmRlci1zdHlsZTogc29saWQ7Cn0KPC9zdHlsZT4KPCEtLVtpZiBndGUgbXNvIDldPjx4bWw+PHc6V29yZERvY3VtZW50Pjx3OlZpZXc+UHJpbnQ8L3c6Vmlldz48dzpUcmFja01vdmVzPmZhbHNlPC93OlRyYWNrTW92ZXM+PHc6VHJhY2tGb3JtYXR0aW5nLz48dzpWYWxpZGF0ZUFnYWluc3RTY2hlbWFzLz48dzpTYXZlSWZYTUxJbnZhbGlkPmZhbHNlPC93OlNhdmVJZlhNTEludmFsaWQ+PHc6SWdub3JlTWl4ZWRDb250ZW50PmZhbHNlPC93Oklnbm9yZU1peGVkQ29udGVudD48dzpBbHdheXNTaG93UGxhY2Vob2xkZXJUZXh0PmZhbHNlPC93OkFsd2F5c1Nob3dQbGFjZWhvbGRlclRleHQ+PHc6RG9Ob3RQcm9tb3RlUUYvPjx3OkxpZFRoZW1lT3RoZXI+RU4tVVM8L3c6TGlkVGhlbWVPdGhlcj48dzpMaWRUaGVtZUFzaWFuPlpILUNOPC93OkxpZFRoZW1lQXNpYW4+PHc6TGlkVGhlbWVDb21wbGV4U2NyaXB0PlgtTk9ORTwvdzpMaWRUaGVtZUNvbXBsZXhTY3JpcHQ+PHc6Q29tcGF0aWJpbGl0eT48dzpCcmVha1dyYXBwZWRUYWJsZXMvPjx3OlNuYXBUb0dyaWRJbkNlbGwvPjx3OldyYXBUZXh0V2l0aFB1bmN0Lz48dzpVc2VBc2lhbkJyZWFrUnVsZXMvPjx3OkRvbnRHcm93QXV0b2ZpdC8+PHc6U3BsaXRQZ0JyZWFrQW5kUGFyYU1hcmsvPjx3OkRvbnRWZXJ0QWxpZ25DZWxsV2l0aFNwLz48dzpEb250QnJlYWtDb25zdHJhaW5lZEZvcmNlZFRhYmxlcy8+PHc6RG9udFZlcnRBbGlnbkluVHhieC8+PHc6V29yZDExS2VybmluZ1BhaXJzLz48dzpDYWNoZWRDb2xCYWxhbmNlLz48dzpVc2VGRUxheW91dC8+PC93OkNvbXBhdGliaWxpdHk+PHc6QnJvd3NlckxldmVsPk1pY3Jvc29mdEludGVybmV0RXhwbG9yZXI0PC93OkJyb3dzZXJMZXZlbD48bTptYXRoUHI+PG06bWF0aEZvbnQgbTp2YWw9IkNhbWJyaWEgTWF0aCIvPjxtOmJya0JpbiBtOnZhbD0iYmVmb3JlIi8+PG06YnJrQmluU3ViIG06dmFsPSItLSIvPjxtOnNtYWxsRnJhYyBtOnZhbD0ib2ZmIi8+PG06ZGlzcERlZi8+PG06bE1hcmdpbiBtOnZhbD0iMCIvPiA8bTpyTWFyZ2luIG06dmFsPSIwIi8+PG06ZGVmSmMgbTp2YWw9ImNlbnRlckdyb3VwIi8+PG06d3JhcEluZGVudCBtOnZhbD0iMTQ0MCIvPjxtOmludExpbSBtOnZhbD0ic3ViU3VwIi8+PG06bmFyeUxpbSBtOnZhbD0idW5kT3ZyIi8+PC9tOm1hdGhQcj48L3c6V29yZERvY3VtZW50PjwveG1sPjwhW2VuZGlmXS0tPgo8L2hlYWQ+Cjxib2R5Pgo="

DUMP_WORD_FOOTER = "PC9ib2R5Pgo8L2h0bWw+Ci0tTkVYVC5JVEVNLUJPVU5EQVJZLS0K"


