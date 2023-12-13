from django.db import close_old_connections
from rest_framework_simplejwt.tokens import UntypedToken
from rest_framework_simplejwt.exceptions import InvalidToken, TokenError
from jwt import decode as jwt_decode
from django.conf import settings
from urllib.parse import parse_qs


class CustomTokenAuth:
    """
    Custom token auth middleware
    """

    def __init__(self, app):
        #         # Store the ASGI application we were passed
        self.app = app

    async def __call__(self, scope, receive, send):

        # Close old database connections to prevent usage of timed out connections
        close_old_connections()

        # Get the token
        token = parse_qs(scope["query_string"].decode("utf8"))["token"][0]

        # Try to authenticate the user
        try:
            # This will automatically validate the token and raise an error if token is invalid
            UntypedToken(token)
        except (InvalidToken, TokenError) as e:
           
            scope['user'] = ''
        else:
            #  Then token is valid, decode it
            decoded_data = jwt_decode(
                token, settings.SECRET_KEY, algorithms=["HS256"])
            print('decoded data')
            print(decoded_data)
          

            scope['user'] = decoded_data["user_id"]

        print(scope)
        # Return the inner application directly and let it run everything else
        return await self.app(scope, receive, send)

