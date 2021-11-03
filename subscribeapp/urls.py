from django.urls import path
from django.views.generic import TemplateView

from subscribeapp.views import SubscriptionView

app_name = "subscribeapp"

urlpatterns = [
    path('subscribe/', SubscriptionView.as_view(), name='subscribe'),
]
