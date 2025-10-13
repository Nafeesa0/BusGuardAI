import 'dart:convert';

import 'package:bustracking/staff%20home.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'login.dart';




class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updatestate();
}

class _updatestate extends State<update> {
  final TextEditingController ipController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("STATUS"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: TextField(

                  controller: ipController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Status",
                      hintText: "Enter status"),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async{



                    final sh = await SharedPreferences.getInstance();

                    String Passwd=ipController.text.toString();
                    String url = sh.getString("url").toString();
                    String bid = sh.getString("rid").toString();
                    String lid = sh.getString("lid").toString();
                    print("okkkkkkkkkkkkkkkkk");
                    var data = await http.post(
                        Uri.parse(url+"updatestats"),
                        body: {
                          "status":Passwd,
                          "bid":bid,
                          "lid":lid,
                        });
                    var jasondata = json.decode(data.body);
                    print(jasondata);
                    String status=jasondata['status'].toString();

                    if(status=="valid") {

                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => staff_home()));
                    }
                    else{
                      print("error");

                    }
                  },
                  child: const Icon(Icons.key),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.amber, // Use a proper color value (e.g., Hex or RGB)
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}