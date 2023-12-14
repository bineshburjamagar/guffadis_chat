# import json
# from channels.generic.websocket import AsyncWebsocketConsumer
# from channels.db import database_sync_to_async
# from .models import Message, ChatRoom
# from users.models import User


# class ChatRoomConsumer(AsyncWebsocketConsumer):
#     async def connect(self):
#         # TODO:using token auth
#         print("connect")
#         user = self.scope.get("user", False)

#         print(f"connected Userrr {user}")

#         if not user:
            
#             await self.accept()
#             await self.send(
#                 text_data=json.dumps(
#                     {"type": "message", "data": {"message": "Not Authenticated.."}}
#                 )
#             )
#             await self.send(
#                 text_data=json.dumps(
#                     {
#                         "type": "noAuth",
#                     }
#                 )
#             )
#             await self.close()
#             return
#         else:
#             print(f"connected {user}")

#             receiver = self.scope["url_route"]["kwargs"]["receiver"]

#             if int(user) > int(receiver):
#                 room_name = f"Adda-For-Guffadi-{user}-Guffadi-{receiver}"
#             else:
#                 room_name = f"Adda-For-Guffadi-{receiver}-Guffadi-{user}"

            
#             self.room_group_name = room_name

#             # Join room group
#             await self.channel_layer.group_add(self.room_group_name, self.channel_name)

#             await self.accept()

#     async def disconnect(self, close_code):
#         # Leave room group
#         print(
#             "'''''''''''''''''''''''''''''''''''''''disconnected'''''''''''''''''''''''''''''''''''''''"
#         )
#         await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

#     # Receive message from WebSocket
#     async def receive(self, text_data):
#         text_data_json = json.loads(text_data)
#         message = text_data_json["message"]
#         receiver = self.scope["url_route"]["kwargs"]["receiver"]
#         user = self.scope.get("user", False)

#         # save message to database
#         await self.save_message(user, receiver, self.room_group_name, message)

#         # Send message to room group
#         await self.channel_layer.group_send(
#             self.room_group_name,
#             {
#                 "type": "chat_message",
#                 "message": message,
#                 "receiver": receiver,
#                 "sender": user,
#             },
#         )

#     # Receive message from room group
#     async def chat_message(self, event):
#         message = event["message"]
#         receiver = event["receiver"]
#         user = event["sender"]

#         # Send message to WebSocket
#         await self.send(
#             text_data=json.dumps(
#                 {"message": message, "receiver": receiver, "sender": user}
#             )
#         )

#     @database_sync_to_async
#     def save_message(self, sender, receiver, room_name, message):
#         print(f"saving message from {sender} to {receiver}")
#         senderObj = User.objects.get(id=sender)
#         receiverObj = User.objects.get(id=receiver)

#         if ChatRoom.objects.filter(room_name=room_name).exists():
#             thread = ChatRoom.objects.get(room_name=room_name)
#         else:
#             thread = ChatRoom.objects.create(
#                 guffadi_one=senderObj, guffadi_two=receiverObj, room_name=room_name
#             )
#         # thread = ThreadModel.objects.get_or_create(
#         #     room_name=room_name, user=senderObj, receiver=receiverObj)
#         user = self.scope.get("user", False)

#         Message.objects.create(
#             sender=senderObj,
#             receiver=receiverObj,
#             message=message,
#             chat_room=thread,
#         )
