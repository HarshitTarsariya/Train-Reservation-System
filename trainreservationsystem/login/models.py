from django.db import models

# Create your models here.
class passenger_detail(models.Model):
    username = models.CharField(max_length=15, primary_key=True)
    password = models.CharField(max_length=14)
    full_name = models.CharField(max_length=50)
    gender = models.CharField(max_length=10)
    birth_date = models.DateField()
    mobile_no = models.CharField(max_length=10)
    email_address = models.EmailField()