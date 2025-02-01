from django.urls import path, include
from.views import *
urlpatterns = [
    path('releve/<int:CNE>/', generate_relevee_note, name='generate_relevee_note'),
    path('attestation/<int:CNE>/', generate_Attestation, name='generate_att'),
path('CarteETD/<int:CNE>/', generate_Student_Card, name='generate_att'),
path('GroupesTP/', generate_TpGroupes, name='generate_att'),
    path('edt/<int:week_number>/', generate_edt, name='generate_edt'),
]