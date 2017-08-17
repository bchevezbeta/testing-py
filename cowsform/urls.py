from django.conf.urls import url
from . import views

app_name = 'cowsform'
urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^list/$', views.ListView, name='list'),
    url(r'^list/(?P<npId>\d+)$', views.ListDetailView, name='detail'),
    #url(r'^thanks/$', views.thanks, name='thanks'),
]