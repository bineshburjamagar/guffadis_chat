from rest_framework import serializers

from .models import ChatRoom, User




class UsersSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()
    class Meta:
        model = User
        fields =  ['full_name', 'profile_image', ]

    def get_full_name(self, obj):
        return f'{obj.first_name} {obj.last_name}'

class ChatRoomSerializer(serializers.ModelSerializer):

    guffadis = UsersSerializer(many=True)
    class Meta:
        model = ChatRoom
        fields ='__all__'

