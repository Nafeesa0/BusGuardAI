import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class staffViewAccident extends StatefulWidget {
  const staffViewAccident({super.key});

  @override
  State<staffViewAccident> createState() => _staffViewAccidentState();
}

class _staffViewAccidentState extends State<staffViewAccident> {
  _staffViewAccidentState() {
    fetchAccidents();
  }

  List<String> id_ = [];
  List<String> bus_ = [];
  // List<String> staff_ = [];
  List<String> date_ = [];
  List<String> time_ = [];
  List<String> lati_ = [];
  List<String> longi_ = [];

  Future<void> fetchAccidents() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();
      String lid = pref.getString("lid").toString();

      String url = ip + "staffViewAccidentflutter/";
      print(url);

      var data = await http.post(Uri.parse(url), body: {"lid": lid});
      var jsondata = json.decode(data.body);

      if (jsondata["status"] == "ok") {
        List<String> id = [];
        List<String> bus = [];
        // List<String> staff = [];
        List<String> date = [];
        List<String> time = [];
        List<String> lati = [];
        List<String> longi = [];

        var arr = jsondata["data"];
        for (int i = 0; i < arr.length; i++) {
          id.add(arr[i]['id'].toString());
          bus.add(arr[i]['bus'].toString());
          // staff.add(arr[i]['STAFF'].toString());
          date.add(arr[i]['date'].toString());
          time.add(arr[i]['time'].toString());
          lati.add(arr[i]['latitudea'].toString());
          longi.add(arr[i]['longititude'].toString());
        }

        setState(() {
          id_ = id;
          bus_ = bus;
          // staff_ = staff;
          date_ = date;
          time_ = time;
          lati_ = lati;
          longi_ = longi;
        });
      }
    } catch (e) {
      print("Error ------------------- ${e.toString()}");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🚨 Accident Reports"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: id_.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              shadowColor: Colors.redAccent.withOpacity(0.3),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Accident Info
                    Row(
                      children: [
                        const Icon(Icons.directions_bus,
                            color: Colors.red, size: 28),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Bus: ${bus_[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Text("Staff: ${staff_[index]}"),
                    Text("Date: ${date_[index]}"),
                    Text("Time: ${time_[index]}"),

                    const SizedBox(height: 10),

                    // Track Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          openGoogleMaps(lati_[index], longi_[index]);
                        },
                        icon: const Icon(Icons.map, color: Colors.white),
                        label: const Text("Track Location"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
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
