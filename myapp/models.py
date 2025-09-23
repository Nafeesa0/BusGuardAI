from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class route_table(models.Model):
    name=models.CharField(max_length=100)
    startpoint=models.CharField(max_length=200)
    endpoint=models.CharField(max_length=200)

class stop_table(models.Model):
    name=models.CharField(max_length=100)
    ROUTE=models.ForeignKey(route_table,on_delete=models.CASCADE)
    latitudea = models.FloatField()
    longititude = models.FloatField()

class bus_table(models.Model):
    name=models.CharField(max_length=100)
    bus_no=models.CharField(max_length=100)
    capacity=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    ROUTE=models.ForeignKey(route_table,on_delete=models.CASCADE)

class bus_staff_table(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    district=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    LOGIN=models.ForeignKey(User,on_delete=models.CASCADE)
    AssignedBus=models.ForeignKey(bus_table,on_delete=models.CASCADE)
    latitudea = models.FloatField()
    longititude = models.FloatField()


class parent_table(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.BigIntegerField()
    LOGIN = models.ForeignKey(User, on_delete=models.CASCADE)


class child_table(models.Model):
    name=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    PARENT = models.ForeignKey(parent_table, on_delete=models.CASCADE)

class request_table(models.Model):
    status=models.CharField(max_length=100)
    fromstop=models.CharField(max_length=100)
    tostop=models.CharField(max_length=100)
    date=models.DateField()
    CHILD = models.ForeignKey(child_table, on_delete=models.CASCADE)


class request_assign_table(models.Model):
    status=models.CharField(max_length=100)
    REQUEST = models.ForeignKey(request_table, on_delete=models.CASCADE)
    BUS = models.ForeignKey(bus_table, on_delete=models.CASCADE)


class Notification_table(models.Model):
    message=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    PARENT = models.ForeignKey(parent_table, on_delete=models.CASCADE)
    BUS = models.ForeignKey(bus_table, on_delete=models.CASCADE)


class accident_table(models.Model):
    STAFF = models.ForeignKey(bus_staff_table, on_delete=models.CASCADE)
    BUS = models.ForeignKey(bus_table, on_delete=models.CASCADE)
    time = models.TimeField()
    Date = models.DateField()
    latitudea = models.FloatField()
    longititude = models.FloatField()


class PasswordResetOTP(models.Model):
    email = models.EmailField()
    otp = models.CharField(max_length=6)   # Store 6-digit OTP as string
    created_at = models.DateTimeField()