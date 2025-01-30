from django.urls import path, include
from.views import *
urlpatterns = [
    path('affichage/normal/<str:module_code>/', get_notes_before_ratt, name='get_notes_before_ratt'),
    path('affichage/ratt/<str:module_code>/', get_notes_after_ratt, name='get_notes_after_ratt'),
]