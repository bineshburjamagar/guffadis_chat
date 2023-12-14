from django.contrib import admin
from django.urls import path
from .views import ChatRoomList, MessageList, GetCallToken

urlpatterns = [
    path("", ChatRoomList.as_view(), name="room_list"),
    path("message/<str:room_id>/", MessageList.as_view(), name="messages"),
    path("call-token/", GetCallToken.as_view(), name="call-token"),
]
