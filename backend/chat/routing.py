from django.urls import path
from .chat_consumer import ChatConsumer

websocket_urlpatterns= [
    path('ws/socket-server/', ChatConsumer.as_asgi())
]
