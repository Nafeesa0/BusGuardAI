
from django.contrib import admin
from django.urls import path, include

from myapp import views

urlpatterns = [
    path('login/', views.logins),
    path('adminhome/', views.adminhome),
    path('addroute/', views.addroute),
    path('managebus/', views.managebus),

    path('assign/<id>/', views.assign),
    path('managestop/<id>/', views.managestop),
    path('bus_delete/<id>/', views.bus_delete),
    path('editbus/<id>/', views.editbus),
    path('route_delete/<id>/', views.route_delete),
    path('bus_staff_delete/<id>/', views.bus_staff_delete),
    path('stop_delete/<id>/', views.stop_delete),
    path('manageroute/', views.manageroute),
    path('editstaffpost/', views.editstaffpost),
    path('addbus/', views.addbus),
    path('addbuspost/', views.addbuspost),
    path('addbusstaff/', views.addbusstaff),
    path('viewnotification/', views.viewnotification),
    path('viewparent/', views.viewparent),
    path('viewbussts/', views.viewbussts),
    path('bus_staff_list/', views.bus_staff_list),
    path('addbusstaffpost/', views.addbusstaffpost),
    path('addstop/', views.addstop),
    path('viewrequest/', views.viewrequest),
    path('viewaccident/', views.viewaccident),
    path('assignpost/', views.assignpost),
    path('viewassigned/<id>', views.viewassigned),







    path('logincode/', views.logincode),
    path('/registrationcode/', views.registrationcode),
    path('viewbususer/', views.viewbususer),
    path('viewROUTEUSER/', views.viewROUTEUSER),
    path('/viewstop/', views.viewstop),
    path('logout/', views.logout),
    path('managechild', views.managechild),
    path('addchild', views.addchild),
    path('deletechild', views.deletechild),
    path('insert_location', views.updatelocation),
    path('insert_emergency', views.insert_emergency),
    path('forgotpasswordflutter', views.forgotpasswordflutter),
    path('verifyOtpflutterPost', views.verifyOtpflutterPost),
    path('changePasswordflutter', views.changePasswordflutter),
    path('viewbususersts/', views.viewbususersts),
    path('managerequest', views.managerequest),
    path('addrequest', views.addrequest),
    path('/viewbusassign/', views.viewbusassign),
    path('viewnotificationflutter/', views.viewnotificationflutter),
    path('viewaccidentflutter/', views.viewaccidentflutter),
    path('staffViewAccidentflutter/', views.staffViewAccidentflutter),
    path('sendnoti', views.sendnoti),
    path('viewbususerstaff/', views.viewbususerstaff),
    path('viewchild', views.viewchild),
    path('updatestats', views.updatestats),
    # path('chatbot/', views.chatbot_response),

]
