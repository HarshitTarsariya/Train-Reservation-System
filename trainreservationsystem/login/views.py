from django.shortcuts import render
from django.template.context_processors import csrf
from login.models import passenger_detail
from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponse, HttpResponseRedirect
import math , random
import datetime

# Create your views here.
def login(request):
    c = {}
    c.update(csrf(request))
    return render(request,'login.html',c)

def verification(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    for i in passenger_detail.objects.all():
        if username == i.username and password == i.password:
            request.session['username'] = username
            request.session['email'] = i.email_address
            if 'book' in request.session:
                return HttpResponseRedirect('/book/book/')
            else:
                return HttpResponseRedirect('/home/')
    else:
        return render(request, 'login.html', {'error': 'INVALID CREDENTIALS'})

def registration(request):
    c = {}
    c = c.update(csrf(request))
    return render(request, 'registration.html', c)

def registrationdata(request):
    firstname = request.POST.get('firstname')
    lastname = request.POST.get('lastname')
    username = request.POST.get('username')
    email = request.POST.get('email')
    mobileno = request.POST.get('mobileno')
    gender = request.POST.get('gender')
    birthdate = request.POST.get('birthdate')
    pass1 = request.POST.get('password')
    pass2 = request.POST.get('confirmpassword')
    for i in passenger_detail.objects.all():
        if username == i.username:
            return render(request, 'registration.html', {'error': 'This username is already taken!!'})
    if pass1 == pass2:
        s = passenger_detail(full_name=firstname+" "+lastname, username=username, email_address=email,
                             password=pass1, birth_date=birthdate, mobile_no=mobileno, gender=gender)
        s.save()
        request.session['username'] = username
        request.session['email'] = email
        if 'book' in request.session:
            return HttpResponseRedirect('/book/book/')
        else:
            return HttpResponseRedirect('/home/')
    else:
        return render(request, 'registration.html', {'error': 'Re Enter same password!!'})

def logout(request):
    del request.session['username']
    del request.session['email']
    return HttpResponseRedirect('/home/')

def forgotpassword(request):
    c = {}
    c = c.update(csrf(request))
    return render(request, 'forgotpassword.html', c)

def newpassword(request):
    c = {}
    c = c.update(csrf(request))
    username = request.POST.get('username')
    request.session['name2'] = username
    digits = "0123456789"
    OTP = ""
    for i in range(6):
        OTP += digits[math.floor(random.random() * 10)]
    for i in passenger_detail.objects.all():
        if i.username == username:
            subject = 'OTP '
            message = '<noreply>This is machine generated donot reply \n\n\n Your OTP is ' + OTP
            from_admin = settings.EMAIL_HOST_USER
            to_users_list = [i.email_address]
            send_mail(subject, message, from_admin, to_users_list, fail_silently=True)
            request.session['otp'] = OTP
            return render(request, 'newpassword.html', c)
    else:
        return render(request, 'forgotpassword.html', {'error': 'INVALID USERNAME'})

def addnewpassword(request):
    if request.session.get('otp') is None:
        password = request.POST.get('password', '')
        cpass = request.POST.get('confirmpassword', '')
        if password != cpass:
            return render(request, 'newpassword.html', {'error': 'Can not change password. Your both Passwords are different'})
        else:
            target = passenger_detail.objects.get(username=request.session['name2'])
            target.password = password
            target.save()
            del request.session['name2']
            return render(request, 'login.html', {'msg': 'Password successfully changed.'})
    else:
        otp = request.POST.get('otp')
        if otp == request.session['otp']:
            del request.session['otp']
            return render(request, 'newpassword.html')
        else:
            return render(request, 'newpassword.html', {'error': 'Enter correct OTP'})


def editprofile(request):
    c = {}
    c = c.update(csrf(request))
    a = passenger_detail.objects.get(username=request.session['username'])
    data = []
    temp = {}
    temp["fullname"] = a.full_name
    if a.gender == "male":
        temp["male"] = a.gender
    else:
        temp["female"] = a.gender
    bdate = str(a.birth_date)
    birthdate = datetime.datetime.strptime(bdate, '%Y-%m-%d').strftime('%Y-%m-%d')
    temp["birthdate"] = birthdate
    temp["mobileno"] = a.mobile_no
    temp["email"] = a.email_address
    data.append(temp)
    return render(request, 'editprofile.html', {'detail': data})

def editdata(request):
    c = {}
    c = c.update(csrf(request))
    a = passenger_detail.objects.get(username=request.session['username'])
    fullname = request.POST.get('fullname')
    email = request.POST.get('email')
    mobileno = request.POST.get('mobileno')
    gender = request.POST.get('gender')
    birthdate = request.POST.get('birthdate')
    a.full_name = fullname
    a.email_address = email
    a.gender = gender
    a.mobile_no = mobileno
    a.birth_date = birthdate
    a.save()
    return HttpResponseRedirect('/home/')