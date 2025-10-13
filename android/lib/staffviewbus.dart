// import 'dart:convert';
// import 'dart:math';
//
//
//
// import 'package:bustracking/view%20route.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//
//
// class viewbususerstaff extends StatelessWidget {
//   const viewbususerstaff({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.red,
//       ),
//       home: const viewbususerstaffpagePage(title: 'Flutter Demo Home Page'),
//       routes: {
//
//       },
//     );
//   }
// }
//
// class viewbususerstaffpagePage extends StatefulWidget {
//   const viewbususerstaffpagePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<viewbususerstaffpagePage> createState() => _viewbususerstaffpagePage();
// }
//
// class _viewbususerstaffpagePage extends State<viewbususerstaffpagePage> {
//   int _counter = 0;
//
//   _viewbususerstaffpagePage() {
//     view_college();
//   }
//
//
//
//   List<String> cid_ = <String>[];
//   List<String> rid_ = <String>[];
//   List<String> cname_ = <String>[];
//   List<String> oname_ = <String>[];
//   List<String> caddress_ = <String>[];
//   List<String> cphone_= <String>[];
//   List<String> cemail_ = <String>[];
//
//
//   Future<void> view_college() async {
//     List<String> cid = <String>[];
//     List<String> rid = <String>[];
//     List<String> cname = <String>[];
//     List<String> oname = <String>[];
//     List<String> caddress = <String>[];
//     List<String> cemail = <String>[];
//     List<String> cphone = <String>[];
//
//
//     try {
//       final pref=await SharedPreferences.getInstance();
//       String ip= pref.getString("url").toString();
//       String lid= pref.getString("lid").toString();
//
//       String url=ip+"viewbususerstaff/";
//       print(url);
//       print("=========================");
//
//       var data = await http.post(Uri.parse(url), body: {
//         "lid":lid    });
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr);
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         print("okkkkkkkkkkkkkkkkkkkkkkkk");
//         cid.add(arr[i]['id'].toString());
//         cname.add(arr[i]['name'].toString());
//         oname.add(arr[i]['oname'].toString());
//         caddress.add(arr[i]['regno'].toString());
//         rid.add(arr[i]['rid'].toString());
//         // cphone.add(arr[i]['phone'].toString());
//         // cemail.add(arr[i]['email'].toString());
//         print("ppppppppppppppppppp");
//       }
//
//       setState(() {
//         cid_ = cid;
//         cname_ = cname;
//         oname_ = oname;
//         rid_ = rid;
//
//         caddress_ = caddress;
//         // cemail_ = cemail;
//         // cphone_ = cphone;
//
//       });
//
//       print(cid_.length);
//       print("+++++++++++++++++++++");
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         appBar: AppBar(
//             title: new Text(
//               "View All  Bus",
//               style: new TextStyle(color: Colors.white),
//             ),
//             leading: new IconButton(
//               icon: new Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Navigator.pushNamed(context, '/home');
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const  MyHomePage(title: '',)),);
//                 print("Hello");
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => ThirdScreen()),
//                 // );
//               },
//             )
//         ),
//
//         body:
//
//
//
//
//         ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: cid_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onLongPress: () {
//                 print("long press" + index.toString());
//               },
//               title: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     children: [
//
//
//                       Container(
//                         width: MediaQuery. of(context). size. width,
//                         height: 500,
//                         child: Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//
//
//
//
//
//
//
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Name")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cname_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("bus no")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(oname_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//
//
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("capacity")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(caddress_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               // SizedBox(height: 9,),
//                               // Row(
//                               //
//                               //   children: [
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //
//                               //     Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Phone")])),
//                               //     Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cphone_[index])])),
//                               //
//                               //     // Text("Place"),
//                               //     // Text(place_[index])
//                               //   ],
//                               // ), SizedBox(height: 9,),
//                               // Row(
//                               //
//                               //   children: [
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //
//                               //     Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Email")])),
//                               //     Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cemail_[index])])),
//                               //
//                               //     // Text("Place"),
//                               //     // Text(place_[index])
//                               //   ],
//                               // ),
//                               SizedBox(height: 9,),
//
//                               Container(
//                                 padding: EdgeInsets.all(5.0),
//                                 child:   Row(
//
//                                   children: [
//
//
//                                     SizedBox(width: 10.0,),
//                                     ElevatedButton(
//                                       onPressed: () async {
//
//                                         SharedPreferences prefs = await SharedPreferences.getInstance();
//                                         prefs.setString('rid', rid_[index]);
//
//
//
//                                         Navigator.push(
//                                           context,
//
//                                           MaterialPageRoute(builder: (context) => viewROUTEUSER()),
//                                         );
//
//                                       },
//                                       child: Text('view bus route'),
//                                     ),
//
//                                   ],
//                                 ),
//                               )
//
//
//                               // Column(
//                               //     mainAxisAlignment: MainAxisAlignment.start,
//                               //     crossAxisAlignment: CrossAxisAlignment.start,
//                               //     children:[
//                               //   Text('Title'),
//                               //   Text('Subtitle')
//                               // ])
//                             ],
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           elevation: 5,
//                           margin: EdgeInsets.all(10),
//                         ),
//                       ),
//
//
//                     ],
//                   )),
//             );
//           },
//
//         )
//
//
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//
//
//
//
//
// }
//
//
//
//
//

// import 'dart:convert';
// import 'dart:math';
//
//
//
// import 'package:bustracking/view%20route.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//
//
// class ViewBusUserStaff extends StatelessWidget {
//   const ViewBusUserStaff({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.red,
//       ),
//       home: const ViewBusUserStaffpagePage(title: 'Flutter Demo Home Page'),
//       routes: {
//
//       },
//     );
//   }
// }
//
// class ViewBusUserStaffpagePage extends StatefulWidget {
//   const ViewBusUserStaffpagePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<ViewBusUserStaffpagePage> createState() => _ViewBusUserStaffpagePage();
// }
//
// class _ViewBusUserStaffpagePage extends State<ViewBusUserStaffpagePage> {
//   int _counter = 0;
//
//   _ViewBusUserStaffpagePage() {
//     view_college();
//   }
//
//
//
//   List<String> cid_ = <String>[];
//   List<String> rid_ = <String>[];
//   List<String> cname_ = <String>[];
//   List<String> oname_ = <String>[];
//   List<String> caddress_ = <String>[];
//   List<String> cphone_= <String>[];
//   List<String> cemail_ = <String>[];
//
//
//   Future<void> view_college() async {
//     List<String> cid = <String>[];
//     List<String> rid = <String>[];
//     List<String> cname = <String>[];
//     List<String> oname = <String>[];
//     List<String> caddress = <String>[];
//     List<String> cemail = <String>[];
//     List<String> cphone = <String>[];
//
//
//     try {
//       final pref=await SharedPreferences.getInstance();
//       String ip= pref.getString("url").toString();
//       // String lid= pref.getString("lid").toString();
//
//       String url=ip+"ViewBusUserStaff/";
//       print(url);
//       print("=========================");
//
//       var data = await http.post(Uri.parse(url), body: {
//       });
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr);
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         print("okkkkkkkkkkkkkkkkkkkkkkkk");
//         cid.add(arr[i]['id'].toString());
//         cname.add(arr[i]['name'].toString());
//         oname.add(arr[i]['oname'].toString());
//         caddress.add(arr[i]['regno'].toString());
//         rid.add(arr[i]['rid'].toString());
//         cphone.add(arr[i]['status'].toString());
//         // cemail.add(arr[i]['email'].toString());
//         print("ppppppppppppppppppp");
//       }
//
//       setState(() {
//         cid_ = cid;
//         cname_ = cname;
//         oname_ = oname;
//         rid_ = rid;
//
//         caddress_ = caddress;
//         // cemail_ = cemail;
//         cphone_ = cphone;
//
//       });
//
//       print(cid_.length);
//       print("+++++++++++++++++++++");
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//         appBar: AppBar(
//             title: new Text(
//               "View All  Bus",
//               style: new TextStyle(color: Colors.white),
//             ),
//             leading: new IconButton(
//               icon: new Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Navigator.pushNamed(context, '/home');
//                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const  MyHomePage(title: '',)),);
//                 print("Hello");
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => ThirdScreen()),
//                 // );
//               },
//             )
//         ),
//
//         body:
//
//
//
//
//         ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: cid_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onLongPress: () {
//                 print("long press" + index.toString());
//               },
//               title: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     children: [
//
//
//                       Container(
//                         width: MediaQuery. of(context). size. width,
//                         height: 500,
//                         child: Card(
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//
//
//
//
//
//
//
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Name")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cname_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("bus no")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(oname_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//
//
//                               SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("capacity")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(caddress_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ), SizedBox(height: 16,),
//                               Row(
//
//                                 children: [
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//
//                                   Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("status")])),
//                                   Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cphone_[index])])),
//
//                                   // Text("Place"),
//                                   // Text(place_[index])
//                                 ],
//                               ),
//                               // SizedBox(height: 9,),
//                               // Row(
//                               //
//                               //   children: [
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //
//                               //     Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Phone")])),
//                               //     Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cphone_[index])])),
//                               //
//                               //     // Text("Place"),
//                               //     // Text(place_[index])
//                               //   ],
//                               // ), SizedBox(height: 9,),
//                               // Row(
//                               //
//                               //   children: [
//                               //     SizedBox(
//                               //       width: 10,
//                               //     ),
//                               //
//                               //     Flexible(flex: 2, fit: FlexFit.loose, child: Row(children: [Text("Email")])),
//                               //     Flexible(flex: 3, fit: FlexFit.loose, child: Row(children: [Text(cemail_[index])])),
//                               //
//                               //     // Text("Place"),
//                               //     // Text(place_[index])
//                               //   ],
//                               // ),
//                               SizedBox(height: 9,),
//
//                               Container(
//                                 padding: EdgeInsets.all(5.0),
//                                 child:   Row(
//
//                                   children: [
//
//
//                                     SizedBox(width: 10.0,),
//                                     ElevatedButton(
//                                       onPressed: () async {
//
//                                         SharedPreferences prefs = await SharedPreferences.getInstance();
//                                         prefs.setString('rid', rid_[index]);
//
//
//
//                                         Navigator.push(
//                                           context,
//
//                                           MaterialPageRoute(builder: (context) => viewROUTEUSER()),
//                                         );
//
//                                       },
//                                       child: Text('view bus route'),
//                                     ),
//
//                                   ],
//                                 ),
//                               )
//
//
//                               // Column(
//                               //     mainAxisAlignment: MainAxisAlignment.start,
//                               //     crossAxisAlignment: CrossAxisAlignment.start,
//                               //     children:[
//                               //   Text('Title'),
//                               //   Text('Subtitle')
//                               // ])
//                             ],
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           elevation: 5,
//                           margin: EdgeInsets.all(10),
//                         ),
//                       ),
//
//
//                     ],
//                   )),
//             );
//           },
//
//         )
//
//
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//
//
//
//
//
// }
//
//
//
//
//


import 'package:bustracking/update%20status.dart';
import 'package:url_launcher/url_launcher.dart';


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bustracking/view route.dart';

class ViewBusUserStaff extends StatelessWidget {
  const ViewBusUserStaff({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ViewBusUserStaffpagePage(title: 'View All Buses'),
    );
  }
}

class ViewBusUserStaffpagePage extends StatefulWidget {
  const ViewBusUserStaffpagePage({super.key, required this.title});

  final String title;

  @override
  State<ViewBusUserStaffpagePage> createState() => _ViewBusUserStaffpagePage();
}

Future<void> openGoogleMaps(String lati, String longi) async {
  final Uri googleUrl =
  Uri.parse("https://www.google.com/maps/search/?api=1&query=$lati,$longi");

  try {
    bool launched = await launchUrl(
      googleUrl,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      throw "Could not launch Google Maps";
    }
  } catch (e) {
    print("Error opening Google Maps: $e");
  }
}

class _ViewBusUserStaffpagePage extends State<ViewBusUserStaffpagePage> {
  _ViewBusUserStaffpagePage() {
    view_college();
  }

  List<String> cid_ = <String>[];
  List<String> rid_ = <String>[];
  List<String> cname_ = <String>[];
  List<String> oname_ = <String>[];
  List<String> caddress_ = <String>[];
  List<String> cphone_ = <String>[]; // status
  List<String> lat_ = <String>[]; // status
  List<String> log_ = <String>[]; // status

  Future<void> view_college() async {
    List<String> cid = <String>[];
    List<String> rid = <String>[];
    List<String> cname = <String>[];
    List<String> oname = <String>[];
    List<String> caddress = <String>[];
    List<String> cphone = <String>[]; // status
    List<String> lat = <String>[]; // status
    List<String> lon = <String>[]; // status

    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();
      String lid = pref.getString("lid").toString();

      String url = ip + "viewbususerstaff/";
      print(url);

      var data = await http.post(Uri.parse(url), body: {
        "lid":lid
      });
      var jsondata = json.decode(data.body);
      String status = jsondata['status'];

      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        cid.add(arr[i]['id'].toString());
        cname.add(arr[i]['name'].toString());
        oname.add(arr[i]['oname'].toString());
        caddress.add(arr[i]['regno'].toString());
        rid.add(arr[i]['rid'].toString());
        cphone.add(arr[i]['status'].toString());
        lat.add(arr[i]['lat'].toString());
        lon.add(arr[i]['lon'].toString());
      }

      setState(() {
        cid_ = cid;
        cname_ = cname;
        oname_ = oname;
        rid_ = rid;
        caddress_ = caddress;
        cphone_ = cphone;
        lat_ = lat;
        log_ = lon;
      });

      print(cid_.length);
      print(status);
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View All Buses",
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cid_.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              shadowColor: Colors.blueAccent.withOpacity(0.3),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bus Title Row
                    Row(
                      children: [
                        const Icon(Icons.directions_bus,
                            color: Colors.blue, size: 28),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            cname_[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Chip(
                          label: Text(
                            cphone_[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor:
                          cphone_[index] == "active" ? Colors.green : Colors.red,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Bus Info
                    Row(
                      children: [
                        const Icon(Icons.confirmation_number,
                            color: Colors.grey, size: 20),
                        const SizedBox(width: 8),
                        Text("Bus No: ${oname_[index]}",
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.people,
                            color: Colors.grey, size: 20),
                        const SizedBox(width: 8),
                        Text("Capacity: ${caddress_[index]}",
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              prefs.setString('rid', rid_[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => viewROUTEUSER()),
                              );
                            },
                            icon: const Icon(Icons.map, color: Colors.white),
                            label: const Text(
                              "View Route",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            // onPressed: () async {
                            //   final double? latitude = double.tryParse(lat_[index]);
                            //   final double? longitude = double.tryParse(log_[index]);
                            //
                            //   print("Lat: ${lat_[index]}, Lon: ${log_[index]}"); // Debugging
                            //
                            //   if (latitude != null && longitude != null) {
                            //     final Uri googleMapUrl = Uri.parse(
                            //       "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
                            //     ); // 👈 using search ensures it works everywhere
                            //
                            //     if (await canLaunchUrl(googleMapUrl)) {
                            //       await launchUrl(
                            //         googleMapUrl,
                            //         mode: LaunchMode.externalApplication,
                            //       );
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(
                            //           content: Text("Could not open Google Maps"),
                            //           backgroundColor: Colors.red,
                            //         ),
                            //       );
                            //     }
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       const SnackBar(
                            //         content: Text("Invalid bus location data"),
                            //         backgroundColor: Colors.red,
                            //       ),
                            //     );
                            //   }
                            // },
                            onPressed: () async {

                              await openGoogleMaps(lat_[index],log_[index]);
                            },


                            icon: const Icon(Icons.location_searching,
                                color: Colors.white),
                            label: const Text(
                              "Track Bus",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),          const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            // onPressed: () async {
                            //   final double? latitude = double.tryParse(lat_[index]);
                            //   final double? longitude = double.tryParse(log_[index]);
                            //
                            //   print("Lat: ${lat_[index]}, Lon: ${log_[index]}"); // Debugging
                            //
                            //   if (latitude != null && longitude != null) {
                            //     final Uri googleMapUrl = Uri.parse(
                            //       "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
                            //     ); // 👈 using search ensures it works everywhere
                            //
                            //     if (await canLaunchUrl(googleMapUrl)) {
                            //       await launchUrl(
                            //         googleMapUrl,
                            //         mode: LaunchMode.externalApplication,
                            //       );
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         const SnackBar(
                            //           content: Text("Could not open Google Maps"),
                            //           backgroundColor: Colors.red,
                            //         ),
                            //       );
                            //     }
                            //   } else {
                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       const SnackBar(
                            //         content: Text("Invalid bus location data"),
                            //         backgroundColor: Colors.red,
                            //       ),
                            //     );
                            //   }
                            // },
                            onPressed: () async {


                              SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                              prefs.setString('rid', rid_[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => update()),
                              );

                              // await openGoogleMaps(lat_[index],log_[index]);
                            },


                            icon: const Icon(Icons.update,
                                color: Colors.white),
                            label: const Text(
                              "update",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
