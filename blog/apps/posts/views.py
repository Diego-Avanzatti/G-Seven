from django.http import Http404
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.views.generic import DetailView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from apps.comentarios.models import Comentario
from .models import Post, Genero, Plataforma
from django.core.paginator import Paginator


# Mixin para restringir acceso solo a admins y superusuarios

class AdminRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return self.request.user.is_staff or self.request.user.is_superuser

    def handle_no_permission(self):
        raise Http404()

# CRUD para Género (solo admin puede crear, actualizar y eliminar)

class AgregarGenero(AdminRequiredMixin, CreateView):
    model = Genero
    fields = ['genero']
    template_name = 'posts/generos/agregar_genero.html'
    success_url = reverse_lazy('index')

class ActualizarGenero(AdminRequiredMixin, UpdateView):
    model = Genero
    fields = ['genero']
    template_name = 'posts/generos/agregar_genero.html'
    success_url = reverse_lazy('index')

class EliminarGenero(AdminRequiredMixin, DeleteView):
    model = Genero
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

#--------sin restricción-----------

def listar_generos(request):
    generos = Genero.objects.all()
    return render(request, 'posts/generos/generos.html', {'generos': generos})


# CRUD para Plataforma (solo admin puede crear, actualizar y eliminar)

class AgregarPlataforma(AdminRequiredMixin, CreateView):
    model = Plataforma
    fields = ['plataforma']
    template_name = 'posts/plataformas/agregar_plataforma.html'
    success_url = reverse_lazy('index')

class ActualizarPlataforma(AdminRequiredMixin, UpdateView):
    model = Plataforma
    fields = ['plataforma']
    template_name = 'posts/plataformas/agregar_plataforma.html'
    success_url = reverse_lazy('index')

class EliminarPlataforma(AdminRequiredMixin, DeleteView):
    model = Plataforma
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')


#--------sin restricción-----------

def listar_plataformas(request):
    plataformas = Plataforma.objects.all()
    return render(request, 'posts/plataformas/plataformas.html', {'plataformas': plataformas})


# CRUD para Post


class CrearPost(LoginRequiredMixin, CreateView):
    model = Post
    fields = [
        'titulo', 'subtitulo',
        'descripcion', 'genero', 'plataforma',
        'imagen_post'
    ]
    template_name = 'posts/agregar_post.html'
    success_url = reverse_lazy('index')


    def form_valid(self, form):
        form.instance.creador = self.request.user
        return super().form_valid(form)

class ActualizarPost(LoginRequiredMixin, UpdateView):
    model = Post
    fields = [
        'titulo', 'subtitulo',
        'descripcion', 'genero', 'plataforma',
         'imagen_post'
    ]
    template_name = 'posts/agregar_post.html'
    success_url = reverse_lazy('index')


    def dispatch(self, request, *args, **kwargs):
        post = self.get_object()

        if request.user.is_superuser or request.user.is_staff:
            return super().dispatch(request, *args, **kwargs)
        if post.creador == request.user:
            return super().dispatch(request, *args, **kwargs)
        raise Http404("No tenés permiso para editar.")






class EliminarPost(LoginRequiredMixin, DeleteView):
    model = Post
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('index')

    def get_queryset(self):
        user = self.request.user
        if user.is_staff or user.is_superuser:
            return super().get_queryset()
        else:
            return super().get_queryset().filter(creador=user)

    def dispatch(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        post = self.get_object()

        if post not in queryset:
            raise Http404("No tiene permiso para eliminar este post.")
        return super().dispatch(request, *args, **kwargs)


# ----- Post(inicio) ------

def listar_posts(request):
    posts = Post.objects.all()
    paginator = Paginator(posts, 4)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'page_obj': page_obj
    }
    return render(request, 'posts/posts.html', context)

def filtrar_posts(request, tipo, id=None):
    posts = Post.objects.all()
    if tipo == 'plataforma':
        posts = posts.filter(plataforma = id)
    elif tipo == 'genero':
        posts = posts.filter(genero= id)
    elif tipo == 'reciente':
        posts = posts.order_by('-fecha')
    elif tipo == 'antiguo':
        posts = posts.order_by('fecha')
    elif tipo == 'alfabetico':
        posts = posts.order_by('titulo')
    else:
        raise Http404("Error, entrada incorrecta.")

    paginator = Paginator(posts, 4)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'page_obj': page_obj,
    }

    return render(request, 'posts/filtrar_posts.html',context)


class DetailPost(DetailView):
    model = Post
    template_name = 'posts/post_individual.html'
    context_object_name = 'posts'
    queryset = Post.objects.all()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['comentarios'] = Comentario.objects.filter(post=self.object).order_by('-fecha')
        return context

