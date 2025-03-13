from django.shortcuts import render,redirect
from django.contrib import messages
from mainapp.models import User
from mainapp.models import Feedback
from adminapp.models import Videos
# Create your views here.

def alogin(request):
    if request.method == "POST":
        email=request.POST.get("email")
        pswd=request.POST.get("pwd")
        # print(email,pswd)
        if email == "admin" and pswd == "admin":
            messages.success(request,'Successfully logged in')
            return redirect('dash')
        else:
            messages.warning(request,'Incorrect Details')
            return redirect('alogin')  
    return render(request,'maintemplate/admin-admin-login.html')

def dash(request):
    user1=User.objects.all().count()
    feedb=Feedback.objects.all().count()
    pending_users=User.objects.filter(status="pending").count()
    accepted_users = User.objects.filter(status="accepted").count()
    # print(user1)
    data={"x":user1,"y":feedb,"z":pending_users,"a":accepted_users}
    
    return render(request,'admintemplate/admin-dashborad.html',data)

def pending(request):
    details=User.objects.filter(status="pending")
    detail={"pending":details}
    # print(details)
    return render(request,'admintemplate/admin-pending-users.html',detail)

def all(request):
    detail=User.objects.all()
    det={"all":detail}
    return render(request,'admintemplate/admin-all-users.html',det)

def manage(request):
    manage_details=Videos.objects.all()
    man_details={"manage_detail":manage_details}
    return render(request,'admintemplate/admin-manage.html',man_details)

def upload(request):
    if request.method =="POST":
        title=request.POST.get("title")
        url=request.POST.get("url")
        categorey=request.POST.get("emotions")
        # print(title,url,categorey)

        video_id = url.split("si=")[1]
        video = video_id.split("&")
        # print(video[0], '1')
        # print(video_id)
        embed_url = f"https://open.spotify.com/playlist/4oukLaAw2SOWhnVHxmkqAu?{video[0]}"
        # print(embed_url)
        
        Videos.objects.create(Title=title,Url=embed_url,Emotions=categorey)
        messages.success(request,'Playlist Upload Successfully')
        return redirect('upload')
    return render(request,'admintemplate/admin-upload.html')

def upload2(request,id):
    Video_details=Videos.objects.get(index=id)
    context={"i":Video_details}
    if request.method == "POST":
        title=request.POST.get("title")
        url=request.POST.get("url")
        categorey=request.POST.get("cate")
        Video_details.Title=title
        Video_details.Url=url
        Video_details.Emotions=categorey
        Video_details.save()
        messages.info(request,'changes have made successfully')
        
    return render(request,'admintemplate/admin-upload2.html',context)

def senti(request):
    feed_details=Feedback.objects.all().order_by("Feedback_id") 
    feed_det={"feed":feed_details}
    return render(request,'admintemplate/admin-feedback-sentiment.html',feed_det)

def graph(request):
    v_positive = Feedback.objects.filter(sentiment="very positive").count()
    positive = Feedback.objects.filter(sentiment="positive").count()
    neutral = Feedback.objects.filter(sentiment="neutral").count()
    negative = Feedback.objects.filter(sentiment="negative").count()
    v_negative = Feedback.objects.filter(sentiment="very negative").count()
    # print(v_positive,positive,neutral,negative,v_negative)
    return render(request,'admintemplate/admin-feedback-graph.html',{"i":v_positive,"j":positive,"k":neutral,"l":negative,"m":v_negative})

def detect(request):
    users2=User.objects.all()
    user_2={"u":users2}
    return render(request,'admintemplate/admin-detection.html',user_2)

def accept(request,id):
    #to get details of specific id
    status_update=User.objects.get(user_id=id)
    #to change the status
    status_update.status = "accepted"
    #saving the details
    status_update.save()
    return redirect('pending')

def reject(request,id):
    status_reject=User.objects.get(user_id=id)
    status_reject.status = "rejected"
    status_reject.save()
    return redirect('pending')

def change_status(request,id):
    status_change=User.objects.get(user_id=id)
    if status_change.status == "accepted" :
        status_change.status = "restricted"
        status_change.save()
        return redirect('all')
    elif status_change.status =="pending":
        status_change.status = "pending"
        status_change.save()
        return redirect('all')
    else:
        status_change.status = "accepted"
        status_change.save()
        return redirect('all')
def remove(request,id):
    status_delete = User.objects.get(user_id=id)
    status_delete.delete()
    return redirect('all')

def delete(request,id):
    video_details = Videos.objects.get(index=id)
    video_details.delete()
    return redirect('manage')

def logout(request):
    messages.info(request,'You have been logged out')
    return redirect('alogin')