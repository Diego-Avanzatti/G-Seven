from django.urls import path
from .views import DetailUsuario, EliminarUsuario, RegistarUsuario, listar_usuarios, ActualizarUsuarios, logout_then_login
from django.contrib.auth.views import LoginView


app_name = 'apps.usuarios'

urlpatterns = [
    path('usuarios/', listar_usuarios, name= 'usuarios'),
    path('registrar_usuario/', RegistarUsuario.as_view() ,name='registrar_usuario'),
    path('eliminar_usuario/<int:pk>/', EliminarUsuario.as_view() ,name='eliminar_usuario'),
    path('usuarios/<int:pk>/', DetailUsuario.as_view() ,name='usuario'),
    path('iniciar_sesion/', LoginView.as_view(template_name='usuarios/login.html') ,name='iniciar_sesion'),
    path('cerrar_sesion/', logout_then_login, name='cerrar_sesion'),
    path('actualizar_usuario/<int:pk>/', ActualizarUsuarios.as_view() ,name='actualizar_usuarios'),
] 