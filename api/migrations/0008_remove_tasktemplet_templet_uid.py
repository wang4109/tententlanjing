# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0007_auto_20191104_1401'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tasktemplet',
            name='templet_uid',
        ),
    ]
