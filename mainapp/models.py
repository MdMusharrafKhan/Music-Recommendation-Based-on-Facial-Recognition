from django.db import models

# Create your models here.
class User(models.Model):
    user_id=models.AutoField(primary_key=True)
    email=models.EmailField(max_length=255)
    fname=models.CharField(max_length=255)
    lname=models.CharField(max_length=255)
    phone=models.CharField(max_length=255)
    city=models.CharField(max_length=255)
    password=models.CharField(max_length=255)
    img=models.ImageField(upload_to="Images/user")
    status=models.CharField(default="pending",null=True,max_length=255)
    Emotion = models.CharField(max_length = 100, null = True)

class Feedback(models.Model):
    Feedback_id=models.AutoField(primary_key=True)
    rating=models.CharField(max_length=100,null=True) 
    review=models.CharField(max_length=225,null=True)
    sentiment=models.CharField(max_length=100,null=True)
    reviewer=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
    datetime=models.DateTimeField(auto_now=True)

class Contact(models.Model):
    contact_id=models.AutoField(primary_key=True)
    firstname=models.CharField(max_length=2500,null=True)
    lastname=models.CharField(max_length=250,null=True)
    Phonenumber=models.CharField(max_length=255,null=True)
    Email_Id=models.EmailField(max_length=250,null=True)
    country=models.CharField(max_length=250,null=True)
    subject=models.TextField(null=True)