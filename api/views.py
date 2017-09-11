from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.shortcuts import get_object_or_404, render
from rest_framework import generics
from api.serializers import NamePlateSerializer
from cowsform.models import NamePlate
import datetime


class CreateView(generics.ListCreateAPIView):
    """This class defines the create behavior of our rest api."""
    queryset = NamePlate.objects.all()
    serializer_class = NamePlateSerializer

    def perform_create(self, serializer):
        """Save the post data when creating a new bucketlist."""
        serializer.save()

class DetailsView(generics.RetrieveUpdateDestroyAPIView):
    """This class handles the http GET, PUT and DELETE requests."""

    queryset = NamePlate.objects.all()
    serializer_class = NamePlateSerializer