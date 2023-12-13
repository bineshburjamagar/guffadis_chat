from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from django.urls import path
from chat.consumers import ChatRoomConsumer
from django.core.asgi import get_asgi_application
from users.custom_token_auth import CustomTokenAuth

application = ProtocolTypeRouter( 
    {

        "http": get_asgi_application(),
        "websocket": CustomTokenAuth(
            URLRouter(
               [
                path("chat/<int:receiver>/",ChatRoomConsumer.as_asgi())
               ]
            )
        ),
    }
)