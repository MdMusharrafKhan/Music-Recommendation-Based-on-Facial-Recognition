from django.db import models

# Create your models here.

class Videos(models.Model):
    index=models.AutoField(primary_key=True)
    Title=models.CharField(max_length=250)
    Url = models.CharField(max_length=250)
    Emotions=models.CharField(max_length=250)
    date_time=models.DateTimeField(auto_now=True)
    