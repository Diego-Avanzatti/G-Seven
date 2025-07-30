from django.conf import settings
from django.http import Http404
from django.shortcuts import redirect, render, resolve_url
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, DeleteView, DetailView

from apps.comentarios.models import Comentario
from apps.posts.models import Post
from .models import Usuario
from .forms import RegistroUsuarioForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required


# Vista para registrar nuevos usuarios normales (no admin ni staff).
# Encripta la contraseña y evita crear usuarios con permisos especiales.

class RegistarUsuario(CreateView):
    model = Usuario
    form_class = RegistroUsuarioForm
    template_name = 'usuarios/registrar.html'
    success_url = reverse_lazy('apps.usuarios:iniciar_sesion')

    def form_valid(self, form):
        usuario = form.save(commit=False)
        password = form.cleaned_data.get('password')
        if password:
            usuario.set_password(password)
        usuario.is_superuser = False
        usuario.is_staff = False
        usuario.save()
        return super().form_valid(form)
    

# Función para listar usuarios.
# Si el usuario es admin o staff, muestra todos los usuarios.

@login_required
def listar_usuarios(request):
    if request.user.is_staff or request.user.is_superuser:
        usuarios = Usuario.objects.filter(is_superuser=False, is_staff=False)

        context = {
        'usuarios': usuarios
        }
    return render(request, 'usuarios/usuarios.html', context=context)




# Vista detalle para mostrar la información de un solo usuario.
# Solo permite acceso a usuarios logueados.

class DetailUsuario(LoginRequiredMixin, DetailView):
    model = Usuario
    template_name = 'usuarios/usuario.html'
    context_object_name = 'usuario'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        usuario = self.object
        context['posts'] = Post.objects.filter(creador=usuario).order_by('-fecha')
        return context


# Vista para que un usuario autenticado actualice su propio perfil.
# Evita que un usuario edite el perfil de otro usuario (con Http404).
# Muestra un mensaje de éxito cuando el perfil se actualiza correctamente.


class ActualizarUsuarios(LoginRequiredMixin, UpdateView):
    model = Usuario
    template_name = 'usuarios/actualizar_usuario.html'
    fields = ['nombre', 'apellido', 'email', 'fecha_nacimiento', 'imagen']
    success_url = reverse_lazy('apps.usuarios:usuario')


    def dispatch(self, request, *args, **kwargs):
        if request.user.pk != self.kwargs.get('pk'):
            raise Http404("No tenés permiso para editar este perfil.")
        return super().dispatch(request, *args, **kwargs)


    def form_valid(self, form):
        messages.success(self.request, 'Perfil actualizado correctamente.')
        return super().form_valid(form)
    
# Vista para eliminar usuarios autenticados.
# Permite a admin eliminar cualquier usuario.
# Usuarios normales solo pueden eliminarse a sí mismos.

class EliminarUsuario(LoginRequiredMixin, DeleteView):
    model = Usuario
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('apps.usuarios:usuarios')

    def get_queryset(self):
        if self.request.user.is_superuser or self.request.user.is_staff:
            return Usuario.objects.all()
        return Usuario.objects.filter(pk=self.request.user.pk)


# Función para cerrar sesión y redirigir al login.

def logout_then_login(request):
    logout(request)
    login_url = resolve_url(settings.LOGOUT_REDIRECT_URL)
    return redirect(login_url)