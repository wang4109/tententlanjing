# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20190612_1614'),
    ]

    operations = [
        migrations.CreateModel(
            name='TaskTemplet',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user', models.CharField(max_length=11, null=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe8\x80\x85', blank=True)),
                ('update_user', models.CharField(max_length=11, null=True, verbose_name=b'\xe6\x9b\xb4\xe6\x96\xb0\xe8\x80\x85', blank=True)),
                ('name', models.CharField(max_length=35, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe5\x90\x8d\xe7\xa7\xb0')),
                ('business', models.CharField(max_length=35, verbose_name=b'\xe4\xb8\x9a\xe5\x8a\xa1\xe5\x90\x8d\xe7\xa7\xb0')),
                ('update_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe6\x9c\x80\xe5\x90\x8e\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'rp_task_templet',
                'verbose_name_plural': '\u4e1a\u52a1\u6a21\u677f\u8868',
            },
        ),
        migrations.CreateModel(
            name='TempletType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(unique=True, max_length=12, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe7\xb1\xbb\xe5\x9e\x8b')),
                ('createTime', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
            ],
            options={
                'db_table': 'rp_templet_task',
                'verbose_name_plural': '\u6a21\u677f\u7c7b\u578b\u8868',
            },
        ),
        migrations.RenameField(
            model_name='menu',
            old_name='link',
            new_name='url',
        ),
        migrations.AddField(
            model_name='tasktemplet',
            name='thetype',
            field=models.ForeignKey(verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe7\xb1\xbb\xe5\x9e\x8b', to='api.TempletType'),
        ),
    ]
