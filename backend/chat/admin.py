from django.contrib import admin


from chat.models import  ChatRoom, Message

admin.site.register(ChatRoom)
admin.site.register(Message)
# ... and, since we're not using Django's built-in permissions,
# unregister the Group model from admin.