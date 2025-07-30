from django.urls import path
from .views import DetailUsuario, EliminarUsuario, RegistarUsuario, listar_usuarios, ActualizarUsuarios, logout_then_login
from django.contrib.auth.views import LoginView

app_name = 'apps.usuarios'

urlpatterns = [
    # Mostrar lista de usuarios (solo admin o staff)
    path('usuarios/', listar_usuarios, name='usuarios'),

    # Registrar un nuevo usuario
    path('registrar_usuario/', RegistarUsuario.as_view(), name='registrar_usuario'),

    # Eliminar un usuario por su pk (solo admin o el mismo usuario)
    path('eliminar_usuario/<int:pk>/', EliminarUsuario.as_view(), name='eliminar_usuario'),

    # Ver detalle de un usuario por su pk (perfil)
    path('usuarios/<int:pk>/', DetailUsuario.as_view(), name='usuario'),

    # Página para iniciar sesión (login)
    path('iniciar_sesion/', LoginView.as_view(template_name='usuarios/login.html'), name='iniciar_sesion'),

    # Cerrar sesión (logout y redirigir)
    path('cerrar_sesion/', logout_then_login, name='cerrar_sesion'),

    # Actualizar datos del usuario (solo su propio perfil)
    path('actualizar_usuario/<int:pk>/', ActualizarUsuarios.as_view(), name='actualizar_usuarios'),
]
