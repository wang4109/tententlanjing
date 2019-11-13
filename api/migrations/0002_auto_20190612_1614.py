# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='daily',
            name='contents',
        ),
        migrations.AddField(
            model_name='content',
            name='daily',
            field=models.ForeignKey(default=1, verbose_name=b'\xe6\x97\xa5\xe6\x8a\xa5\xe8\xa1\xa8', to='api.Daily'),
            preserve_default=False,
        ),
    ]
