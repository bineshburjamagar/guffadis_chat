from django.db import models
from users.models import User



class ChatRoom(models.Model):
    room_name = models.CharField(max_length=20)
    last_message = models.CharField(max_length=255) 
    guffadis = models.ManyToManyField(User)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.room_name



class Message(models.Model):
    chat_room = models.ForeignKey(ChatRoom, on_delete = models.CASCADE)
    message = models.CharField(max_length= 255)
    receiver = models.ForeignKey(User,on_delete=models.CASCADE, related_name = 'message_receiver')
    sender   = models.ForeignKey(User,on_delete=models.CASCADE, related_name = 'message_sender')

    def __str__(self):
        return self.message






