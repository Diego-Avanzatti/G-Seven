from django.urls import path
from .views import CrearComentario, EditarComentarios, EliminarComentario, listar_comentarios

app_name = 'apps.comentarios'

urlpatterns = [
    path('comentarios/', listar_comentarios, name='comentarios'),
    path('post/<int:pk>/agregar_comentario/', CrearComentario.as_view(), name='agregar_comentario'),
    path('editar_comentario/<int:pk>/', EditarComentarios.as_view(), name='editar_comentarios'),
    path('eliminar_comentario/<int:pk>/', EliminarComentario.as_view(), name='eliminar_comentarios'),
]
