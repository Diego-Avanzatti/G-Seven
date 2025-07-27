from django.conf import settings
from django.http import Http404
from django.shortcuts import redirect, render, resolve_url
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, DeleteView, DetailView
from .models import Usuario
from .forms import RegistroUsuarioForm
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required

class RegistarUsuario(CreateView):
    model = Usuario
    form_class = RegistroUsuarioForm
    template_name = 'usuarios/registrar.html'
    success_url = reverse_lazy('apps.usuarios:iniciar_sesion')

    def form_valid(self, form):
        usuario = form.save(commit=False)
        usuario.is_superuser = False
        usuario.is_staff = False
        usuario.save()
        return super().form_valid(form)


@login_required
def listar_usuarios(request):
    if request.user.is_staff or request.user.is_superuser:
        usuarios = Usuario.objects.all()
    else:
        usuarios = Usuario.objects.filter(pk=request.user.pk)
        
    context = {
        'usuarios': usuarios
    }
    return render(request, 'usuarios/usuarios.html', context=context)

class DetailUsuario(DetailView):
    model = Usuario
    template_name = 'usuarios/usuario.html'
    context_object_name = 'usuario'
    queryset = Usuario.objects.all()


class ActualizarUsuarios(LoginRequiredMixin, UpdateView):
    model = Usuario
    template_name = 'usuarios/actualizar_usuario.html'
    fields = ['nombre', 'apellido', 'email', 'fecha_nacimiento', 'imagen']
    success_url = reverse_lazy('index')


    def dispatch(self, request, *args, **kwargs):
        user_id = self.kwargs.get('pk')
        if not (request.user.pk == int(user_id) or request.user.is_staff or request.user.is_superuser):
            raise Http404('No tiene permiso para actualizar este usuario')
        return super().dispatch(request, *args, **kwargs)


    def form_valid(self, form):
        messages.success(self.request, 'Perfil actualizado correctamente')
        return super().form_valid(form)
    

class EliminarUsuario(LoginRequiredMixin, DeleteView):
    model = Usuario
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('apps.usuarios:usuarios')

    def get_queryset(self):
        if self.request.user.is_superuser or self.request.user.is_staff:
            return Usuario.objects.all()
        return Usuario.objects.filter(pk=self.request.user.pk)




def logout_then_login(request):
    logout(request)
    login_url = resolve_url(settings.LOGIN_URL)
    return redirect(login_url)