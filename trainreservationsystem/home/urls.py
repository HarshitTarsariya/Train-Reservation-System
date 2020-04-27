from django.conf.urls import url
from home import views

urlpatterns = [
    url(r'', views.home),
    url(r'home/',views.home),
]