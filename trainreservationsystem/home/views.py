from datetime import datetime

from django.shortcuts import render

from django.views.generic import TemplateView

from book.models import train_detail
import datetime

# Create your views here.



def home(request):
    data = {""}
    for i in train_detail.objects.all():
        route = i.route
        route = route.split(",")
        for statn in route:
            data.add(statn)
    if 'stationname' not in request.session:
        request.session['stationname'] = list(data)
    sysdate = str(datetime.datetime.now()).split(" ")

    if('NOPNR' in request.session):
        del request.session['NOPNR']
        return render(request, 'home.html', {'stationname': data, 'date': sysdate[0],'mmm':'INVALID PNR'})
    elif('PNR' in request.session):
        del request.session['PNR']
        return render(request, 'home.html', {'stationname': data,'date': sysdate[0],'mmm':'TICKETS ARE SUCCESSFULLY CANCELLED'})
    elif('INVALIDSTATION' in request.session):
        del request.session['INVALIDSTATION']
        return render(request, 'home.html', {'stationname': data, 'date': sysdate[0],'same':'same'})
    else:
        return render(request, 'home.html', {'stationname': data, 'date': sysdate[0]})