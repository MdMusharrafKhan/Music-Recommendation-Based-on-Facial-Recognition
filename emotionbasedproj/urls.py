"""emotionbasedproj URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from mainapp import views as maintempate_views
from userapp import views as usertemplate_views
from adminapp import views as admintemplate_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    #main
    path('',maintempate_views.home,name="home"),
    path('login',usertemplate_views.login,name="login"),
    path('alogin',admintemplate_views.alogin,name="alogin"),
    path('about',maintempate_views.about,name="about"),
    path('contact',maintempate_views.contact,name="contact"),
    path('register',maintempate_views.register,name="register"),
    #user
    path('dashboard',usertemplate_views.dashboard,name="dashboard"),
    path('emotion',usertemplate_views.emotion,name="emotion"),
    path('emotiond/<str:emo>',usertemplate_views.emotiond,name="emotiond"),
    path('ufeedback',usertemplate_views.ufeedback,name="ufeedback"),
    path('uprofile',usertemplate_views.uprofile,name="uprofile"),
    #admin
    path('dash',admintemplate_views.dash,name="dash"),
    path('pending',admintemplate_views.pending,name="pending"),
    path('all',admintemplate_views.all,name="all"),
    path('manage',admintemplate_views.manage,name="manage"),
    path('upload',admintemplate_views.upload,name="upload"),
    path('upload2/<int:id>',admintemplate_views.upload2,name="upload2"),
    path('senti',admintemplate_views.senti,name="senti"),
    path('graph',admintemplate_views.graph,name="graph"),
    path('detect',admintemplate_views.detect,name="detect"),
    path('user_accept/<int:id>',admintemplate_views.accept,name="accept"),
    path('user_reject/<int:id>',admintemplate_views.reject,name="reject"),
    path('user_change_status/<int:id>',admintemplate_views.change_status,name="change_status"),
    path('user_remove/<int:id>',admintemplate_views.remove,name="remove"),
    path('video_delete/<int:id>',admintemplate_views.delete,name="delete"),
    path('logout',admintemplate_views.logout,name="alogout"),
    path('user_logout',usertemplate_views.logout,name="logout"),
    path('take_picture',usertemplate_views.take_picture,name="take_picture"),
    # path('upload',usertemplate_views.upload,name="upload"),
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
