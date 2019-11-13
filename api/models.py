#  -*- coding: utf-8 -*-
from django.db import models

#  Create your models here.
'''
@author: Swain
@contact: 624420781@qq.com
@file: models.py
@time: 2019/03/27 上午 9:43
'''

'''菜单目录'''
class Menu(models.Model):
    title = models.CharField(max_length=32,verbose_name="菜单标题")
    icon = models.CharField(max_length=32,verbose_name="菜单图标",null=True)
    name = models.CharField(max_length=32,verbose_name="菜单名字")
    url = models.CharField(max_length=64,verbose_name="URL")
    father_menu = models.ForeignKey('self',blank=True, null=True)
    weigh = models.IntegerField(verbose_name='权重', blank=True, null=True)
    createTime = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    def __str__(self):
        return self.title
    class Meta:
        db_table = 'rp_menu'
        verbose_name_plural = '菜单目录'

# --------------------------------------New---------------------------------------
"""业务模板"""
class TaskTemplet(models.Model):
    user = models.CharField(max_length=11,verbose_name="创建者",blank=True, null=True)
    update_user = models.CharField(max_length=11,verbose_name="更新者",blank=True, null=True)
    name = models.CharField(max_length=35, verbose_name='模板名称',null=False)
    templet = models.CharField(max_length=50,verbose_name='模板内容')
    business = models.CharField(max_length=35, verbose_name='业务名称',null=False)
    thetype = models.ForeignKey("TempletType",verbose_name="模板类型")   #与模板类型表为外键，模板类型表为母表
    update_time = models.DateTimeField(verbose_name='最后修改时间', auto_now=True)
    createTime = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    def __str__(self):
        return self.name
    class Meta:
        db_table = 'rp_task_templet'
        verbose_name_plural = '业务模板表'

"""模板类型表"""
class TempletType(models.Model):
    name = models.CharField(max_length=12, verbose_name='模板类型',unique=True)
    createTime = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
    def __str__(self):
        return self.name
    class Meta:
        db_table = 'rp_templet_type'
        verbose_name_plural = '模板类型表'














# '''用户表'''
# class User(models.Model):
#     username = models.CharField(max_length=32,unique=True)
#     nickname = models.CharField(max_length=32)
#     email = models.EmailField(unique=True)
#     phone = models.CharField(max_length=11)
#     surperman = models.IntegerField(verbose_name='超级管理员',default=0)
#     roles = models.ManyToManyField("Role")#  定义用户和角色的多对多关系
#     createTime = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
#     def __str__(self):
#         return self.username
#     class Meta:
#         db_table = 'rp_user'
#         verbose_name_plural = '用户表'

# """角色表，多对多绑定权限,菜单"""
# class Role(models.Model):
#     name = models.CharField(max_length=32, verbose_name='角色名称')
#     rolecode = models.CharField(max_length=4, verbose_name='角色编码')  #  ‘1000’普通用户  ‘9999’超级管理员
#     status = models.CharField(max_length=4, verbose_name='角色状态')  #  ‘0’代表锁定，‘1’代表启用
#     desc = models.CharField(max_length=32, verbose_name='角色描述', blank=True, null=True)
#     permissions = models.ManyToManyField('Permission', verbose_name='与权限多对多绑定')
#     menus = models.ManyToManyField('Menu', verbose_name='与菜单多对多绑定')
#     update_time = models.DateTimeField(verbose_name='角色最后修改时间', auto_now=True)
#     def __str__(self):
#         return self.name
#     class Meta:
#         db_table = 'rp_role'
#         verbose_name_plural = '角色表'

# """权限表，接口权限表"""
# class Permission(models.Model):
#     name = models.CharField(max_length=32, verbose_name='权限名称')
#     url = models.CharField(max_length=256, verbose_name='对应路径')
#     code = models.CharField(max_length=32, verbose_name='别名')   # 菜单权限code
#     desc = models.CharField(max_length=32, verbose_name='权限描述', blank=True, null=True)
#     status = models.CharField(max_length=4, verbose_name='权限状态',default='1')  #  “0”代表禁用，“1”代表启用
#     update_time = models.DateTimeField(verbose_name='权限最后修改时间', auto_now=True)
#     def __str__(self):
#         return self.name
#     class Meta:
#         db_table = 'rp_permission'
#         verbose_name_plural = '权限表'

# """项目组表"""
# class Item(models.Model):
#     name = models.CharField(max_length=12, verbose_name='项目组名称',unique=True)
#     creater = models.CharField(max_length=32,verbose_name='创建人')
#     users = models.ManyToManyField("User")#  定义项目组和所属用户
#     desc = models.CharField(max_length=32, verbose_name='项目组描述', blank=True, null=True)
#     status = models.CharField(max_length=4, verbose_name='权限状态',)  #  “0”代表禁用，“1”代表启用
#     createTime = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)
#     def __str__(self):
#         return self.name
#     class Meta:
#         db_table = 'rp_item'
#         verbose_name_plural = '项目组表'
