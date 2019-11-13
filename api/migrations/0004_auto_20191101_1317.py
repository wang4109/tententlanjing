# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_auto_20191101_1312'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='templettype',
            table='rp_templet_type',
        ),
    ]
