**Bus Guard AI – Accident Detection and Tracking System**
**Overview**

Bus Guard AI is an intelligent school transportation safety system designed to improve communication and safety in school bus operations. The system integrates AI-based accident detection with real-time GPS tracking to monitor school buses and instantly notify parents and school authorities in case of emergencies.

Unlike traditional bus tracking systems that only provide location updates, Bus Guard AI detects abnormal events such as accidents and sends immediate alerts, helping reduce response time and improving student safety.

**Key Features**

AI-Based Accident Detection
Uses machine learning algorithms to detect abnormal events such as collisions.

Real-Time GPS Tracking
Parents and school administrators can monitor the live location of school buses.

Emergency Alert System
Instant notifications are sent to parents and administrators during accidents.

Estimated Time of Arrival (ETA)
Shows the expected arrival time of the bus at each stop.

Delay Notifications
Alerts parents if the bus is delayed due to traffic or other issues.

Mobile App for Parents
Parents can track the bus and receive alerts through a mobile application.

Admin Web Dashboard
School administrators can manage buses, routes, staff, and monitor accidents.

**Technologies Used**
Backend

Python

Django Framework

Mobile Application

Flutter

Dart

Frontend (Web Dashboard)

HTML

CSS

Bootstrap

JavaScript

Database

MySQL / Firebase

APIs

Google Maps API (GPS Tracking)

AI / Machine Learning

K-Nearest Neighbors (KNN)

**System Modules**
Admin Module

Manage buses and routes

Manage bus staff and parents

Monitor accident reports

View notifications and system status

Parent Module

Register and login

Track bus location in real-time

Receive accident and delay notifications

View bus status and history

Bus Staff Module

Login to system

Update bus location

Update trip status

Report incidents or accidents

**System Workflow**

Bus staff updates bus location during trips.

The system tracks the bus using GPS and Google Maps API.

AI algorithm analyzes sensor or movement data.

If an accident or anomaly is detected:

The system triggers emergency alerts.

Parents and school authorities receive notifications instantly.

**Installation**

Clone the repository:

    git clone https://github.com/Nafeesa0/BusGuardAI            

Navigate to project directory:

    cd busguard-ai

Install dependencies:

    pip install -r requirements.txt

Run the Django server:

    python manage.py runserver

**Future Enhancements**

Integration of IoT sensors inside buses

Use Deep Learning models for more accurate accident detection

Add predictive route optimization

Cloud-based large-scale deployment

Real-time video monitoring using CCTV

