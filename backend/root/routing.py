from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from django.urls import path
from chat.chat_consumer import ChatConsumer
from django.core.asgi import get_asgi_application
from users.custom_token_auth import CustomTokenAuth
from chat.routing import websocket_urlpatterns
from channels.security.websocket import AllowedHostsOriginValidator

application = ProtocolTypeRouter( 
    {

        "http": get_asgi_application(),
        # "websocket": CustomTokenAuth(
        #     URLRouter(
        #     #    [
        #     #     path("chat/<int:receiver>/",ChatConsumer.as_asgi())
        #     #    ]
        #    websocket_urlpatterns
           
           
        #     )
            
        # ),
        "websocket": AllowedHostsOriginValidator(
            AuthMiddlewareStack(URLRouter(websocket_urlpatterns))
        ),
    }
)