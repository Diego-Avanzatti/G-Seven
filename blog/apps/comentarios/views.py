from django.shortcuts import get_object_or_404, render
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, DeleteView
from apps.posts.models import Post
from .forms import ComentarioForm
from .models import Comentario
from django.http import Http404
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib import messages

class CrearComentario(LoginRequiredMixin, CreateView):
    model = Comentario
    form_class = ComentarioForm
    template_name = 'comentarios/agregar_comentario.html'

    def form_valid(self, form):
        post = get_object_or_404(Post, pk=self.kwargs['pk'])
        form.instance.usuario = self.request.user
        form.instance.post = post
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('apps.posts:post_individual', kwargs={'pk': self.kwargs['pk']})


class EditarComentarios(LoginRequiredMixin, UpdateView):
    model = Comentario
    fields = ['texto']
    template_name = 'comentarios/agregar_comentario.html'

    def get_object(self, queryset=None):
        comentario = super().get_object(queryset)
        if comentario.usuario != self.request.user:
            raise Http404("No tienes permiso para editar este comentario")
        return comentario

    def form_valid(self, form):
        messages.success(self.request, "Comentario actualizado correctamente")
        return super().form_valid(form)

    def get_success_url(self):
        return reverse_lazy('apps.posts:post_individual', kwargs={'pk': self.object.post.pk})


class EliminarComentario(LoginRequiredMixin, DeleteView):
    model = Comentario
    template_name = 'genericos/confirma_eliminar.html'

    def get_queryset(self):
        if self.request.user.is_staff or self.request.user.is_superuser:
            return Comentario.objects.all()
        return Comentario.objects.filter(usuario=self.request.user)

    def get_success_url(self):
        return reverse_lazy('apps.posts:post_individual', kwargs={'pk': self.object.post.pk})




def listar_comentarios(request):
    comentarios = Comentario.objects.all().order_by('-fecha',)
    context = {
        'comentarios': comentarios
    }
    return render(request, 'comentarios/comentarios.html', context= context)

