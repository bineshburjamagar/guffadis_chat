from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser


class UserManager(BaseUserManager):
    def create_user(self, email, first_name, last_name, profile_image=None, password=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError("Users must have an email address")

        user = self.model(
            email=self.normalize_email(email),
            first_name= first_name,
            last_name=last_name,
            profile_image= profile_image,
        
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, first_name, last_name, profile_image=None, password=None):
        """
        Creates and saves a superuser with the given email, date of
        birth and password.
        """
        user = self.create_user(
            email,
            password=password,
            first_name= first_name,
            last_name=last_name,
            profile_image= profile_image,

        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser):
    email = models.EmailField(
        verbose_name="email address",
        max_length=255,
        unique=True,
    )
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    profile_image = models.ImageField(upload_to="profile_image", blank =True, null = True)
    is_admin = models.BooleanField(default=False)
   
    objects = UserManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ['first_name', 'last_name']

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin


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






