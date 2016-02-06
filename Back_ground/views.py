from django.shortcuts import render
from django import forms
# Create your views here.
class UploadForm(forms.Form):
    filename=forms.CharField()
    filedetail=forms.FileField()