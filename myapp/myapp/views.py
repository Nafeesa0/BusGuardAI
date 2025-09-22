import json
import random
from math import radians, sin, atan2, cos, sqrt

import datetime

from django.conf import settings
from django.contrib import messages
from django.contrib.auth import authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import Group
from django.core.files.storage import FileSystemStorage
from django.core.mail import send_mail
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect


# Create your views here.
from myapp.models import *



def logout(request):
    logout(request)
    return redirect('/myapp/login/')


@login_required(login_url='/myapp/login/')
def logins(request):
    if request.method== "POST":
        username= request.POST["username"]
        password= request.POST["password"]

        user = authenticate(request, username=username, password=password)
        if user is not None:
            print("hhh")
            if user.groups.filter(name="Admin").exists():
                print("jajaja")
                # login(request,user)
                return redirect('/myapp/adminhome/')
        else:
            messages.warning(request,"Invalid username or password")
            return redirect('/myapp/login/')

    print("helloooo")
    return render(request,"login.html")



@login_required(login_url='/myapp/login/')
def adminhome(request):
    return render(request,"index.html")



@login_required(login_url='/myapp/login/')
def addroute(request):
    if request.method=="POST":
        endpoint= request.POST["endpoint"]
        name= request.POST["name"]
        startpoint= request.POST["startpoint"]
        s=route_table()
        s.startpoint=startpoint
        s.endpoint=endpoint
        s.name=name
        s.save()
        messages.success(request, 'Student added successfully')

        return redirect('/myapp/manageroute/')
    return render(request,"add route.html")



@login_required(login_url='/myapp/login/')
def addstop(request):
    k=route_table.objects.all()
    p=request.session['rid']
    if request.method=="POST":
        endpoint= request.POST["name"]
        name= request.POST["lon"]
        startpoint= request.POST["lati"]
        s=stop_table()
        s.latitudea=startpoint
        s.ROUTE=route_table.objects.get(id=request.session['rid'])
        s.name=endpoint
        s.longititude=name
        s.save()
        messages.success(request, 'Student added successfully')

        return redirect(f'/myapp/managestop/{p}')
    return render(request,"add stop.html",{"val":k})




@login_required(login_url='/myapp/login/')
def manageroute(request):
    ob=route_table.objects.all()
    return render(request,"manage route.html",{"routes":ob})


@login_required(login_url='/myapp/login/')
def managestop(request,id):
    request.session['rid']=id
    ob=stop_table.objects.filter(ROUTE=id)
    return render(request,"manage stop.html",{"routes":ob})


@login_required(login_url='/myapp/login/')
def managebus(request):
    ob=bus_table.objects.all()
    return render(request,"manage us.html",{"buss":ob})



@login_required(login_url='/myapp/login/')
def addbus(request):
    ob=route_table.objects.all()
    return render(request,"add bus.html",{"val":ob})


@login_required(login_url='/myapp/login/')
def editbus(request,id):
    k=bus_staff_table.objects.get(id=id)
    request.session['bbid']=id
    ob=route_table.objects.all()
    return render(request,"edit bus staff.html",{"val":ob,"data":k})


@login_required(login_url='/myapp/login/')
def addbusstaff(request):
    ob=bus_table.objects.all()
    return render(request,"add bus staff.html",{"val":ob})




@login_required(login_url='/myapp/login/')
def addbuspost(request):
    no= request.POST["bus_no"]
    name= request.POST["name"]
    ca= request.POST["capacity"]
    route= request.POST["route"]
    s=bus_table()
    s.bus_no=no
    s.ROUTE=route_table.objects.get(id=route)
    s.capacity=ca
    s.name=name
    s.status='pending'
    s.save()
    messages.success(request, 'Student added successfully')


    return redirect('/myapp/managebus/')


@login_required(login_url='/myapp/login/')
def editstaffpost(request):
    name = request.POST["name"]
    place = request.POST["place"]
    post = request.POST["post"]
    email = request.POST["email"]
    district = request.POST["district"]
    phone = request.POST["phone"]

    AssignedBus = request.POST["AssignedBus"]

    s = bus_staff_table.objects.filter(AssignedBus__id=request.POST["AssignedBus"])
    if len(s)==0:
        s = bus_staff_table.objects.get(id=request.session['bbid'])
        s.name = name
        s.email = email
        s.place = place
        s.post = post
        s.district = district
        s.phone = phone

        s.AssignedBus = bus_table.objects.get(id=AssignedBus)
        s.latitudea = 0
        s.longititude = 0
        s.longititude = 0
        s.save()
        messages.success(request, 'Student edited successfully')


        return redirect('/myapp/managebus/')
    else:
        messages.success(request, 'Student already selected bus successfully')

        return redirect('/myapp/managebus/')



@login_required(login_url='/myapp/login/')
def stop_delete(request,id):
    ob=stop_table.objects.get(id=id)
    ob.delete()
    messages.success(request, 'Student deleted successfully')
    return redirect(f'/myapp/managestop/{id}')




@login_required(login_url='/myapp/login/')
def route_delete(request,id):
    ob=route_table.objects.get(id=id)
    ob.delete()
    messages.success(request, 'Student deleted successfully')
    return redirect('/myapp/manageroute/')


@login_required(login_url='/myapp/login/')
def bus_staff_delete(request,id):
    ob=bus_staff_table.objects.get(id=id)
    ob.delete()
    messages.success(request, 'Student deleted successfully')
    return redirect('/myapp/bus_staff_list/')




@login_required(login_url='/myapp/login/')
def bus_delete(request,id):
    ob=bus_table.objects.get(id=id)
    ob.delete()
    messages.success(request, 'Student deleted successfully')
    return redirect('/myapp/managebus/')


@login_required(login_url='/myapp/login/')
def addbusstaffpost(request):
    name= request.POST["name"]
    place= request.POST["place"]
    post= request.POST["post"]
    email= request.POST["email"]
    district= request.POST["district"]
    phone= request.POST["phone"]
    password= request.POST["password"]
    username= request.POST["username"]
    AssignedBus= request.POST["AssignedBus"]
    s = bus_staff_table.objects.filter(AssignedBus__id=request.POST["AssignedBus"])
    if len(s) == 0:
        user = User.objects.create(username=username, password=make_password(password), email=email,first_name=name)
        user.save()
        user.groups.add(Group.objects.get(name="staff"))
        s=bus_staff_table()
        s.name=name
        s.email=email
        s.place=place
        s.post=post
        s.district=district
        s.phone=phone
        s.LOGIN=user
        s.AssignedBus=bus_table.objects.get(id=AssignedBus)
        s.latitudea=0
        s.longititude=0
        s.save()
        messages.success(request, 'Student added successfully')
        return redirect('/myapp/manageroute/')
    else:
        # messages.success(request, 'bus already selected')
        return HttpResponse('''<script>alert("bus already selected");window.location="/myapp/manageroute/"</script>''')



@login_required(login_url='/myapp/login/')
def viewnotification(request):
    ob=Notification_table.objects.all()
    return render(request,"view notification.html",{"val":ob})


@login_required(login_url='/myapp/login/')
def viewaccident(request):
    ob=accident_table.objects.all()
    return render(request,"viewaccident.html",{"val":ob})


@login_required(login_url='/myapp/login/')
def viewparent(request):
    ob=parent_table.objects.all()
    return render(request,"view patent.html",{"val":ob})


@login_required(login_url='/myapp/login/')
def viewrequest(request):
    ob=request_table.objects.all()
    return render(request,"view request.html",{"val":ob})

@login_required(login_url='/myapp/login/')
def assign(request,id):
    request.session['rid']=id
    ob=bus_table.objects.all()
    return render(request,"assign.html",{"val":ob})

@login_required(login_url='/myapp/login/')
def viewassigned(request,id):
    ob=request_assign_table.objects.filter(REQUEST__id=id)
    return render(request,"view patent.html",{"val":ob})


def assignpost(request):
    bus=request.POST['AssignedBus']
    ob=request_assign_table()
    ob.REQUEST=request_table.objects.get(id=request.session['rid'])
    ob.BUS=bus_table.objects.get(id=bus)
    ob.status='pending'
    ob.save()
    k=request_table.objects.get(id=request.session['rid'])
    k.status='assigned'
    k.save()
    return redirect('/myapp/viewrequest/')


@login_required(login_url='/myapp/login/')
def viewbussts(request):
    ob=bus_table.objects.all()
    return render(request,"view bus status.html",{"buss":ob})



@login_required(login_url='/myapp/login/')
def bus_staff_list(request):
    staffs = bus_staff_table.objects.all()
    return render(request, 'manage bus staff.html', {'staffs': staffs})

#
#
# import json
# import google.generativeai as genai
# from django.http import JsonResponse
# from django.views.decorators.csrf import csrf_exempt
#
# # Configure Google Gemini API
# GOOGLE_API_KEY = 'AIzaSyB_G0I9odde2-IwZHB1EgHGmBTKaFvSf6Y'  # Replace with your actual API key
# genai.configure(api_key=GOOGLE_API_KEY)
#
# # Initialize Gemini Model
# model = genai.GenerativeModel('gemini-1.5-flash')
#
# @csrf_exempt  # Allows POST requests without CSRF token (Only for testing, secure in production)
# 
# @login_required(login_url='/myapp/login/')
# def chatbot_response(request):
#     """
#     Handles user input and generates a response from the Gemini API.
#     """
#     if request.method == 'POST':
#         try:
#             # Parse JSON request body
#             data = json.loads(request.body)
#             user_message = data.get('message', '').strip()
#
#             if not user_message:
#                 return JsonResponse({'response': 'Please enter a valid question.'})
#
#             # Generate response from Gemini
#             gemini_response = model.generate_content(user_message)
#
#             # Ensure response is always JSON formatted
#             return JsonResponse({'response': gemini_response.text.strip()})
#
#         except json.JSONDecodeError:
#             return JsonResponse({'response': 'Invalid JSON format.'}, status=400)
#         except Exception as e:
#             return JsonResponse({'response': f'Error: {str(e)}'}, status=500)
#
#     return JsonResponse({'response': 'Invalid request method. Use POST.'}, status=405)

# "=====================flutter========================="


def logincode(request):
    print(request.POST)
    un = request.POST['username']
    pwd = request.POST['password']

    print(un, pwd)
    try:
        user = authenticate(request, username=un, password=pwd)
        if user is not None:
            print("hhh")
            if user.groups.filter(name="staff").exists():
                print("jajaja")
                data = {"task": "valid", "lid": user.id, "type": 'staff'}
            elif user.groups.filter(name="user").exists():
                print("jajaja")
                data = {"task": "valid", "lid": user.id, "type": 'user'}
        else:
            print("in user function")
            data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)




def registrationcode(request):
    name=request.POST['name']
    email=request.POST['email']
    phone=request.POST['phone']
    username=request.POST['uname']
    password=request.POST['password']
    user = User.objects.create(username=username, password=make_password(password), email=email, first_name=name)
    user.save()
    user.groups.add(Group.objects.get(name="user"))
    s = parent_table()
    s.name = name
    s.email = email
    s.phone = phone
    s.LOGIN=user
    s.save()
    data = {"task": "valid"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)



def viewbususer(request):
    ob=bus_table.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.name,'oname':i.bus_no,'regno':i.capacity,'id':i.id,"rid":i.ROUTE.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def viewbusassign(request):
    r=request.POST['kid']
    ob=request_assign_table.objects.filter(REQUEST__id=r)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.BUS.name,'oname':i.BUS.bus_no,'regno':i.BUS.capacity,'id':i.BUS.id,"rid":i.BUS.ROUTE.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def viewnotificationflutter(request):
    r=request.POST['lid']
    ob=Notification_table.objects.filter(PARENT__LOGIN__id=r)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.BUS.name,'message':i.message,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})



def managerequest(request):
    rid=request.POST['rid']
    ob=request_table.objects.filter(CHILD__id=rid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'status':i.status,'fromstop':i.fromstop,'tostop':i.tostop,'id':i.id,"date":i.date}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def viewbususersts(request):
    ob=bus_staff_table.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.AssignedBus.name,'oname':i.AssignedBus.bus_no,'regno':i.AssignedBus.capacity,'id':i.AssignedBus.id,"rid":i.AssignedBus.ROUTE.id,'status':i.AssignedBus.status,'lat':i.latitudea,
    'lon':i.longititude}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def viewbususerstaff(request):
    lid=request.POST['lid']
    ob=bus_staff_table.objects.filter(LOGIN__id=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.AssignedBus.name,'oname':i.AssignedBus.bus_no,'regno':i.AssignedBus.capacity,'id':i.AssignedBus.id,"rid":i.AssignedBus.ROUTE.id,'status':i.AssignedBus.status,'lat':i.latitudea,
    'lon':i.longititude}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})





def addchild(request):
    print(request.POST)
    lid=request.POST['lid']
    name=request.POST['name']
    gender=request.POST['gender']
    ob=child_table()
    ob.name=name
    ob.gender=gender
    ob.PARENT=parent_table.objects.get(LOGIN__id=lid)
    ob.save()
    return JsonResponse({"task":"ok"})

def addrequest(request):
    print(request.POST)
    rid=request.POST['rid']
    fromstop=request.POST['fromstop']
    tostop=request.POST['tostop']
    # status=request.POST['status']
    ob=request_table()
    ob.status='pending'
    ob.tostop=tostop
    ob.date=datetime.datetime.today()
    ob.fromstop=fromstop
    ob.CHILD=child_table.objects.get(id=rid)
    ob.save()
    return JsonResponse({"task":"ok"})






def viewstop(request):
    rid=request.POST['rid']
    ob=stop_table.objects.filter(ROUTE__id=rid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'stop':i.name,'lati':i.latitudea,'longi':i.longititude,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def managechild(request):
    rid=request.POST['lid']
    ob=child_table.objects.filter(PARENT__LOGIN__id=rid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.name,'gender':i.gender,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def viewchild(request):
    rid=request.POST['lid']
    k=bus_staff_table.objects.get(LOGIN__id=rid)
    ob=request_assign_table.objects.filter(BUS__id=k.AssignedBus.id)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.REQUEST.CHILD.name,'gender':i.REQUEST.CHILD.gender,'id':i.REQUEST.CHILD.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def viewROUTEUSER(request):
    rid=request.POST['rid']
    ob=route_table.objects.filter(id=rid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.name,'startpoint':i.startpoint,'endpoint':i.endpoint,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})



def viewacccident(request):
    rid=request.POST['rid']
    ob=route_table.objects.filter(id=rid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'name':i.name,'startpoint':i.startpoint,'endpoint':i.endpoint,'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})





def deletechild(request):
    print(request.POST,"kkkkkkkkk")
    rid = request.POST['cid']
    child_table.objects.get(id=rid).delete()
    return JsonResponse({"status": "ok"})




def updatelocation(request):
    lid = request.POST['lid']
    lat=request.POST['lat']
    lon=request.POST['lon']
    ob=bus_staff_table.objects.get(LOGIN__id=lid)
    ob.latitude=lat
    ob.longitude=lon
    ob.save()
    print(request.POST)

    # police = bus_staff_table.objects.all()
    # nearby_police = []
    #
    # for officer in police:
    #     distance = calculate_distance(float(lat), float(lon), officer.latitudea, officer.longititude)
    #     if distance <= 10:
    #         nearby_police.append({
    #             'lat': officer.latitudea,
    #             'lon': officer.longititude,
    #             'id': officer.id,
    #             'distance': round(distance, 2)  # Add distance for clarity
    #         })
    #
    # sorted_officers = sorted(nearby_police, key=lambda officer: officer['distance'])
    # print(len(sorted_officers),"=====================")
    # status="False"
    # if len(sorted_officers)>0:
    #     status="True"
    #
    # return JsonResponse({"status": "ok", "data": sorted_officers,"task":status})
    return JsonResponse({"status": "ok"})





def calculate_distance(lat1, lon1, lat2, lon2):
    # Radius of Earth in kilometers
    R = 6371.0

    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])

    # Differences
    dlat = lat2 - lat1
    dlon = lon2 - lon1

    # Haversine formula
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))

    # Distance in kilometers
    distance = R * c
    return distance




def insert_emergency(request):
    lid = request.POST["lid"]
    latitude = float(request.POST["lat"])
    longitude = float(request.POST["lon"])
    k=bus_staff_table.objects.get(LOGIN__id=lid)
    bid=k.AssignedBus.id
    sid=k.id
    a = accident_table()
    a.latitudea = float(latitude)
    a.longititude = float(longitude)
    a.Date = datetime.datetime.now()
    a.time = datetime.datetime.now()
    a.status='pending'
    a.STAFF = bus_staff_table.objects.get(id=sid)
    a.BUS = bus_table.objects.get(id=bid)
    a.save()
    return JsonResponse({"task": "ok"})


def forgotpasswordflutter(request):
    email = request.POST['email']
    try:
        user = parent_table.objects.get(email=email)
        if len(user)==0:
            user = bus_staff_table.objects.get(email=email)
    except User.DoesNotExist:

        return JsonResponse({'status': 'error', 'message': 'Email not found'})

    otp = random.randint(100000, 999999)
    PasswordResetOTP.objects.create(email=email, otp=otp)

    send_mail('Your Verification Code',
              f'Your verification code is {otp}',
              settings.EMAIL_HOST_USER,
              [email],
              fail_silently=False)
    return JsonResponse({'status': 'ok', 'message': 'OTP sent'})


def verifyOtpflutterPost(request):
    email = request.POST['email']
    entered_otp = request.POST['entered_otp']
    otp_obj = PasswordResetOTP.objects.filter(email=email).latest('created_at')
    if otp_obj.otp == entered_otp:
        return JsonResponse({'status': 'ok'})
    else:
        return JsonResponse({'status': 'error'})


# def changePasswordflutter(request):
#     email = request.POST['email']
#     newpassword = request.POST['newPassword']
#     confirmPassword = request.POST['confirmPassword']
#     if newpassword == confirmPassword:
#         try:
#             user = user_table.objects.get(email=email)
#             user.set_password(confirmPassword)
#             user.save()
#             return JsonResponse({'status': 'ok'})
#         except User.DoesNotExist:
#             return JsonResponse({'status': 'error', 'message': 'User not found'})
#     else:
#         return JsonResponse({'status': 'error', 'message': 'Passwords do not match'})
#

from django.contrib.auth import get_user_model
from django.http import JsonResponse

User = get_user_model()

def changePasswordflutter(request):
    # Expecting POST
    if request.method != 'POST':
        return JsonResponse({'status': 'error', 'message': 'Invalid request method'}, status=405)

    email = request.POST.get('email')
    newpassword = request.POST.get('newPassword')
    confirmPassword = request.POST.get('confirmPassword')

    if not all([email, newpassword, confirmPassword]):
        return JsonResponse({'status': 'error', 'message': 'Missing parameters'})

    if newpassword != confirmPassword:
        return JsonResponse({'status': 'error', 'message': 'Passwords do not match'})

    try:
        user = parent_table.objects.get(email=email)
        if len(user)==0:
            user = bus_staff_table.objects.get(email=email)
    except User.DoesNotExist:
        return JsonResponse({'status': 'error', 'message': 'User not found'})

    # Use set_password to properly hash the password
    user.set_password(newpassword)
    user.save()

    return JsonResponse({'status': 'ok', 'message': 'Password changed successfully'})



from django.http import JsonResponse
from .models import accident_table

def viewaccidentflutter(request):
    try:
        r = request.POST['lid']   # if you want to filter using parent login id etc.
        ob = accident_table.objects.all()  # adjust filter if needed
        print(ob, "Accident Data >>>")

        mdata = []
        for i in ob:
            data = {
                'id': i.id,
                'bus': i.BUS.bus_no,         # from bus_table
               # from bus_staff_table
                'time': str(i.time),
                'date': str(i.Date),
                'latitude': i.latitudea,
                'longitude': i.longititude
            }
            mdata.append(data)
            print(mdata)

        return JsonResponse({"status": "ok", "data": mdata})

    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)})

def staffViewAccidentflutter(request):
    try:
        r = request.POST['lid']   # if you want to filter using parent login id etc.
        ob = accident_table.objects.all()  # adjust filter if needed
        print(ob, "Accident Data >>>")

        mdata = []
        for i in ob:
            data = {
                'id': i.id,
                'bus': i.BUS.bus_no,         # from bus_table
               # from bus_staff_table
                'time': str(i.time),
                'date': str(i.Date),
                'latitude': i.latitudea,
                'longitude': i.longititude
            }
            mdata.append(data)
            print(mdata)

        return JsonResponse({"status": "ok", "data": mdata})

    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)})



def sendnoti(request):
    print(request.POST)
    lid=request.POST['lid']
    bid=request.POST['rid']
    message=request.POST['name']
    k=bus_staff_table.objects.get(LOGIN__id=lid)
    kk=child_table.objects.get(id=bid)
    ob=Notification_table()
    ob.PARENT=parent_table.objects.get(id=kk.PARENT.id)
    ob.BUS=bus_table.objects.get(id=k.AssignedBus.id)
    ob.message=message
    ob.status='sended'
    ob.save()
    return JsonResponse({"task":"ok"})



def updatestats(request):
    print(request.POST)
    lid=request.POST['lid']
    bid=request.POST['bid']
    status=request.POST['status']
    ob=bus_staff_table.objects.get(AssignedBus__id=bid)
    ob.status=status
    ob.save()

    return JsonResponse({"status":"valid"})