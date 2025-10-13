//
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:sensors/sensors.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
// void backgroundTask( String s) {
//   Timer.periodic(Duration(seconds: 20), (timer) {
//     location_fn();
//
//   });
// }
// class sapp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ShakeDetectionDemo(),
//     );
//   }
// }
//
//
//
// class ShakeDetectionDemo extends StatefulWidget {
//   @override
//   _ShakeDetectionDemoState createState() => _ShakeDetectionDemoState();
// }
// class location_fn
// {
//   String lat="0";
//   String lon="0";
//   Future<String> location()
//   async {
//
//
//
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
// print("Location");
// print(position);
//     lat=position.latitude.toString();
//     lon=position.longitude.toString();
//     return position.latitude.toString()+"#"+position.longitude.toString();
//
//   }
//   String loc_send()
//   {
//     //print("++++++++++++++++++++++");
//     //print("++++++++++++++++++++++");
//     //print("++++++++++++++++++++++");
//     location();
//     //print(lat+"#"+lon);
//     return lat+"#"+lon;
//   }
// }
// class _ShakeDetectionDemoState extends State<ShakeDetectionDemo> {
//   double _accelerometerX = 0.0;
//   double _accelerometerY = 0.0;
//   double _accelerometerZ = 0.0;
//   String checkingstatus = "0";
//   String usertype = "0";
//   bool _isShaking = false;
//   location_fn ob=location_fn();
//   // bool _status=true;
//   Future<String> checkfn()
//   async {
//     final sh = await SharedPreferences.getInstance();
//     // String lid=sh.getString("lid").toString();
//     checkingstatus=sh.getString("lid").toString();
//     usertype=sh.getString("type").toString();
//     return sh.getString("lid").toString();
//   }
//   get flutterLocalNotificationsPlugin => null;
//   // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   // FlutterLocalNotificationsPlugin();
//   // static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   // static const String name = 'Awesome Notifications - Example App';
//   // static const Color mainColor = Colors.deepPurple;
//   String s="0";
//   int i=0;
//   Timer? _timer;
//   int timelimit=12;
//  Future<void> notiload()
//  async {
//
//    WidgetsFlutterBinding.ensureInitialized();
//
//    // Initialize the notification plugin
//    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//    FlutterLocalNotificationsPlugin();
//
//    // Request notification permission for Android 14+
//    await _requestNotificationPermission(flutterLocalNotificationsPlugin);
//
//    // Initialize settings for Android notifications
//    const AndroidInitializationSettings initializationSettingsAndroid =
//    AndroidInitializationSettings('@mipmap/ic_launcher');
//
//    final InitializationSettings initializationSettings =
//    InitializationSettings(android: initializationSettingsAndroid);
//
//    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//  }
// // Request notification permission (Android 14+)
//   Future<void> _requestNotificationPermission(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     // final bool? permissionGranted =await flutterLocalNotificationsPlugin.requestPermission();
//     //
//     // if (permissionGranted != null && permissionGranted) {
//     //   print("Notification permission granted");
//     // } else {
//     //   print("Notification permission denied");
//     // }
//   }
//
// // Show a test notification
//   Future<void> showNotification(
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidDetails = AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//
//     var platformDetails = NotificationDetails(android: androidDetails);
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'New Notification',
//       'You are in danger zone!',
//       platformDetails,
//     );
//   }
//
//   void _startPeriodicTask() {
//     const duration = Duration(seconds:5); // Set the interval to 5 minutes
//     _timer = Timer.periodic(duration, (timer) async {
//       // Code to execute every 5 minutes
//       print('Executing task at ${DateTime.now()}');
//       ob.location();
//       String lids =checkfn().toString();
//
//
//       List<String> lll = ob.loc_send().split("#");
//       final sh = await SharedPreferences.getInstance();
//       sh.setString("lat", lll[0]);
//       sh.setString("lon", lll[1]);
//
//       String url = sh.getString("url") ?? "";
//                     String lid = sh.getString("lid") ?? "";
//
//       var data = await http.post(
//           Uri.parse(url + "updatelocation"),
//           body: {'lat': lll[0],
//             "lon": lll[1],
//             "lid": lid
//           });
//
//       var jasondata = json.decode(data.body);
//       String status = jasondata['task'].toString();
//       print(status + "+++++++++++++++====++----");
//       if(status=="True")
//         {
//           final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//           FlutterLocalNotificationsPlugin();
//           await showNotification(flutterLocalNotificationsPlugin);
//         }
//       print(lll.toString() + "===>");
//       // var data = await http.post(
//       //     Uri.parse(url + "updatelocation"),
//       //     body: {'lat': lll[0],
//       //       "lon": lll[1],
//       //       "lid": lid
//       //     });
//       //
//       // var jasondata = json.decode(data.body);
//       // String status = jasondata['task'].toString();
//       // print(status + "+++++++++++++++====++----");
//       print(lll.toString() + "===>");
//       // if (status == "ok") {
//       //   // _sendNotification();
//       // }
//       // else {
//       //   print("na");
//       // }
//
//       print(i);
//       if(i==0) {
//         i=i+1;
//
//         String url = sh.getString("url").toString();
//         String lid = sh.getString("lid").toString();
//         String state = sh.getString("state").toString();
//         print(lll);
//         print("okkkkkkkkkkkkkkkkk=="+state);
//         if(state == "active") {
//           String otp=sh.getString("otp").toString();
//           print("+=+=+=+=+=+=+=+=+==+++++====++++");
//           print(otp);
//           if(otp!="")
//             {
//
//               void showEmergencyDialog(BuildContext context) {
//                 final TextEditingController otpController = TextEditingController();
//
//                 showDialog<void>(
//                   context: context,
//                   barrierDismissible: false, // User must tap a button to close the dialog
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Emergency'),
//                       content: SingleChildScrollView(
//                         child: ListBody(
//                           children: <Widget>[
//                             const Text('Verify OTP?'),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: otpController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Enter OTP',
//                                 border: OutlineInputBorder(),
//                               ),
//                               keyboardType: TextInputType.number,
//                             ),
//                           ],
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: const Text('Approve'),
//                           onPressed: () async {
//                             // Retrieve the data from the TextFormField
//                             String enteredOtp = otpController.text;
//                             if(enteredOtp!=otp)
//                               {
//                                 try {
//                                   var data = await http.post(
//                                       Uri.parse(url + "insert_emergency"),
//                                       body: {'lat': lll[0],
//                                         "lon": lll[1],
//                                         "lid": lid
//                                       });
//
//                                   // var jasondata = json.decode(data.body);
//                                 }
//                                 catch(e)
//                             {}
//                               }
//                             Navigator.of(context).pop();
//
//                             // Add additional logic as needed
//                           },
//                         ),
//                         TextButton(
//                           child: const Text('Reject'),
//                           onPressed: () async {
//                             try {
//                               // Close the dialog
//                               var data = await http.post(
//                                   Uri.parse(url + "insert_emergency"),
//                                   body: {'lat': lll[0],
//                                     "lon": lll[1],
//                                     "lid": lid
//                                   });
//
//                               // var jasondata = json.decode(data.body);
//                             }
//                             catch(e)
//                             {}
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//               showEmergencyDialog(context);
//             }
//           else
//             {
//
//               void showEmergencyDialog(BuildContext context) {
//                 final TextEditingController otpController = TextEditingController();
//
//                 showDialog<void>(
//                   context: context,
//                   barrierDismissible: false, // User must tap a button to close the dialog
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Emergency'),
//                       content: SingleChildScrollView(
//                         child: ListBody(
//                           children: <Widget>[
//                             const Text('Are you sure you want to Set OTP?'),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: otpController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Enter OTP',
//                                 border: OutlineInputBorder(),
//                               ),
//                               keyboardType: TextInputType.number,
//                             ),
//                           ],
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: const Text('Approve'),
//                           onPressed: () {
//                             // Retrieve the data from the TextFormField
//                             String enteredOtp = otpController.text;
//                             print('OTP Entered: $enteredOtp');
//                             sh.setString("otp", enteredOtp);
//                             // Close the dialog
//                             // timelimit=60;
//                             Navigator.of(context).pop();
//
//                             // Add additional logic as needed
//                           },
//                         ),
//                         TextButton(
//                           child: const Text('Reject'),
//                           onPressed: () async {
//                             // Close the dialog
//
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//               showEmergencyDialog(context);
//             }
//
//
//         }
//       }
//       print(i);
//       i=i+1;
//       if(i==timelimit)
//       {
//         i=0;
//       }
//
//
//
//
//
//
//
//
//
//       print(checkingstatus);
//     });
//   }
//   @override
//   void initState() {
//
//     _startPeriodicTask();
//     super.initState();
//
//
//     accelerometerEvents.listen((AccelerometerEvent event) async {
//       // setState(()  async {
//       // ob.location();
//       // String lids =checkfn().toString();
//       //
//       // print(checkingstatus);
//       // if(checkingstatus=="-1")
//       // {
//       //   dispose();
//       // }
//       // print("===================++++++");
//       // print("===================++++++");
//       // List<String> lll = ob.loc_send().split("#");
//       // print(lll);
//       // final sh = await SharedPreferences.getInstance();
//       // sh.setString("lat", lll[0]);
//       // sh.setString("lon", lll[1]);
//
//
//       // _accelerometerX = event.x;
//       // _accelerometerY = event.y;
//       // _accelerometerZ = event.z;
//       //
//       //
//       // // Define a threshold for shake detection
//       // final double shakeThreshold = 50.0;
//       //
//       // // Check if the device is shaking based on accelerometer data
//       // _isShaking = (_accelerometerX.abs() > shakeThreshold ||
//       //     _accelerometerY.abs() > shakeThreshold ||
//       //     _accelerometerZ.abs() > shakeThreshold);
//       //
//       // if (_isShaking) {
//       //   //print(lll.toString() + "===>");
//       //   //print("*************************************");
//       //
//       //   // showDialog<void>(
//       //   //   context: context,
//       //   //   barrierDismissible: false, // user must tap button!
//       //   //   builder: (BuildContext context) {
//       //   //     return AlertDialog(
//       //   //       title: const Text('Shaking Detected'),
//       //   //       content: const SingleChildScrollView(
//       //   //         child: ListBody(
//       //   //           children: <Widget>[
//       //   //             // Text('This is a alert dialog.'),
//       //   //             Text('Are you sure you want to share your location'),
//       //   //           ],
//       //   //         ),
//       //   //       ),
//       //   //
//       //   //
//       //   //
//       //   //       actions: <Widget>[
//       //   //         TextButton(
//       //   //           child: const Text('Approve'),
//       //   //           onPressed: () async {
//       //   //             final sh = await SharedPreferences.getInstance();
//       //   //             String url = sh.getString("url") ?? "";
//       //   //             String lid = sh.getString("lid") ?? "";
//       //   //
//       //   //             try {
//       //   //               // Log confirmation
//       //   //               print("Sending emergency alert...");
//       //   //
//       //   //               // API call
//       //   //               var response = await http.post(
//       //   //                 Uri.parse('$url/User_send_emergency_alert'),
//       //   //                 body: {
//       //   //                   'lat': lll[0],
//       //   //                   'lon': lll[1],
//       //   //                   'lid': lid,
//       //   //                 },
//       //   //               );
//       //   //
//       //   //               var jsonData = json.decode(response.body);
//       //   //               String status = jsonData['task']?.toString() ?? "error";
//       //   //
//       //   //               // Log status
//       //   //               print("Status: $status");
//       //   //
//       //   //               if (status == "ok") {
//       //   //                 print("Emergency alert sent successfully!");
//       //   //                 // _sendNotification(); Uncomment if notification logic is implemented
//       //   //               } else {
//       //   //                 print("Failed to send emergency alert.");
//       //   //               }
//       //   //             } catch (e) {
//       //   //               print("Error: $e");
//       //   //             }
//       //   //
//       //   //             // Navigate to the home page
//       //   //
//       //   //           },
//       //   //         ),
//       //   //         TextButton(
//       //   //           child: const Text('Reject'),
//       //   //           onPressed: () {
//       //   //             // Directly navigate to the home page
//       //   //
//       //   //           },
//       //   //         ),
//       //   //       ],
//       //   //
//       //   //     );
//       //   //   },
//       //   // );
//       // }
//
//
//
//
//
//
//
//
//       // if(i==0) {
//       //   i=i+1;
//       //
//       //   String url = sh.getString("url").toString();
//       //   String lid = sh.getString("lid").toString();
//       //   String state = sh.getString("state").toString();
//       //   print(lll);
//       //   print("okkkkkkkkkkkkkkkkk");
//       //   if(state == "active") {
//       //     String otp=sh.getString("otp").toString();
//       //     print("+=+=+=+=+=+=+=+=+==+++++====++++");
//       //     print(otp);
//       //     if(otp=="")
//       //       {
//       //
//       //         void showEmergencyDialog(BuildContext context) {
//       //           final TextEditingController otpController = TextEditingController();
//       //
//       //           showDialog<void>(
//       //             context: context,
//       //             barrierDismissible: false, // User must tap a button to close the dialog
//       //             builder: (BuildContext context) {
//       //               return AlertDialog(
//       //                 title: const Text('Emergency'),
//       //                 content: SingleChildScrollView(
//       //                   child: ListBody(
//       //                     children: <Widget>[
//       //                       const Text('Are you sure you want to Set OTP?'),
//       //                       const SizedBox(height: 10),
//       //                       TextFormField(
//       //                         controller: otpController,
//       //                         decoration: const InputDecoration(
//       //                           labelText: 'Enter OTP',
//       //                           border: OutlineInputBorder(),
//       //                         ),
//       //                         keyboardType: TextInputType.number,
//       //                       ),
//       //                     ],
//       //                   ),
//       //                 ),
//       //                 actions: <Widget>[
//       //                   TextButton(
//       //                     child: const Text('Approve'),
//       //                     onPressed: () {
//       //                       // Retrieve the data from the TextFormField
//       //                       String enteredOtp = otpController.text;
//       //                       print('OTP Entered: $enteredOtp');
//       //                       sh.setString("otp", enteredOtp);
//       //                       // Close the dialog
//       //                       Navigator.of(context).pop();
//       //
//       //                       // Add additional logic as needed
//       //                     },
//       //                   ),
//       //                   TextButton(
//       //                     child: const Text('Reject'),
//       //                     onPressed: () {
//       //                       // Close the dialog
//       //                       Navigator.of(context).pop();
//       //                     },
//       //                   ),
//       //                 ],
//       //               );
//       //             },
//       //           );
//       //         }
//       //         showEmergencyDialog(context);
//       //       }
//       //     var data = await http.post(
//       //         Uri.parse(url + "updatelocation"),
//       //         body: {'lat': lll[0],
//       //           "lon": lll[1],
//       //           "lid": lid
//       //         });
//       //
//       //     var jasondata = json.decode(data.body);
//       //     String status = jasondata['task'].toString();
//       //     print(status + "+++++++++++++++====++----");
//       //     print(lll.toString() + "===>");
//       //     if (status == "ok") {
//       //       // _sendNotification();
//       //     }
//       //     else {
//       //       print("na");
//       //     }
//       //   }
//       // }
//       // print(i);
//       // i=i+1;
//       // if(i==1000)
//       // {
//       //   i=0;
//       // }
//
//     });
//   }
//
//
//
//   // void startBackgroundTask() async {
//   //   final isolate = await FlutterIsolate.spawn(backgroundTask,"");
//   // }
//   // // Start the background task
//   // Future<void> _startBackgroundTask() async {
//   //
//   //   // final bool isRunning =  await FlutterBackground.isBackgroundExecutionActive;
//   //   //
//   //   // if (!isRunning) {
//   //   //   await FlutterBackground.initialize(androidConfig: AndroidConfig(
//   //   //     notificationChannelName: 'Background Tasks',
//   //   //     notificationTitle: 'Background Task',
//   //   //     notificationText: 'Running in the background',
//   //   //     notificationImportance: AndroidNotificationImportance.Default,
//   //   //   ));
//   //   //
//   //   //   final taskId = await FlutterBackground.executeTask(
//   //   //     task: (taskId) async {
//   //   //       // Periodically make HTTP requests in the background
//   //   //       Timer.periodic(Duration(seconds: 10), (timer) async {
//   //   //         await _fetchData();
//   //   //       });
//   //   //     },
//   //   //     // Set the interval to trigger the task
//   //   //     interval: Duration(seconds: 10),
//   //   //     // Run the task immediately
//   //   //     executeOnBoot: true,
//   //   //   );
//   //   // }
//   // }
//
//   Future<void> _fetchData() async {
//     try {
//       // final response = await http.get(Uri.parse(apiUrl));
//       //
//       // if (response.statusCode == 200) {
//       //   // Handle the response data here
//       //   //print('Response data: ${response.body}');
//       // } else {
//       //   // Handle errors
//       //   //print('Error: ${response.statusCode}');
//       // }
//       //print("fetch data");
//     } catch (e) {
//       // Handle network or other errors
//       //print('Error: $e');
//     }
//   }
//   // Future<void> _sendNotification() async {
//   //   await AwesomeNotifications().createNotification(
//   //     content: NotificationContent(
//   //       id: 0,
//   //       channelKey: 'basic_channel',
//   //       title: 'Awesome Notification',
//   //       body: 'This is an awesome notification!',
//   //     ),
//   //   );
//   // }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     // Cancel the accelerometer subscription when the widget is disposed
//     accelerometerEvents.drain();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shake Detection Demo'),
//       ),
//       body:
//       Center(
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Accelerometer Data'),
//             Text('X: $_accelerometerX'),
//             Text('Y: $_accelerometerY'),
//             Text('Z: $_accelerometerZ'),
//
//             SizedBox(height: 20),
//             Text(
//               _isShaking ? 'Device is shaking!' : 'Device is not shaking.',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: _isShaking ? Colors.red : Colors.green,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }

//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// // Assume you already have ob.loc_send() defined in your project
// // Example: ob.loc_send() returns "lat#lon"
// var ob = LocationHelper();
//
// class ShakeDetectionDemo extends StatefulWidget {
//   @override
//   _ShakeDetectionDemoState createState() => _ShakeDetectionDemoState();
// }
//
// class _ShakeDetectionDemoState extends State<ShakeDetectionDemo> {
//   // Accelerometer values
//   double _accelerometerX = 0;
//   double _accelerometerY = 0;
//   double _accelerometerZ = 0;
//   bool _isShaking = false;
//
//   // Timer for periodic location sending
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Start periodic location updates
//     _startPeriodicTask();
//
//     // Listen to accelerometer for shake detection
//     accelerometerEvents.listen((AccelerometerEvent event) async {
//       setState(() {
//         _accelerometerX = event.x;
//         _accelerometerY = event.y;
//         _accelerometerZ = event.z;
//       });
//
//       // Calculate magnitude
//       double magnitude = sqrt(
//         _accelerometerX * _accelerometerX +
//             _accelerometerY * _accelerometerY +
//             _accelerometerZ * _accelerometerZ,
//       );
//
//       const double shakeThreshold = 25.0; // Tune if needed
//
//       if (magnitude > shakeThreshold) {
//         if (!_isShaking) {
//           _isShaking = true;
//           print("🚨 Shake Detected! Accident suspected.");
//
//           // Send emergency alert
//           await _sendAccidentAlert();
//
//           // Reset shake flag after delay
//           Future.delayed(const Duration(seconds: 3), () {
//             _isShaking = false;
//           });
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   // Periodic location sender
//   void _startPeriodicTask() {
//     _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
//       try {
//         final sh = await SharedPreferences.getInstance();
//         String url = sh.getString("url") ?? "";
//         String lid = sh.getString("lid") ?? "";
//         List<String> lll = ob.loc_send().split("#");
//
//         var response = await http.post(
//           Uri.parse(url + "insert_location"),
//           body: {'lat': lll[0], 'lon': lll[1], 'lid': lid},
//         );
//
//         var jsonData = json.decode(response.body);
//         if (jsonData['task'] == "ok") {
//           print("✅ Location updated");
//         } else {
//           print("⚠️ Location update failed");
//         }
//       } catch (e) {
//         print("❌ Error updating location: $e");
//       }
//     });
//   }
//
//   // Accident alert sender
//   Future<void> _sendAccidentAlert() async {
//     try {
//       final sh = await SharedPreferences.getInstance();
//       String url = sh.getString("url") ?? "";
//       String lid = sh.getString("lid") ?? "";
//       List<String> lll = ob.loc_send().split("#");
//
//       var response = await http.post(
//         Uri.parse(url + "insert_emergency"),
//         body: {
//           'lat': lll[0],
//           'lon': lll[1],
//           'lid': lid,
//           'type': 'accident'
//         },
//       );
//
//       var jsonData = json.decode(response.body);
//       if (jsonData['task'] == "ok") {
//         print("✅ Accident alert sent successfully!");
//
//         final flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//
//         const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//         final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//         await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//         const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//           'accident_channel',
//           'Accident Alerts',
//           importance: Importance.max,
//           priority: Priority.high,
//           showWhen: false,
//         );
//         const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//         await flutterLocalNotificationsPlugin.show(
//           0,
//           'Accident Detected',
//           'Emergency alert sent successfully!',
//           platformChannelSpecifics,
//         );
//       } else {
//         print("⚠️ Accident alert failed");
//       }
//     } catch (e) {
//       print("❌ Error sending accident alert: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Shake Detection & Location"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Accelerometer values:"),
//             Text("X: $_accelerometerX"),
//             Text("Y: $_accelerometerY"),
//             Text("Z: $_accelerometerZ"),
//             const SizedBox(height: 20),
//             Text("Shake detection active 🚀"),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Dummy helper for demonstration
// class LocationHelper {
//   String loc_send() {
//     // Example lat#lon string
//     return "10.12345#76.54321";
//   }
// }


import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bustracking/staff%20home.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Assume you already have ob.loc_send() defined in your project
var ob = LocationHelper();

class ShakeDetectionDemo extends StatefulWidget {
  @override
  _ShakeDetectionDemoState createState() => _ShakeDetectionDemoState();
}

class _ShakeDetectionDemoState extends State<ShakeDetectionDemo> {
  double _accelerometerX = 0;
  double _accelerometerY = 0;
  double _accelerometerZ = 0;
  bool _isShaking = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startPeriodicTask();

    accelerometerEvents.listen((AccelerometerEvent event) async {
      setState(() {
        _accelerometerX = event.x;
        _accelerometerY = event.y;
        _accelerometerZ = event.z;
      });

      double magnitude = sqrt(
        _accelerometerX * _accelerometerX +
            _accelerometerY * _accelerometerY +
            _accelerometerZ * _accelerometerZ,
      );

      const double shakeThreshold = 25.0;

      if (magnitude > shakeThreshold) {
        if (!_isShaking) {
          _isShaking = true;
          print("🚨 Shake Detected! Accident suspected.");

          // Show confirmation dialog
          _showSOSConfirmation();

          Future.delayed(const Duration(seconds: 120), () {
            _isShaking = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startPeriodicTask() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      try {
        final sh = await SharedPreferences.getInstance();
        String url = sh.getString("url") ?? "";
        String lid = sh.getString("lid") ?? "";
        List<String> lll = ob.loc_send().split("#");

        var response = await http.post(
          Uri.parse(url + "insert_location"),
          body: {'lat': lll[0], 'lon': lll[1], 'lid': lid},
        );

        var jsonData = json.decode(response.body);
        if (jsonData['task'] == "ok") {
          print("✅ Location updated");
        } else {
          print("⚠️ Location update failed");
        }
      } catch (e) {
        print("❌ Error updating location: $e");
      }
    });
  }

  void _showSOSConfirmation() {
    bool responded = false;

    // Auto-send after 10 seconds if no response
    Timer(Duration(seconds: 5), () {
      if (!responded) {
        print("⏱ No response in 10s → Auto sending SOS...");
        _sendAccidentAlert();
      }
    });

    showDialog(
      context: context,
      barrierDismissible: false, // prevent tap outside to close
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("SOS Confirmation"),
          content: Text("Do you want to send an SOS message?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                responded = true;
                Navigator.of(context).pop();
                print("❌ SOS cancelled by user");
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                responded = true;
                Navigator.of(context).pop();
                _sendAccidentAlert();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendAccidentAlert() async {
    try {
      final sh = await SharedPreferences.getInstance();
      String url = sh.getString("url") ?? "";
      String lid = sh.getString("lid") ?? "";
      List<String> lll = ob.loc_send().split("#");

      var response = await http.post(
        Uri.parse(url + "insert_emergency"),
        body: {
          'lat': lll[0],
          'lon': lll[1],
          'lid': lid,
          'type': 'accident'
        },
      );

      var jsonData = json.decode(response.body);
      if (jsonData['task'] == "ok") {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => staff_home()));
        print("✅ SOS alert sent!");

        final flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
        const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
        final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
        await flutterLocalNotificationsPlugin.initialize(initializationSettings);

        const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'accident_channel',
          'Accident Alerts',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        );
        const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          0,
          'Accident Detected',
          'Accident Detected!!!',
          platformChannelSpecifics,
        );
      } else {
        print("⚠️ SOS alert failed");
      }
    } catch (e) {
      print("❌ Error sending SOS alert: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shake Detection & SOS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Accelerometer values:"),
            Text("X: $_accelerometerX"),
            Text("Y: $_accelerometerY"),
            Text("Z: $_accelerometerZ"),
            const SizedBox(height: 20),
            Text("Shake detection active 🚀"),
          ],
        ),
      ),
    );
  }
}

// Dummy helper
class LocationHelper {
  String loc_send() {
    return "10.12345#76.54321"; // Replace with real GPS
  }
}
