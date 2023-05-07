"""FinalYearProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
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
from django.urls import path
from main.views import *

urlpatterns = [
    path('home',home,name="home"),
    path('login',login,name="login"),
    path('',landing,name="landing"),
    path('signup',signup,name="signup"),
    path('profile',profile,name="profile"),
    path('admin/', admin.site.urls),

    path('answer/<int:id>',answer),
    path('interview_experience',interview_experience),
    path('placement_help',placement_help),
    path('announcements',announcements),
    path('editprofile',editprofile),
    path('editacc',editacc),
    path('editsocials',editsocials),
    path('changepass',changepass),

    path('replyPost/<int:id>',replyPost),

    path('like/<str:content>/<int:content_id>/<str:like>',likeHandling),
    path('searchHome',searchHome),
    path('searchAnnouncement',searchAnnouncement),
    path('searchInterview',searchInterview),
    path('searchPlacement',searchPlacement),
    path('faq',faq)

]
