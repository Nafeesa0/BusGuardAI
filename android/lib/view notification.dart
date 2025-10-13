

import 'package:url_launcher/url_launcher.dart';


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bustracking/view route.dart';

class viewnotification extends StatelessWidget {
  const viewnotification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const viewnotificationpagePage(title: 'View All Buses'),
    );
  }
}

class viewnotificationpagePage extends StatefulWidget {
  const viewnotificationpagePage({super.key, required this.title});

  final String title;

  @override
  State<viewnotificationpagePage> createState() => _viewnotificationpagePage();
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

class _viewnotificationpagePage extends State<viewnotificationpagePage> {
  _viewnotificationpagePage() {
    view_college();
  }

  List<String> cid_ = <String>[];

  List<String> cname_ = <String>[];
  List<String> oname_ = <String>[];


  Future<void> view_college() async {
    List<String> cid = <String>[];
    List<String> cname = <String>[];
    List<String> oname = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();
      String lid = pref.getString("lid").toString();

      String url = ip + "viewnotificationflutter/";
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
        oname.add(arr[i]['message'].toString());

      }

      setState(() {
        cid_ = cid;
        cname_ = cname;
        oname_ = oname;

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
          "View Notification",
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
                        // Chip(
                        //   label: Text(
                        //     cphone_[index],
                        //     style: const TextStyle(color: Colors.white),
                        //   ),
                        //   backgroundColor:
                        //   cphone_[index] == "active" ? Colors.green : Colors.red,
                        // ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Bus Info
                    Row(
                      children: [
                        const Icon(Icons.confirmation_number,
                            color: Colors.grey, size: 20),
                        const SizedBox(width: 8),
                        Text("Bus Name: ${cname_[index]}",
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ), Row(
                      children: [
                        const Icon(Icons.confirmation_number,
                            color: Colors.grey, size: 20),
                        const SizedBox(width: 8),
                        Text("message: ${oname_[index]}",
                            style: const TextStyle(fontSize: 16)),
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
