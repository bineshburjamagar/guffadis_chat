import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer


class ChatConsumer(WebsocketConsumer):
    def connect(self):
        self.accept()
        
        self.send(text_data=json.dump({
            'type': 'connections_established',
            'message': 'I\'m horny',
            
        }))
    
    
    