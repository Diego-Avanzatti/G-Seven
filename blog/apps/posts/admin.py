from django.contrib import admin
from .models import Genero, Plataforma, Post


@admin.register(Genero)
class GeneroAdmin(admin.ModelAdmin):
    list_display = ('id', 'genero')

@admin.register(Plataforma)
class PlataformaAdmin(admin.ModelAdmin):
    list_display = ('id', 'plataforma')

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('id','titulo', 'subtitulo', 'descripcion', 'imagen_post', 'genero', 'plataforma')
    