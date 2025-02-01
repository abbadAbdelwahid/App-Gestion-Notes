from django.shortcuts import render

# Create your views here.
# dashboard/views.py
from django.shortcuts import render

def main_dashboard(request):
    return render(request, 'index.html')
