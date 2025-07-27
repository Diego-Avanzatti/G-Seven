from django.urls import path
from .views import DetailPost, listar_posts, EliminarPost, CrearPost, ActualizarPost, EliminarPost
from .views import listar_generos, EliminarGenero, AgregarGenero, ActualizarGenero, EliminarGenero
from .views import listar_plataformas, EliminarPlataforma, AgregarPlataforma, ActualizarPlataforma, EliminarPlataforma

app_name = 'apps.posts'

urlpatterns = [
    #-----urls---posts------
    path('posts/', listar_posts ,name='posts'),
    path('posts/<int:pk>/', DetailPost.as_view() ,name='post_individual'),
    path('eliminar_post/<int:pk>/', EliminarPost.as_view() ,name='eliminar_post'),
    path('agregar_post/', CrearPost.as_view() ,name='agregar_post'),
    path('actualizar_post/<int:pk>/', ActualizarPost.as_view() ,name='actualizar_post'),

    #-----urls---generos-----
    path('generos/', listar_generos ,name='generos'),
    path('eliminar_genero/<int:pk>/', EliminarGenero.as_view() ,name='eliminar_genero'),
    path('agregar_genero/', AgregarGenero.as_view() ,name='agregar_genero'),
    path('actualizar_genero/<int:pk>/', ActualizarGenero.as_view() ,name='actualizar_genero'),

    #-----urls---plataformas------
    path('plataformas/', listar_plataformas ,name='plataformas'),
    path('eliminar_plataforma/<int:pk>/', EliminarPlataforma.as_view() ,name='eliminar_plataforma'),
    path('agregar_plataforma/', AgregarPlataforma.as_view() ,name='agregar_plataforma'),
    path('actualizar_plataforma/<int:pk>/', ActualizarPlataforma.as_view() ,name='actualizar_plataforma'),

   
]