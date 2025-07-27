from .models import Usuario
from django.contrib.auth.forms import UserCreationForm



class RegistroUsuarioForm(UserCreationForm):
    
    class Meta:
        model = Usuario
        fields = ['username', 'password1', 'password2', 'nombre', 'apellido', 'email', 'fecha_nacimiento',
                  'imagen']

 



