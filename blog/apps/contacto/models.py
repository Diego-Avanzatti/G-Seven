from django.db import models

class Contacto(models.Model):
    nombre = models.CharField(max_length=50, null=False, blank=False)
    apellido = models.CharField(max_length=50, null=False, blank=False)
    email = models.EmailField(null=False, blank=False)
    telefono = models.CharField(max_length=30)
    mensaje = models.TextField(max_length=300)
    fecha = models.DateField(auto_now_add=True)

    def __str__(self):
        return f'{{self.nombre}} {{self.apellido}} - {{self.email}}'

    class Meta:
        ordering = ("-fecha",)

        