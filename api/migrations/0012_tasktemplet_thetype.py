# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0011_remove_tasktemplet_thetype'),
    ]

    operations = [
        migrations.AddField(
            model_name='tasktemplet',
            name='thetype',
            field=models.ForeignKey(default=1, verbose_name=b'\xe6\xa8\xa1\xe6\x9d\xbf\xe7\xb1\xbb\xe5\x9e\x8b', to='api.TempletType'),
            preserve_default=False,
        ),
    ]
