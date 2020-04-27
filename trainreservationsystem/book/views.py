from django.shortcuts import render
from django.template.context_processors import csrf
from django.utils.functional import empty

from login.models import passenger_detail
from book.models import detail,daily,booked_passenger_details
from django.core.mail import send_mail
from django.conf import settings
from django.http import HttpResponseRedirect
import datetime
import random
from book.models import train_detail

from operator import itemgetter

# Create your views here.

def showtrain(request):
    c = {}
    c.update(csrf(request))
    dcity = request.POST.get('departcity')
    acity = request.POST.get('arrivedcity')

    if(dcity == acity or dcity == "" or acity == ""):
        request.session['INVALIDSTATION'] = 'INVALIDSTATION'
        return HttpResponseRedirect('/home/')

    date = request.POST.get('date')
    request.session['date'] = date
    request.session['acity'] = acity
    request.session['dcity'] = dcity
    sysdate = str(datetime.datetime.now()).split(" ")
    if date >= sysdate[0]:
        data = []
        for i in train_detail.objects.all():
            route = (i.route).split(",")
            time = (i.time).split(",")
            distance = (i.distance).split(",")

            if(acity not in route or dcity not in route):
                continue

            d_index = route.index(dcity)
            a_index = route.index(acity)

            if(d_index > a_index):
                continue
            arrival_time = time[a_index]
            departure_time = time[d_index]
            temp = {}
            temp["acity"] = acity
            temp["dcity"] = dcity
            temp["aname"] = acity
            temp["dname"] = dcity
            temp["trainno"] = i.train_no
            temp["trainname"] = i.train_name
            temp["distance"] = int(distance[a_index]) - int(distance[d_index])
            temp["atime"] = arrival_time
            temp["dtime"] = departure_time
            temp["price"] = temp["distance"]*2
            temp["date"] = date
            data.append(temp)
        return render(request, 'showtrain.html' , {'avail_trains': data})
    else:
        return HttpResponseRedirect('/home/')

def book(request):
    c = {}
    c.update(csrf(request))
    trainno = int(request.POST.get('trainno'))
    aid = request.POST.get('aid')
    did = request.POST.get('did')
    aname = str(request.POST.get('aname'))
    dname =  str(request.POST.get('dname'))
    date = request.POST.get('date')
    train_class = str(request.POST.get('train_class'))
    route = train_detail.objects.get(train_no = trainno).route
    dist = train_detail.objects.get(train_no=trainno).distance
    time = train_detail.objects.get(train_no=trainno).time
    total_seats = train_detail.objects.get(train_no=trainno).no_of_seat
    route_arr = route.split(",")
    dist_arr = dist.split(",")
    time_arr = time.split(",")
    date = request.session['date']


    cnt=0
    for station in route_arr:
        if(str(station) == dname):
            break
        else:
            cnt += 1
    d_rdist = int(dist_arr[cnt])    #users departure stations relative distance


    d_time = time_arr[cnt]
    cnt = 0
    for station in route_arr:
        if(station == aname):
            break
        else:
            cnt += 1
    a_rdist = int(dist_arr[cnt])

    a_time = time_arr[cnt]

    request.session["atime"] = a_time
    request.session["dtime"] = d_time

    all_booked_record = detail.objects.all()

    if 'username' in request.session:
        data = []
        temp = {}
        temp["aname"] = aname
        temp["dname"] = dname
        temp["trainno"] = trainno
        temp["trainname"] = train_detail.objects.get(train_no=trainno).train_name
        temp["atime"] = a_time
        temp["dtime"] = d_time
        temp["distance"] = a_rdist-d_rdist
        temp["date"] = date
        data.append(temp)

        return render(request, 'booking.html', {"bookdata": data})
    else:
        return HttpResponseRedirect('/login/')

def payment(request):
    c = {}
    c.update(csrf(request))
    trainno = int(request.session["train_no"])
    a_rdist = int(request.session["a_rdist"])
    d_rdist = int(request.session["d_rdist"])
    passenger =  int(request.session["passenger"])
    aname = str(request.session["aname"])
    dname = str(request.session["dname"])
    date = request.session["date"]
    train_class = str(request.session["train_class"])
    username = str(request.session["username"])
    trainname = str(request.session["trainname"])
    atime = str(request.session["atime"])
    dtime = str(request.session["dtime"])

    del request.session["train_no"]
    del request.session["passenger"]
    del request.session["aname"]
    del request.session["dname"]
    del request.session["date"]
    del request.session["train_class"]
    del request.session["d_rdist"]
    del request.session["a_rdist"]
    del request.session["trainname"]
    del request.session["dtime"]
    del request.session["atime"]

    PNR = random.randrange(1000000000, 1100000000)

    price = 0
    query = detail(pnr_no=PNR, no_of_passenger=passenger, date=str(date), train_class=train_class,
                       departure_station=dname, arrival_station=aname, arrival_station_rdist=a_rdist,
                       departure_station_rdist=d_rdist, train_no_id=trainno, username_id=username)
    query.save()
    if (train_class == "first"):
        price = (a_rdist - d_rdist) * 2
    else:
        price = (a_rdist - d_rdist)


    subject = 'Confirmation Mail For Booking'
    message = 'Your booking details are below.' + '\n' + '\nPNR Number:' + str(PNR) + '\nTrain Name:' + trainname + \
              '\nClass:' + train_class + '\nNo. of Passanger:' + str(
        passenger) + '\nArrival City:' + aname + \
              '\nDeparture City:' + dname + '\nArrival Time:' + str(atime) + \
              '\nDeparture Time:' + str(dtime) + \
              '\nDate:' + str(date) + '\nPrice:' + str(price * passenger) + '\nDistance:' + str(
        a_rdist - d_rdist) + 'KM\n\n\nPassenger Details:\n'


    for i in range(passenger):
        fname = str(request.POST.get("fname"+str(i+1)))
        lname = str(request.POST.get("lname" + str(i+1)))
        age = int(request.POST.get("age"+str(i+1)))

        query3 = booked_passenger_details(pnr_no_id = PNR,f_name = fname, l_name = lname, age = age)
        query3.save()

        message += fname + " " +lname+ " " +str(age)+ " \n "

    from_email = settings.EMAIL_HOST_USER
    to_list = [request.session['email']]
    send_mail(subject, message, from_email, to_list, fail_silently=True)

    data = []
    temp = {}
    temp["username"] = username
    temp["trainname"] = trainname
    temp["class"] = train_class
    temp["noofpassenger"] = passenger
    temp["pnr"] = PNR
    temp["dcity"] = dname
    temp["acity"] = aname
    temp["price"] = price*passenger
    temp["distance"] = a_rdist - d_rdist
    temp["date"] = date
    temp["dtime"] = dtime
    temp["atime"] = atime
    data.append(temp)

    return render(request, 'payment.html', {'bookdata': data})

def cancelticket(request):
    if 'username' in request.session:
        c = {}
        c.update(csrf(request))
        pnr_no = int(request.POST.get('pnrno'))
        a = detail.objects.all()
        print(a)

        present = False
        for x in a:
            if x.pnr_no == pnr_no:
                present = True

        if(present == False):
            request.session['NOPNR'] = 'NOPNR'
            return HttpResponseRedirect('/home/')

        detail.objects.get(pnr_no=pnr_no).delete()
        request.session['PNR'] = 'PNR'
        return HttpResponseRedirect('/home/')
    else:
        return HttpResponseRedirect('/login/')

def getdetails(request):
    passenger = request.session["passenger"]
    lst = []

    for i in range(passenger):
        lst.append(i+1)
    return render(request,'getdetails.html',{'totalseats' : lst} )

def prefinal(request):
    all_booked_record = detail.objects.all()
    trainno = int(request.POST.get("trainno"))
    passenger = int(request.POST.get("passenger"))
    route = train_detail.objects.get(train_no=trainno).route
    dist = train_detail.objects.get(train_no=trainno).distance
    time = train_detail.objects.get(train_no=trainno).time
    total_seats = train_detail.objects.get(train_no=trainno).no_of_seat
    trainname = train_detail.objects.get(train_no=trainno).train_name
    route_arr = route.split(",")
    dist_arr = dist.split(",")
    time_arr = time.split(",")
    aname = str(request.POST.get('aname'))
    dname = str(request.POST.get('dname'))
    d_rdist = int(dist_arr[route_arr.index(dname)])
    a_rdist = int(dist_arr[route_arr.index(aname)])
    train_class = str(request.POST.get("train_class"))
    date = str(request.POST.get("date"))

    rem_slots = 0

    for record in all_booked_record:
        if (((int(record.departure_station_rdist) >= d_rdist and a_rdist > int(record.departure_station_rdist)) or (
                d_rdist >= int(record.departure_station_rdist) and d_rdist < int(record.arrival_station_rdist))) and (
                str(record.train_class) == str(train_class)) and (str(record.date) == str(date)) and (
                record.train_no_id == trainno)):
            rem_slots += int(record.no_of_passenger)


    date = request.POST.get("date")
    total_left_capacity = daily.objects.all()

    if( passenger+rem_slots <= int(total_seats/2)):
        a = 1
        first_left = 0
        second_left = 0
        for i in total_left_capacity:
            if(str(i.date) == str(date) and str(i.train_no_id) == str(trainno)):
                first_left = i.first_class
                second_left = i.second_class
                a = 2
                break
        if(a == 1):
            s = daily(train_no_id=trainno,date=date,first_class=  total_seats/2,second_class=total_seats/2)
            s.save()

        url = '/book/getdetails/'
        request.session["aname"] = aname
        request.session["dname"] = dname
        request.session["a_rdist"] = a_rdist
        request.session["d_rdist"] = d_rdist
        request.session["train_no"] = trainno
        request.session["passenger"] = passenger
        request.session["train_class"] = train_class
        request.session["date"] = date
        request.session["trainname"] = trainname
        return HttpResponseRedirect(url)
    else:
        return render(request,'notavailable.html',{'available':'available'})



