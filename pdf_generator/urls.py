from django.urls import path, include
from.views import *
urlpatterns = [
    path('releve/<int:CNE>/', generate_relevee_note, name='generate_relevee_note'),
]