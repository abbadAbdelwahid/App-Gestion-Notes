from django.urls import path, include
from.views import *
urlpatterns = [
    path('releve/<int:CNE>/', generate_relevee_note, name='generate_relevee_note'),
    path('attestation/scolarite/<int:CNE>/', generate_Attestation, name='generate_att'),
path('carte/etudiant/', generate_Student_Card, name='generate_Student_Card'),
path('groupes/tp/', generate_TpGroupes, name='generate_TpGroupes'),
    path('edt/<int:week_number>/', generate_edt, name='generate_edt'),
]

