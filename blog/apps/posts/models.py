from django.db import models
from apps.usuarios.models import Usuario


class Genero(models.Model):
    genero = models.CharField(max_length=150, null=False,blank=False)

    def __str__(self):
        return self.genero
    
class Plataforma(models.Model):
    plataforma = models.CharField(max_length=150, null=False,blank=False)

    def __str__(self):
        return self.plataforma

class Post(models.Model):
    creador = models.ForeignKey(Usuario, on_delete=models.CASCADE, related_name='posts')
    titulo = models.CharField(max_length=50, null=False,blank=False)
    subtitulo = models.CharField(max_length=150, null=False,blank=True)
    fecha = models.DateTimeField(auto_now_add=True)
    descripcion = models.TextField(null=False)
    genero = models.ForeignKey(Genero, on_delete=models.SET_NULL, null=True, default='S/N')
    plataforma = models.ForeignKey(Plataforma, on_delete=models.SET_NULL, null=True, default='S/N')
    imagen_post = models.ImageField(null=True,blank=True, upload_to='posts/', default='posts/img_post.png')

    class Meta:
        ordering = ('-fecha',)

    def __str__(self):
        return self.titulo
    

    def delete(self, using = None, keep_parents = False):
        self.imagen_post.delete(self.imagen_post.name)
        return super().delete()

