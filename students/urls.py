from django.urls import path, include
import os
from .views import *
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

urlpatterns = [
    path('list/', get_students_xml, name='students_xml'),
path('generate_tp_groups/', generate_tp_groups, name='generate_tp_groups'),
path('generate_tp_groups/', generate_tp_groups, name='generate_tp_groups'),

]


