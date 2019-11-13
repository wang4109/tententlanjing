# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0013_auto_20191106_0948'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='content',
            name='daily',
        ),
        migrations.RemoveField(
            model_name='daily',
            name='templet',
        ),
        migrations.RemoveField(
            model_name='daily',
            name='user',
        ),
        migrations.RemoveField(
            model_name='dailytemplet',
            name='user',
        ),
        migrations.RemoveField(
            model_name='item',
            name='users',
        ),
        migrations.RemoveField(
            model_name='role',
            name='menus',
        ),
        migrations.RemoveField(
            model_name='role',
            name='permissions',
        ),
        migrations.RemoveField(
            model_name='user',
            name='roles',
        ),
        migrations.DeleteModel(
            name='Content',
        ),
        migrations.DeleteModel(
            name='Daily',
        ),
        migrations.DeleteModel(
            name='DailyTemplet',
        ),
        migrations.DeleteModel(
            name='Item',
        ),
        migrations.DeleteModel(
            name='Permission',
        ),
        migrations.DeleteModel(
            name='Role',
        ),
        migrations.DeleteModel(
            name='User',
        ),
    ]
