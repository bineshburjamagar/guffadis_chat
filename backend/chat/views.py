from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from .models import ChatRoom, Message
from .serializers import ChatRoomSerializer, MessageSerializer
from rest_framework.response import Response

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


class GetToken(APIView):
    def get(self, request, *args, **kwargs):
        data = {
            "call_token":"Hello"
        }
        return Response(
            data
        )