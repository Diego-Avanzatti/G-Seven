from django.http import Http404
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic import DetailView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from apps.comentarios.models import Comentario
from .models import Post, Genero, Plataforma
from django.core.paginator import Paginator



class AdminOnlyMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser

    def handle_no_permission(self):
        raise Http404("No tiene permiso para realizar esta acción.")
    

# ----- Género ------
class AgregarGenero(AdminOnlyMixin, CreateView):
    model = Genero
    fields = ['genero']
    template_name = 'posts/generos/agregar_genero.html'
    success_url = reverse_lazy('index')

class ActualizarGenero(AdminOnlyMixin, UpdateView):
    model = Genero
    fields = ['genero']
    template_name = 'posts/generos/agregar_genero.html'
    success_url = reverse_lazy('index')

class EliminarGenero(AdminOnlyMixin, DeleteView):
    model = Genero
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

def listar_generos(request):
    generos = Genero.objects.all()
    return render(request, 'posts/generos/generos.html', {'generos': generos})

#----------Plataforma----------

class AgregarPlataforma(AdminOnlyMixin, CreateView):
    model = Plataforma
    fields = ['plataforma']
    template_name = 'posts/plataformas/agregar_plataforma.html'
    success_url = reverse_lazy('index')

class ActualizarPlataforma(AdminOnlyMixin, UpdateView):
    model = Plataforma
    fields = ['plataforma']
    template_name = 'posts/plataformas/agregar_plataforma.html'
    success_url = reverse_lazy('index')

class EliminarPlataforma(AdminOnlyMixin, DeleteView):
    model = Plataforma
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

def listar_plataformas(request):
    plataformas = Plataforma.objects.all()
    return render(request, 'posts/plataformas/plataformas.html', {'plataformas': plataformas})

# ----- Post ------

class CrearPost(UserPassesTestMixin, LoginRequiredMixin, CreateView):
    model = Post
    fields = [
        'titulo', 'subtitulo', 'fecha', 
        'descripcion', 'genero', 'plataforma',
        'activo', 'imagen_post'
        ]
    template_name = 'posts/agregar_post.html'
    success_url = reverse_lazy('index')

    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser


class ActualizarPost(LoginRequiredMixin, UpdateView):
    model = Post
    fields = [
        'titulo', 'subtitulo', 'fecha', 
        'descripcion', 'genero', 'plataforma',
        'activo', 'imagen_post'
        ]
    template_name = 'posts/agregar_post.html'
    success_url = reverse_lazy('index')

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_staff:
            raise Http404("No tiene permiso para realizar esta acción.")
        return super().dispatch(request, *args, **kwargs)

class EliminarPost(DeleteView):
    model = Post
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')


    def get_queryset(self):
        if self.request.user.is_staff or self.request.user.is_superuser:
            return super().get_queryset()
        return super().get_queryset().none()

    
    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_staff:
            raise Http404("No tiene permiso para realizar esta acción.")
        return super().dispatch(request, *args, **kwargs)


# ----- Post(inicio) ------


def listar_posts(request):
    posts= Post.objects.all()
    context = {
        'posts': posts
    }
    paginator = Paginator(posts,4)
    page_number = request.GET.get('page')

    return render(request,'posts/posts.html',context= context)


class DetailPost(DetailView):
    model = Post
    template_name = 'posts/post_individual.html'
    context_object_name = 'posts'
    queryset = Post.objects.all()
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['comentarios'] = Comentario.objects.filter(post=self.object).order_by('-fecha')
        return context

