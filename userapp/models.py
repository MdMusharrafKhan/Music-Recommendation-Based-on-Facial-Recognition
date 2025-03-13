from django.db import models

# Create your models here.

class Emotions(models.Model):
    sno = models.AutoField(primary_key=True)
    image = models.ImageField(upload_to='Images/emotions')
    emotions = models.TextField(max_length=25,null=True)

    class Meta:
        db_table = "Emotion_data"