from rest_framework.generics import ListAPIView
from .models import ChatRoom, Message
from .serializers import ChatRoomSerializer, MessageSerializer

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
    
