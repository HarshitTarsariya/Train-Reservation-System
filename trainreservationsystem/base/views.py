from django.shortcuts import render
from django.template.context_processors import csrf
# Create your views here.

def aboutus(request):
    c = {}
    c.update(csrf(request))
    if 'username' in request.session:
        return render(request , 'aboutus.html' ,{'msg':'login'} )
    else:
        return render(request, 'aboutus.html')

def contactus(request):
    c = {}
    c.update(csrf(request))
    if 'username' in request.session:
        return render(request , 'contactus.html' ,{'msg':'login'} )
    else:
        return render(request, 'contactus.html')