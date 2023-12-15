from django.contrib import admin
from django.urls import path
from .import views
from .views import ChatRoomList, MessageList, GetCallToken

urlpatterns = [
    path("", views.index, name="index"),
    path("<str:room_name>/", views.room, name="room"),
    path("room-list/", ChatRoomList.as_view(), name="room_list"),
    path("message/<str:room_id>/", MessageList.as_view(), name="messages"),
    path("call-token/", GetCallToken.as_view(), name="call-token"),
]
