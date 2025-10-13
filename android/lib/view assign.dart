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
//
// class viewbusassign extends StatelessWidget {
//   const viewbusassign({super.key});
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
//       home: const viewbusassignpagePage(title: 'Flutter Demo Home Page'),
//       routes: {
//
//       },
//     );
//   }
// }
//
// class viewbusassignpagePage extends StatefulWidget {
//   const viewbusassignpagePage({super.key, required this.title});
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
//   State<viewbusassignpagePage> createState() => _viewbusassignpagePage();
// }
//
// class _viewbusassignpagePage extends State<viewbusassignpagePage> {
//   int _counter = 0;
//
//   _viewbusassignpagePage() {
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
//       String lid= pref.getString("rid").toString();
//
//       String url=ip+"viewbusassign/";
//       print(url);
//       print("=========================");
//
//       var data = await http.post(Uri.parse(url), body: { "kid":lid
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



import 'dart:convert';
import 'package:bustracking/view%20route.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewBusAssign extends StatelessWidget {
  const ViewBusAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ViewBusAssignPage(title: 'Assigned Buses'),
    );
  }
}

class ViewBusAssignPage extends StatefulWidget {
  const ViewBusAssignPage({super.key, required this.title});
  final String title;

  @override
  State<ViewBusAssignPage> createState() => _ViewBusAssignPageState();
}

class _ViewBusAssignPageState extends State<ViewBusAssignPage> {
  List<String> cid_ = <String>[];
  List<String> rid_ = <String>[];
  List<String> cname_ = <String>[];
  List<String> oname_ = <String>[];
  List<String> caddress_ = <String>[];

  _ViewBusAssignPageState() {
    viewCollege();
  }

  Future<void> viewCollege() async {
    List<String> cid = <String>[];
    List<String> rid = <String>[];
    List<String> cname = <String>[];
    List<String> oname = <String>[];
    List<String> caddress = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();
      String lid = pref.getString("rid").toString();

      String url = "$ip/viewbusassign/";
      print("Fetching buses from: $url");

      var data = await http.post(Uri.parse(url), body: {"kid": lid});
      var jsondata = json.decode(data.body);
      String status = jsondata['status'];

      var arr = jsondata["data"];
      for (int i = 0; i < arr.length; i++) {
        cid.add(arr[i]['id'].toString());
        cname.add(arr[i]['name'].toString());
        oname.add(arr[i]['oname'].toString());
        caddress.add(arr[i]['regno'].toString());
        rid.add(arr[i]['rid'].toString());
      }

      setState(() {
        cid_ = cid;
        cname_ = cname;
        oname_ = oname;
        rid_ = rid;
        caddress_ = caddress;
      });

      print("Loaded ${cid_.length} buses | Status: $status");
    } catch (e) {
      print("Error fetching buses: ${e.toString()}");
    }
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
          Expanded(
            flex: 3,
            child: Text(value,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: cid_.isEmpty
          ? const Center(
        child: CircularProgressIndicator(color: Colors.indigo),
      )
          : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cid_.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            elevation: 6,
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoRow("Name", cname_[index]),
                  infoRow("Bus No", oname_[index]),
                  infoRow("Capacity", caddress_[index]),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
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
                      icon: const Icon(Icons.directions_bus),
                      label: const Text("View Route"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
