# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0009_tasktemplet_templet_uid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tasktemplet',
            name='templet_uid',
            field=models.CharField(max_length=40, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbfUID'),
        ),
    ]
