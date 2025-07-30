from django import forms
from .models import Usuario
from django.contrib.auth.forms import UserCreationForm



class RegistroUsuarioForm(UserCreationForm):
    
    class Meta:
        model = Usuario
        fields = ['username', 'password1', 'password2', 'nombre', 'apellido', 'email', 'fecha_nacimiento',
                  'imagen']

        widgets = {
            'fecha_nacimiento': forms.DateInput(attrs={'type': 'date'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in ['username', 'password1', 'password2']:
            self.fields[field].help_text = ''

