import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class viewstopUSER extends StatelessWidget {
  const viewstopUSER({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Stops',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const viewstopUSERPage(title: 'View Stops'),
    );
  }
}

class viewstopUSERPage extends StatefulWidget {
  const viewstopUSERPage({super.key, required this.title});
  final String title;

  @override
  State<viewstopUSERPage> createState() => _viewstopUSERPageState();
}

class _viewstopUSERPageState extends State<viewstopUSERPage> {
  List<String> ccid_ = [];
  List<String> Name_ = [];
  List<String> Address_ = [];
  List<String> Email_ = [];

  _viewstopUSERPageState() {
    load();
  }

  Future<void> load() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String vid = pref.getString("rid").toString();
      String ip = pref.getString("url").toString();

      String url = "$ip/viewstop/";
      print(url);

      var data = await http.post(Uri.parse(url), body: {'rid': vid});
      var jsondata = json.decode(data.body);

      var arr = jsondata["data"];

      List<String> ccid = [];
      List<String> Name = [];
      List<String> Address = [];
      List<String> Email = [];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        Name.add(arr[i]['stop'].toString());
        Address.add(arr[i]['lati'].toString());
        Email.add(arr[i]['longi'].toString());
      }

      setState(() {
        ccid_ = ccid;
        Name_ = Name;
        Address_ = Address;
        Email_ = Email;
      });
    } catch (e) {
      print("Error ------------------- $e");
    }
  }

  /// Function to open Google Maps
  Future<void> openGoogleMaps(String lati, String longi) async {
    final Uri googleUrl =
    Uri.parse("https://www.google.com/maps/search/?api=1&query=$lati,$longi");

    try {
      bool launched = await launchUrl(
        googleUrl,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) throw "Could not launch Google Maps";
    } catch (e) {
      print("Error opening Google Maps: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Stops", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ccid_.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
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
                    // Stop Name
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.red, size: 26),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            Name_[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Coordinates
                    Row(
                      children: [
                        const Icon(Icons.map, color: Colors.green, size: 22),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Lat: ${Address_[index]}, Lng: ${Email_[index]}",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Track Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          await openGoogleMaps(
                              Address_[index], Email_[index]);
                        },
                        icon: const Icon(Icons.directions, color: Colors.white),
                        label: const Text(
                          "Track",
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
