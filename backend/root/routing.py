from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from django.urls import path
from chat.consumers import ChatRoomConsumer

# URLs that handle the WebSocket connection are placed here.
# websocket_urlpatterns=[
#                     re_path(
#                         r"ws/chat/(?P<chat_box_name>\w+)/$", ChatRoomConsumer.as_asgi()
#                     ),
#                 ]

application = ProtocolTypeRouter( 
    {
        "websocket": AuthMiddlewareStack(
            URLRouter(
               [
                path("chat/<str:chat_box_name>/",ChatRoomConsumer.as_asgi())
               ]
            )
        ),
    }
)