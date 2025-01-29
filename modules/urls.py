from django.urls import path, include
from.views import *
urlpatterns = [
path('list/', get_modules_xml, name='students_xml'),
]