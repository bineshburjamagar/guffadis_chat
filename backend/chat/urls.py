from django.contrib import admin
from django.urls import path
from .views import ChatRoomList

urlpatterns = [
    path('',  ChatRoomList.as_view(),name='room_list')
]