from django.db import models
from apps.usuarios.models import Usuario


class Genero(models.Model):
    genero = models.CharField("Género", max_length=150, null=False,blank=False)

    def __str__(self):
        return self.genero
    
class Plataforma(models.Model):
    plataforma = models.CharField("Plataforma", max_length=150, null=False,blank=False)

    def __str__(self):
        return self.plataforma

class Post(models.Model):
    creador = models.ForeignKey(Usuario, verbose_name="Creador",on_delete=models.CASCADE, related_name='posts')
    titulo = models.CharField("Título", max_length=50, null=False,blank=False)
    subtitulo = models.CharField("Subtítulo", max_length=150, null=False,blank=True)
    fecha = models.DateTimeField("Fecha de Creación", auto_now_add=True)
    descripcion = models.TextField("Descripción", null=False)
    genero = models.ForeignKey(Genero, verbose_name="Género", on_delete=models.SET_NULL, null=True, default='S/N')
    plataforma = models.ForeignKey(Plataforma, verbose_name="Plataforma", on_delete=models.SET_NULL, null=True, default='S/N')
    imagen_post = models.ImageField("Imagen del post", null=True,blank=True, upload_to='posts/', default='posts/img_post.png')

    class Meta:
        ordering = ('-fecha',)
        verbose_name = "Publicación"
        verbose_name_plural = "Publicaciones"

    def __str__(self):
        return self.titulo
    

    def delete(self, using = None, keep_parents = False):
        self.imagen_post.delete(self.imagen_post.name)
        return super().delete()

