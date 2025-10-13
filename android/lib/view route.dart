import 'dart:convert';
import 'package:bustracking/view stop.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class viewROUTEUSER extends StatelessWidget {
  const viewROUTEUSER({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Route',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const viewROUTEUSERPage(title: 'View Route'),
    );
  }
}

class viewROUTEUSERPage extends StatefulWidget {
  const viewROUTEUSERPage({super.key, required this.title});
  final String title;

  @override
  State<viewROUTEUSERPage> createState() => _viewROUTEUSERPageState();
}

class _viewROUTEUSERPageState extends State<viewROUTEUSERPage> {
  List<String> ccid_ = [];
  List<String> Name_ = [];
  List<String> spoint_ = [];
  List<String> epoint_ = [];

  _viewROUTEUSERPageState() {
    load();
  }

  Future<void> load() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String vid = pref.getString("rid").toString();
      String ip = pref.getString("url").toString();

      String url = ip + "viewROUTEUSER/";
      var data = await http.post(Uri.parse(url), body: {'rid': vid});

      var jsondata = json.decode(data.body);
      String status = jsondata['status'];
      var arr = jsondata["data"];

      List<String> ccid = [];
      List<String> Name = [];
      List<String> spoint = [];
      List<String> epoint = [];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        Name.add(arr[i]['name'].toString());
        spoint.add(arr[i]['startpoint'].toString());
        epoint.add(arr[i]['endpoint'].toString());
      }

      setState(() {
        ccid_ = ccid;
        Name_ = Name;
        spoint_ = spoint;
        epoint_ = epoint;
      });

      print(status);
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Route", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ccid_.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              elevation: 6,
              shadowColor: Colors.blue.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Route Name
                    Row(
                      children: [
                        const Icon(Icons.alt_route, color: Colors.blue, size: 26),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            Name_[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20, thickness: 1),

                    // Start Point
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.green, size: 22),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Start: ${spoint_[index]}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // End Point
                    Row(
                      children: [
                        const Icon(Icons.flag, color: Colors.red, size: 22),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "End: ${epoint_[index]}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // View Stop Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString('rid', ccid_[index]);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => viewstopUSER()),
                          );
                        },
                        icon: const Icon(Icons.directions_bus, color: Colors.white),
                        label: const Text(
                          "View Stops",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
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
