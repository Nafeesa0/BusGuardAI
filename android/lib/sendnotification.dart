
import 'dart:convert';
import 'package:bustracking/send%20requesest.dart';
import 'package:bustracking/staffviewstudent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class staffsendnotification extends StatefulWidget {
  @override
  _staffsendnotificationState createState() => _staffsendnotificationState();
}

class _staffsendnotificationState extends State<staffsendnotification> {
  final TextEditingController _ChildPageController = TextEditingController();


  @override
  void dispose() {
    _ChildPageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add notification"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Notification",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _ChildPageController,
              decoration: InputDecoration(
                labelText: "message",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
       
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  final sh = await SharedPreferences.getInstance();
                  String namee = _ChildPageController.text;
                 
                  String url = sh.getString("url").toString();
                  String lid = sh.getString("lid").toString();
                  String cid = sh.getString("rid").toString();

                  var data = await http.post(Uri.parse(url + "sendnoti"),
                      body: {'name': namee,  'rid': cid,'lid':lid});
                  var jasondata = json.decode(data.body);

                  if (jasondata['task'].toString() == "ok") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => staffChildPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to sebnd notification")),
                    );
                  }
                },
                child: Text("Submit",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
