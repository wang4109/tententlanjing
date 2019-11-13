# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0005_tasktemplet_templet_uid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tasktemplet',
            name='templet_uid',
        ),
        migrations.AddField(
            model_name='tasktemplet',
            name='templet_uuid',
            field=models.CharField(default=111, max_length=35, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbfUUID'),
            preserve_default=False,
        ),
    ]
