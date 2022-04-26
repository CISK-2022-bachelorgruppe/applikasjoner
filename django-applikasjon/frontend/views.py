from django.shortcuts import render
from api.models import AppDB
# Create your views here.



def forside(request):
    db = AppDB.objects.all()
    db = db[::-1]

    verdi = 0
    for i in range(1, 50000):
       verdi += 1
       verdi = verdi * i

    verdier = {
        "db": db,
    }
    return render(request, 'front.html', verdier)
