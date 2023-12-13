from rest_framework.generics import ListAPIView
from .models import ChatRoom
from .serializers import ChatRoomSerializer

class ChatRoomList(ListAPIView):

    serializer_class = ChatRoomSerializer

    def get_queryset(self):
        q = ChatRoom.objects.all()
        print(q)

        return q

    


