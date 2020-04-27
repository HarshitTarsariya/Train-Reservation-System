from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'aboutus/', views.aboutus),
    url(r'contactus/', views.contactus),
]