# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_remove_tasktemplet_templet_uid'),
    ]

    operations = [
        migrations.AddField(
            model_name='tasktemplet',
            name='templet_uid',
            field=models.CharField(default=11, max_length=35, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbfUID'),
            preserve_default=False,
        ),
    ]
