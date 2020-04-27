from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'addnewpassword/', views.addnewpassword),
    url(r'forgotpassword/', views.forgotpassword),
    url(r'newpassword/', views.newpassword),
    url(r'registration/', views.registration),
    url(r'registrationdata/', views.registrationdata),
    url(r'verification/', views.verification),
    url(r'logout/', views.logout),
    url(r'login/', views.login),
    url(r'editprofile/', views.editprofile),
    url(r'editdata/', views.editdata),
    url(r'', views.login),
]