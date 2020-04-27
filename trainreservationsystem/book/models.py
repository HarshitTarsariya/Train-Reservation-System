from django.db import models
from login.models import passenger_detail

# Create your models here.

class train_detail(models.Model):
    train_no = models.AutoField(primary_key=True)
    train_name = models.CharField(max_length=30)
    no_of_seat = models.IntegerField()
    route = models.CharField(default = '' , max_length=100000)
    distance = models.CharField(default = '',max_length=100000)
    time = models.CharField(default = '',max_length=100000)


class detail(models.Model):
    pnr_no = models.IntegerField(primary_key=True)
    train_no = models.ForeignKey(train_detail, on_delete=models.CASCADE,default='')
    no_of_passenger = models.IntegerField()
    date = models.DateField()
    username = models.ForeignKey(passenger_detail, on_delete=models.CASCADE)
    train_class = models.CharField(default = '' ,max_length=100)
    departure_station = models.CharField(default = '',max_length=100)
    arrival_station = models.CharField(default='', max_length=100)
    departure_station_rdist = models.IntegerField(default=0)
    arrival_station_rdist = models.IntegerField(default=0)

class booked_passenger_details(models.Model):
    pnr_no = models.ForeignKey(detail, on_delete=models.CASCADE)
    f_name = models.CharField(default='',max_length=200)
    l_name = models.CharField(default='', max_length=200)
    age = models.IntegerField(default = 0 )

class daily(models.Model):
    train_no = models.ForeignKey(train_detail,on_delete=models.CASCADE)
    first_class = models.IntegerField(default=0)
    second_class = models.IntegerField(default=0)
    date = models.DateField()