from django.conf.urls import url
from api import views
from rest_framework.urlpatterns import format_suffix_patterns
from api.views import CreateView
from api.views import DetailsView 


app_name = 'api'
urlpatterns = [
    url(r'^$', CreateView.as_view(), name="create"),
    url(r'^(?P<pk>[0-9]+)/$', DetailsView.as_view(), name="details"),
]
urlpatterns = format_suffix_patterns(urlpatterns)