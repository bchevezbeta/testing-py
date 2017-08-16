from django.conf.urls import url
from . import views

app_name = 'cowsform'
urlpatterns = [
    url(r'^$', views.index, name='index'),
    #url(r'^thanks/$', views.thanks, name='thanks'),
]