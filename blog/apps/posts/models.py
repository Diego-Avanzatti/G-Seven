from django.db import models


class Genero(models.Model):
    genero = models.CharField(max_length=150, null=False,blank=False)

    def __str__(self):
        return self.genero
    
class Plataforma(models.Model):
    plataforma = models.CharField(max_length=150, null=False,blank=False)

    def __str__(self):
        return self.plataforma

class Post(models.Model):
    titulo = models.CharField(max_length=50, null=False,blank=False)
    subtitulo = models.CharField(max_length=150, null=False,blank=True)
    fecha = models.DateTimeField(auto_created=True)
    descripcion = models.TextField(null=False)
    genero = models.ForeignKey(Genero, on_delete=models.SET_NULL, null=True, default='S/N')
    plataforma = models.ForeignKey(Plataforma, on_delete=models.SET_NULL, null=True, default='S/N')
    activo = models.BooleanField(default=True)
    imagen_post = models.ImageField(null=True,blank=True, upload_to='posts/', default='posts/img_post.png')

    class Meta:
        ordering = ('-fecha',)

    def __str__(self):
        return self.titulo
    

    def delete(self, using = None, keep_parents = False):
        self.imagen_post.delete(self.imagen_post.name)
        super().delete()

