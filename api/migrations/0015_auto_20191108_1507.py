# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0014_auto_20191106_1407'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tasktemplet',
            name='templet_uid',
        ),
        migrations.AddField(
            model_name='tasktemplet',
            name='templet_content',
            field=models.TextField(default=1, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe5\x86\x85\xe5\xae\xb9'),
            preserve_default=False,
        ),
    ]
