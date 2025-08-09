from django.shortcuts import render
from django.http import HttpResponseNotFound

def index(request):
    return render(request, 'index.html')

def pagina_404(request, exception):
    return render(request,'genericos/404.html')