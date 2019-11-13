# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0015_auto_20191108_1507'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tasktemplet',
            name='templet_content',
        ),
        migrations.AddField(
            model_name='tasktemplet',
            name='templet',
            field=models.CharField(default=1, max_length=50, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe5\x86\x85\xe5\xae\xb9'),
            preserve_default=False,
        ),
    ]
