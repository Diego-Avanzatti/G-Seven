from django.urls import path
from .views import ContactoView, EliminarConsulta, listar_contactos

app_name = 'apps.contacto'

urlpatterns = [
    path('contactos/', ContactoView.as_view(), name ='contactos'),
    path('consultas/', listar_contactos, name ='consultas'),
    path('eliminar_consulta/<int:pk>/', EliminarConsulta.as_view(), name='eliminar_consulta')

]
