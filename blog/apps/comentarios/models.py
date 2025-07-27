from django.db import models
from apps.posts.models import Post
from apps.usuarios.models import Usuario


class Comentario(models.Model):
    usuario = models.ForeignKey(Usuario,on_delete=models.CASCADE)
    post = models.ForeignKey(Post,on_delete=models.CASCADE, related_name='comentarios')
    texto = models.TextField()
    fecha = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return f'Comentario: {self.usuario.username} - {self.post.titulo}.'
    
