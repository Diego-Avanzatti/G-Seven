from django.urls import path
from .views import CrearComentario, EditarComentarios, EliminarComentario, listar_comentarios

app_name = 'apps.comentarios'

urlpatterns = [
    path('comentarios/', listar_comentarios, name='comentarios'),
    path('post/<int:pk>/agregar_comentario/', CrearComentario.as_view(), name='agregar_comentario'),
    path('comentario/<int:pk>/editar/', EditarComentarios.as_view(), name='editar_comentario'),
    path('comentario/<int:pk>/eliminar/', EliminarComentario.as_view(), name='eliminar_comentario'),
]
