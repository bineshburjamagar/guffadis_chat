from django.urls import path, re_path
from .chat_consumer import ChatConsumer

websocket_urlpatterns= [
        re_path(r"ws/chat/(?P<room_name>\w+)/$", ChatConsumer.as_asgi()),

#    path('ws/socket-server/', ChatConsumer.as_asgi())
]
