from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'showtrain/', views.showtrain),
    url(r'book/', views.book),
    url(r'payment/', views.payment),
    url(r'cancelticket/', views.cancelticket),
    url(r'prefinal/', views.prefinal),
    url(r'getdetails/',views.getdetails),
]