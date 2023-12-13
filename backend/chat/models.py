from django.db import models
from users.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


class ChatRoom(models.Model):
    room_name = models.CharField(max_length=20, blank=True)
    last_message = models.CharField(max_length=255, blank=True, null=True)
    guffadi_one = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="guffadi_one"
    )
    guffadi_two = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="guffadi_two"
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.room_name

    def save(self, *args, **kwargs):
        id_one = int(self.guffadi_one.id)
        id_two = int(self.guffadi_two.id)

        if id_two == id_one:
            raise ValueError("Cannot be saved for same user")

        if id_one > id_two:
            room_name = f"Adda-For-Guffadi-{id_one}-Guffadi-{id_two}"
        else:
            room_name = f"Adda-For-Guffadi-{id_two}-Guffadi-{id_one}"
        self.room_name = room_name
        super().save(*args, **kwargs)

    # def save(self, *args, **kwargs):
    #     # Check if room_name is not set or is empty
    #     if not self.room_name:
    #         # Assuming the guffadis field is a ManyToManyField
    #         guffadis_ids = self.guffadis.values_list('id', flat=True)
    #         guffadis_id_str = '_'.join(map(str, guffadis_ids))
    #         self.room_name = f"Room for guffadis {guffadis_id_str}"

    #     return super(ChatRoom, self).save(*args, **kwargs)


# @receiver(post_save, sender=ChatRoom,)
# def update_room_name(sender, instance, **kwargs):
#     print("Hello ")
#     print(instance.last_message)

#     print(f"List {instance.guffadis.count()}")
#     print("---------------- ")


# guffadi_one = instance.guffadis.first()
# guffadi_two = instance.guffadis.last()


# if(int(guffadi_one.id)>int(guffadi_two.id)):
#     room_name = f"Adda-For-{guffadi_one.first_name}-{guffadi_two.first_name}"
# else:
#     room_name = f"Adda-For-{guffadi_two.first_name}-{guffadi_one.first_name}"

# instance.room_name = room_name
# instance.save()


class Message(models.Model):
    chat_room = models.ForeignKey(ChatRoom, on_delete=models.CASCADE)
    message = models.CharField(max_length=255)
    receiver = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="message_receiver"
    )
    sender = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="message_sender"
    )

    def __str__(self):
        return self.message
