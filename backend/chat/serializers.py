from rest_framework import serializers
from .models import ChatRoom, Message
from users.serializers import UsersSerializer



class ChatRoomSerializer(serializers.ModelSerializer):
    guffadis = UsersSerializer(many=True)
    class Meta:
        model = ChatRoom
        fields ='__all__'

class MessageSerializer(serializers.ModelSerializer):
    room_name = serializers.SerializerMethodField()
    sender = UsersSerializer()
    receiver =  UsersSerializer()
    
    class Meta:
        model = Message
        fields= '__all__'
        
    def get_room_name(self, obj):
        xd = obj.chat_room.room_name
        return xd
        
        
        
        