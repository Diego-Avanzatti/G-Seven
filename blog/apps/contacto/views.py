from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import CreateView, DeleteView
from apps.posts.views import AdminRequiredMixin
from .models import Contacto
from .forms import ContactoForm
from django.contrib import messages


class ContactoView(CreateView):
    template_name = 'contactos/agregar_contacto.html'
    form_class = ContactoForm
    success_url = reverse_lazy('index')

    
    def form_valid(self, form):
        messages.success(self.request, "Consulta enviada.")
        return super().form_valid(form)
    


def listar_contactos(request):
    consultas = Contacto.objects.all()
    context = {
        'consultas': consultas
    }
    return render(request,'contactos/contactos.html', context)


class EliminarConsulta(AdminRequiredMixin, DeleteView):
    model = Contacto
    template_name = 'genericos/confirma_eliminar.html'
    success_url = reverse_lazy('apps.usuarios:usuarios')

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(id=self.kwargs['pk'])


        
