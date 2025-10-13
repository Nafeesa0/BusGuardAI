import 'dart:convert';
import 'package:bustracking/view%20assign.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<String> reqId_ = <String>[];
  List<String> status_ = <String>[];
  List<String> fromStop_ = <String>[];
  List<String> toStop_ = <String>[];
  List<String> date_ = <String>[];

  _RequestPageState() {
    load();
  }

  Future<void> load() async {
    List<String> reqId = <String>[];
    List<String> status = <String>[];
    List<String> fromStop = <String>[];
    List<String> toStop = <String>[];
    List<String> date = <String>[];

    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();
      String rid = pref.getString("rid").toString();

      String url = ip + "managerequest";
      print(url);

      var data = await http.post(Uri.parse(url), body: {'rid': rid});
      var jsondata = json.decode(data.body);

      var arr = jsondata["data"];
      print(arr);

      for (int i = 0; i < arr.length; i++) {
        reqId.add(arr[i]['id'].toString());
        status.add(arr[i]['status'].toString());
        fromStop.add(arr[i]['fromstop'].toString());
        toStop.add(arr[i]['tostop'].toString());
        date.add(arr[i]['date'].toString());
      }
      setState(() {
        reqId_ = reqId;
        status_ = status;
        fromStop_ = fromStop;
        toStop_ = toStop;
        date_ = date;
      });
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  /// ✅ Delete Request API
  // Future<void> deleteRequest(String reqId) async {
  //   try {
  //     final pref = await SharedPreferences.getInstance();
  //     String ip = pref.getString("url").toString();
  //
  //     String url = ip + "deleterequest";
  //     print("Deleting request at $url with id=$reqId");
  //
  //     var data = await http.post(Uri.parse(url), body: {'rid': reqId});
  //     var jsondata = json.decode(data.body);
  //
  //     if (jsondata['status'] == "ok") {
  //       setState(() {
  //         int index = reqId_.indexOf(reqId);
  //         reqId_.removeAt(index);
  //         status_.removeAt(index);
  //         fromStop_.removeAt(index);
  //         toStop_.removeAt(index);
  //         date_.removeAt(index);
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Request deleted successfully")),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Delete failed")),
  //       );
  //     }
  //   } catch (e) {
  //     print("Delete error: " + e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Requests")),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: reqId_.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status: ${status_[index]}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("From: ${fromStop_[index]}"),
                      Text("To: ${toStop_[index]}"),
                      Text("Date: ${date_[index]}"),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          // deleteRequest(reqId_[index]);

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('rid', reqId_[index]);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewBusAssign()),
                          );
                        },
                        icon: Icon(Icons.assignment, color: Colors.white),
                        label: Text("assigned"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewRequestPage(),
            ),
          ).then((_) => load());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NewRequestPage extends StatefulWidget {
  @override
  _NewRequestPageState createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequestPage> {
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _fromStopController = TextEditingController();
  final TextEditingController _toStopController = TextEditingController();
  // final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _statusController.dispose();
    _fromStopController.dispose();
    _toStopController.dispose();
    // _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Request")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _fromStopController,
              decoration: InputDecoration(hintText: "Enter from stop..."),
            ),
            TextField(
              controller: _toStopController,
              decoration: InputDecoration(hintText: "Enter to stop..."),
            ),
            // TextField(
            //   controller: _dateController,
            //   decoration: InputDecoration(hintText: "Enter date (YYYY-MM-DD)..."),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final sh = await SharedPreferences.getInstance();
                // String status = _statusController.text;
                String fromStop = _fromStopController.text;
                String toStop = _toStopController.text;
                // String date = _dateController.text;
                String url = sh.getString("url").toString();
                String lid = sh.getString("lid").toString();
                String rid = sh.getString("rid").toString();

                var data = await http.post(Uri.parse(url + "addrequest"), body: {
                  // 'status': status,
                  'fromstop': fromStop,
                  'tostop': toStop,
                  'rid': rid,
                  'lid': lid
                });

                var jasondata = json.decode(data.body);

                if (jasondata['task'].toString() == "ok") {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => RequestPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to add request")),
                  );
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
