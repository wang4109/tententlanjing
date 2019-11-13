# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Content',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('value_json', models.TextField(verbose_name=b'\xe6\x97\xa5\xe6\x8a\xa5\xe5\x86\x85\xe5\xae\xb9')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe6\x9c\x80\xe5\x90\x8e\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'rp_content',
                'verbose_name_plural': '\u65e5\u62a5\u5185\u5bb9\u8868',
            },
        ),
        migrations.CreateModel(
            name='Daily',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=35, verbose_name=b'\xe6\x97\xa5\xe6\x8a\xa5\xe5\x90\x8d\xe7\xa7\xb0')),
                ('itemID', models.CharField(default=0, max_length=11, verbose_name=b'\xe9\xa1\xb9\xe7\x9b\xae\xe7\xbb\x84ID')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe6\x9c\x80\xe5\x90\x8e\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('contents', models.ManyToManyField(to='api.Content')),
            ],
            options={
                'db_table': 'rp_daily',
                'verbose_name_plural': '\u65e5\u62a5\u8868',
            },
        ),
        migrations.CreateModel(
            name='DailyTemplet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=35, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe5\x90\x8d\xe7\xa7\xb0')),
                ('content', models.TextField(verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe5\x86\x85\xe5\xae\xb9')),
                ('status', models.CharField(default=0, max_length=11, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe7\x8a\xb6\xe6\x80\x81')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe6\x9c\x80\xe5\x90\x8e\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'rp_daily_templet',
                'verbose_name_plural': '\u65e5\u62a5\u6a21\u677f\u8868',
            },
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=12, verbose_name=b'\xe9\xa1\xb9\xe7\x9b\xae\xe7\xbb\x84\xe5\x90\x8d\xe7\xa7\xb0')),
                ('creater', models.CharField(max_length=32, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe4\xba\xba')),
                ('desc', models.CharField(max_length=32, null=True, verbose_name=b'\xe9\xa1\xb9\xe7\x9b\xae\xe7\xbb\x84\xe6\x8f\x8f\xe8\xbf\xb0', blank=True)),
                ('status', models.CharField(max_length=4, verbose_name=b'\xe6\x9d\x83\xe9\x99\x90\xe7\x8a\xb6\xe6\x80\x81')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'rp_item',
                'verbose_name_plural': '\u9879\u76ee\u7ec4\u8868',
            },
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=32, verbose_name=b'\xe8\x8f\x9c\xe5\x8d\x95\xe6\xa0\x87\xe9\xa2\x98')),
                ('icon', models.CharField(max_length=32, null=True, verbose_name=b'\xe8\x8f\x9c\xe5\x8d\x95\xe5\x9b\xbe\xe6\xa0\x87')),
                ('name', models.CharField(max_length=32, verbose_name=b'\xe8\x8f\x9c\xe5\x8d\x95\xe5\x90\x8d\xe5\xad\x97')),
                ('link', models.CharField(max_length=64, verbose_name=b'URL')),
                ('weigh', models.IntegerField(null=True, verbose_name=b'\xe6\x9d\x83\xe9\x87\x8d', blank=True)),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('father_menu', models.ForeignKey(blank=True, to='api.Menu', null=True)),
            ],
            options={
                'db_table': 'rp_menu',
                'verbose_name_plural': '\u83dc\u5355\u76ee\u5f55',
            },
        ),
        migrations.CreateModel(
            name='Permission',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=32, verbose_name=b'\xe6\x9d\x83\xe9\x99\x90\xe5\x90\x8d\xe7\xa7\xb0')),
                ('url', models.CharField(max_length=256, verbose_name=b'\xe5\xaf\xb9\xe5\xba\x94\xe8\xb7\xaf\xe5\xbe\x84')),
                ('code', models.CharField(max_length=32, verbose_name=b'\xe5\x88\xab\xe5\x90\x8d')),
                ('desc', models.CharField(max_length=32, null=True, verbose_name=b'\xe6\x9d\x83\xe9\x99\x90\xe6\x8f\x8f\xe8\xbf\xb0', blank=True)),
                ('status', models.CharField(default=b'1', max_length=4, verbose_name=b'\xe6\x9d\x83\xe9\x99\x90\xe7\x8a\xb6\xe6\x80\x81')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe6\x9d\x83\xe9\x99\x90\xe6\x9c\x80\xe5\x90\x8e\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'rp_permission',
                'verbose_name_plural': '\u6743\u9650\u8868',
            },
        ),
        migrations.CreateModel(
            name='Role',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=32, verbose_name=b'\xe8\xa7\x92\xe8\x89\xb2\xe5\x90\x8d\xe7\xa7\xb0')),
                ('rolecode', models.CharField(max_length=4, verbose_name=b'\xe8\xa7\x92\xe8\x89\xb2\xe7\xbc\x96\xe7\xa0\x81')),
                ('status', models.CharField(max_length=4, verbose_name=b'\xe8\xa7\x92\xe8\x89\xb2\xe7\x8a\xb6\xe6\x80\x81')),
                ('desc', models.CharField(max_length=32, null=True, verbose_name=b'\xe8\xa7\x92\xe8\x89\xb2\xe6\x8f\x8f\xe8\xbf\xb0', blank=True)),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe8\xa7\x92\xe8\x89\xb2\xe6\x9c\x80\xe5\x90\x8e\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
                ('menus', models.ManyToManyField(to='api.Menu', verbose_name=b'\xe4\xb8\x8e\xe8\x8f\x9c\xe5\x8d\x95\xe5\xa4\x9a\xe5\xaf\xb9\xe5\xa4\x9a\xe7\xbb\x91\xe5\xae\x9a')),
                ('permissions', models.ManyToManyField(to='api.Permission', verbose_name=b'\xe4\xb8\x8e\xe6\x9d\x83\xe9\x99\x90\xe5\xa4\x9a\xe5\xaf\xb9\xe5\xa4\x9a\xe7\xbb\x91\xe5\xae\x9a')),
            ],
            options={
                'db_table': 'rp_role',
                'verbose_name_plural': '\u89d2\u8272\u8868',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('username', models.CharField(unique=True, max_length=32)),
                ('nickname', models.CharField(max_length=32)),
                ('email', models.EmailField(unique=True, max_length=254)),
                ('phone', models.CharField(max_length=11)),
                ('surperman', models.IntegerField(default=0, verbose_name=b'\xe8\xb6\x85\xe7\xba\xa7\xe7\xae\xa1\xe7\x90\x86\xe5\x91\x98')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('roles', models.ManyToManyField(to='api.Role')),
            ],
            options={
                'db_table': 'rp_user',
                'verbose_name_plural': '\u7528\u6237\u8868',
            },
        ),
        migrations.AddField(
            model_name='item',
            name='users',
            field=models.ManyToManyField(to='api.User'),
        ),
        migrations.AddField(
            model_name='dailytemplet',
            name='user',
            field=models.ForeignKey(verbose_name=b'\xe6\x8b\xa5\xe6\x9c\x89\xe8\x80\x85', blank=True, to='api.User', null=True),
        ),
        migrations.AddField(
            model_name='daily',
            name='templet',
            field=models.ForeignKey(verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbfID', to='api.DailyTemplet', null=True),
        ),
        migrations.AddField(
            model_name='daily',
            name='user',
            field=models.ForeignKey(verbose_name=b'\xe6\x8b\xa5\xe6\x9c\x89\xe8\x80\x85', to='api.User'),
        ),
    ]
