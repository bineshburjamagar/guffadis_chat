from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from .models import ChatRoom, Message
from .serializers import ChatRoomSerializer, MessageSerializer
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from livekit import api as liveKitApi
from django.conf import settings


class ChatRoomList(ListAPIView):
    serializer_class = ChatRoomSerializer

    def get_queryset(self):
        q = ChatRoom.objects.all()
        return q


class MessageList(ListAPIView):
    serializer_class = MessageSerializer

    def get_queryset(self):
        gg = Message.objects.all()
        return gg


class GetCallToken(APIView):
    permission_classes = [IsAuthenticated,]
    def get(self, request, *args, **kwargs):
        try:
            api_key =settings.LIVEKIT_API_KEY 
            api_secret =settings.LIVEKIT_API_SECRET 
            user = request.user
            if user:
                token = (
                    liveKitApi.AccessToken(api_key=api_key, api_secret=api_secret)
                    .with_identity(f"user-{user.id}-{user.first_name}")
                    .with_name(f"{user.first_name} {user.last_name}")
                    .with_grants(
                        liveKitApi.VideoGrants(
                            room_join=True,
                            room="room1",
                        ),
                    )
                )
                return Response({"token": token.to_jwt()})
            return Response({"message": "Not Authorized"}, status=400)
        except Exception as e:
            return Response({"message": str(e)}, status=400)
