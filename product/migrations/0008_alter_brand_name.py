# Generated by Django 5.0.3 on 2024-03-15 17:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0007_remove_brand_name_ru_remove_brand_name_tm_brand_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='brand',
            name='name',
            field=models.CharField(max_length=100, verbose_name='Name'),
        ),
    ]