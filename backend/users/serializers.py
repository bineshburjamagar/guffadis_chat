from rest_framework import serializers
from .models import User

class UsersSerializer(serializers.ModelSerializer):
    full_name = serializers.SerializerMethodField()
    class Meta:
        model = User
        fields =  ['full_name', 'profile_image']

    def get_full_name(self, obj):
        return f'{obj.first_name} {obj.last_name}'