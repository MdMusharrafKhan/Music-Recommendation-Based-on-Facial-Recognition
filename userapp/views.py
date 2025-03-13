from django.shortcuts import render,redirect
from django.contrib import messages
from mainapp.models import User
from mainapp.models import Feedback
from userapp.models import Emotions
from adminapp.models import Videos
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import cv2
from fer import FER
from PIL import Image
# Create your views here.
def login(request):
    if request.method=="POST":
        email=request.POST.get("email")
        pswd=request.POST.get("pwd")
        # print(email,pswd)
        try:
            us=User.objects.get(email=email,password=pswd)
            request.session["user_id"]=us.user_id
            if us.status == "pending":
                messages.info(request,'Your account is on pending')
                return redirect('login')
            else:    
                messages.success(request,'Login Successful !')
                return redirect('dashboard')
        except:
            messages.warning(request,'Incorrect Details')
            return redirect('login')
    return render(request,'maintemplate/admin-user-login.html')

def dashboard(request):
    users=User.objects.all().count()
    feeder=Feedback.objects.all().count()
    con={"i":users,"j":feeder}
    # print(users,feeder)
    return render(request,'usertemplate/admin-user-dashboard.html',con)


    
#happy neutral sad surprise fear disgust angry

def emotion(request):
    return render(request,'usertemplate/admin-user-emotion-detection.html')

cont = {}
def take_picture(request):
    u_id = request.session["user_id"]
    u_data = User.objects.get(user_id = u_id)
    try:

        # create a VideoCapture object to open the default webcam
        cap = cv2.VideoCapture(0)

        while True:
        # read the video stream frame by frame
            ret, frame = cap.read()
            
            # show the frame in a window called "Webcam"
            cv2.imshow("Webcam", frame)
            
            # wait for the user to press 'c' to capture the frame
            if cv2.waitKey(1) & 0xFF == ord('c'):
            # save the captured frame as a variable called "image"
                image = frame
                break
            
        # wait for the user to press 'q' to quit the loop
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
        # release the webcam and close all windows
        cap.release()
        cv2.destroyAllWindows()

        # save the captured image variable as a file
        image2 = cv2.imwrite('captured_image1.jpg', image)
        detector = FER()

        v = detector.detect_emotions('captured_image1.jpg')

        # print(v[0]["emotions"])

        dict = v[0]["emotions"]

        hk = max(dict, key=dict.get)
        print(hk, 'detected emotion')
        global cont
        cont={'img':'captured_image1.jpg'}
        # print(cont,"aaaaaaaaaaaa")
        messages.info(request,f'Your emotion is {hk}')
        u_data.Emotion = hk
        # type(hk, 'type')
        u_data.save()
        return redirect('emotiond', hk)

    except:
        print('except')
        return redirect('emotion')
    
def emotiond(request, emo):
    emotions = Videos.objects.filter(Emotions = emo)
    u_id = request.session["user_id"]
    u_data = User.objects.get(user_id = u_id)
    return render(request,'usertemplate/admin-user-emotion detected.html', {'emot':emotions, 'emotion':u_data.Emotion})

def ufeedback(request):
    id=request.session["user_id"]
    uusser=User.objects.get(user_id=id)
    if request.method == "POST":
        rating=request.POST.get("rate")
        feed=request.POST.get("FeedBack")
        if not rating:
            messages.info(request,'give rating')
            return redirect('ufeedback')
        sid=SentimentIntensityAnalyzer()
        score=sid.polarity_scores(feed)
        sentiment=None
        if score['compound']>0 and score['compound']<=0.5:
            sentiment='positive'
        elif score['compound']>=0.5:
            sentiment='very positive'
        elif score['compound']<-0.5:
            sentiment='very negative'
        elif score['compound']<0 and score['compound']>=-0.5:
            sentiment='negative'
        else :
            sentiment='neutral'
        print(sentiment)        
        print(rating,feed)
        Feedback.objects.create(rating=rating,review=feed,sentiment=sentiment,reviewer=uusser)
        messages.info(request,'Feedback recorded')
        return redirect('ufeedback')
    return render(request,'usertemplate/admin-user-feedback.html')

def uprofile(request):
    userid=request.session["user_id"]
    usser=User.objects.get(user_id=userid)
    context={"i":usser}
    # print(fname,lname,email,phone,city)
    if request.method=="POST" :
        firstname=request.POST.get("firstname")
        lastname=request.POST.get("lastname")
        phonenum=request.POST.get("contact")
        address=request.POST.get("city")
        if len(request.FILES)!=0:
            img=request.FILES['image']
            usser.fname=firstname
            usser.lname=lastname
            usser.phone=phonenum
            usser.city=address
            usser.img=img
            usser.save()
            messages.info(request,'Changes Updated')
            print(img,firstname,lastname,phonenum,address)
            return redirect('uprofile')
        else:
            usser.fname=firstname
            usser.lname=lastname
            usser.phone=phonenum
            usser.city=address
            usser.save()
            messages.info(request,'Changes Updated')
            print(firstname,lastname,phonenum,address)
            return redirect('uprofile')
    return render(request,'usertemplate/admin-user-myprofile.html',context)

def logout(request):
    messages.info(request,'You have logged out')
    return redirect('login')

