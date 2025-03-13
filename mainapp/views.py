from django.shortcuts import render,redirect
from mainapp.models import *
# Create your views here.
def home(request):
    return render(request,'maintemplate/admin-home.html')

def about(request):
    return render(request,'maintemplate/admin-aboutus.html')

def contact(request):
    if request.method == "POST":
        first_name=request.POST.get("firstname")
        last_name=request.POST.get("lastname")
        contact=request.POST.get("Phone Number")
        email_id=request.POST.get("Email")
        place=request.POST.get("country")
        sub=request.POST.get("text")
        print(first_name,last_name,contact,email_id,place,sub)
        Contact.objects.create(firstname=first_name,lastname=last_name,Phonenumber=contact,Email_Id=email_id,country=place,subject=sub)
    return render(request,'maintemplate/admin-contactus.html')

def register(request):
    if request.method =="POST" and request.FILES['img']:
        email=request.POST.get("email")
        firstname=request.POST.get("fname")
        lastname=request.POST.get("lname")
        phone=request.POST.get("phonenum")
        city=request.POST.get("city")
        password=request.POST.get("pwd")
        image=request.FILES['img']
        print(email,firstname,lastname,phone,city,password,image)
        User.objects.create(email=email,fname=firstname,lname=lastname,phone=phone,city=city,password=password,img=image)
        return redirect('register')
    return render(request,'maintemplate/admin-regestration.html')