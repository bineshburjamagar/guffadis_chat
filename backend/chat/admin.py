from django.contrib import admin


from chat.models import  ChatRoom, Message


class ChatRoomAdmin(admin.ModelAdmin):
    readonly_fields=('room_name',)

admin.site.register(ChatRoom,ChatRoomAdmin)
admin.site.register(Message)
# ... and, since we're not using Django's built-in permissions,
# unregister the Group model from admin.