from django.contrib import admin
from .models import Contacto

class ContactoAdmin(admin.ModelAdmin):
    list_display = ('id','nombre', 'apellido','telefono', 'email','mensaje',)

admin.site.register(Contacto, ContactoAdmin)
