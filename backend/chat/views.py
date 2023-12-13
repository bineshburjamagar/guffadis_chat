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
        
        
        aa = self.request.GET.get('name')

        try:
            chat_room = ChatRoom.objects.get(room_name=aa)
            if chat_room:
                gg = Message.objects.filter(chat_room=chat_room)
                print(gg)
                return gg
            
        except:
            return None
        
            
            
        
       
       
    
