from django.contrib import admin
from django.urls import path
from .views import ChatRoomList, MessageList

urlpatterns = [
    path('',  ChatRoomList.as_view(),name='room_list'),
    path('message/',  MessageList.as_view(),name='messages')
       
]