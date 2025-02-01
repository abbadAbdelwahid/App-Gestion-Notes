from django.urls import path, include
from.views import *
urlpatterns = [
    path('releve/<int:CNE>/', generate_relevee_note, name='generate_relevee_note'),
    path('edt/<int:week_number>/', generate_edt, name='generate_edt'),
]