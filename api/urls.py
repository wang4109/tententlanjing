#  -*- coding: utf-8 -*-

from django.conf.urls import patterns
from api.method_view import base,task
# from api.method_view import init_user,user

urlpatterns = patterns(
    '',
    #  -----------base--------------
    (r'getMenus/$', base.get_menus),
    (r'getName/$', base.get_name),


    # -----------New--------------
    (r'test/$', task.test),
    (r'getBusiness/$', task.getBusiness),
    (r'getType/$', task.getType),
    (r'addTemplet/$', task.addTemplet),
    (r'delTemplet/$', task.delTemplet),
    (r'loadExcel/$', task.loadExcel),
    (r'templetList/$', task.templetList),

    # -----------user--------------
    # (r'userList/$', user.user_list),
    # (r'roleList/$', user.role_list),
    # (r'bkUserList/$', user.bk_user_list),
    # (r'addUser/$', user.add_user),
    # (r'editRole/$', user.edit_role),
    # (r'delUser/$', user.del_user),
    # (r'addPermissionList/$', init_user.add_permission_list),
)
