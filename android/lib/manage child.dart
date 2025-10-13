// import 'dart:convert';
// import 'package:bustracking/send%20requesest.dart';
// import 'package:bustracking/userhome.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ChildPage extends StatefulWidget {
//   @override
//   _ChildPageState createState() => _ChildPageState();
// }
//
// class _ChildPageState extends State<ChildPage> {
//   List<String> ccid_ = <String>[];
//   List<String> name_ = <String>[];
//   List<String> gender_ = <String>[];
//
//   _ChildPageState() {
//     load();
//   }
//
//   Future<void> load() async {
//     List<String> ccid = <String>[];
//     List<String> name = <String>[];
//     List<String> gender = <String>[];
//
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String lid = pref.getString("lid").toString();
//       String ip = pref.getString("url").toString();
//
//       String url = ip + "managechild";
//       print(url);
//
//       var data = await http.post(Uri.parse(url), body: {'lid': lid});
//       var jsondata = json.decode(data.body);
//       String status = jsondata['status'];
//
//       var arr = jsondata["data"];
//       print(arr);
//
//       for (int i = 0; i < arr.length; i++) {
//         ccid.add(arr[i]['id'].toString());
//         name.add(arr[i]['name'].toString());
//         gender.add(arr[i]['gender'].toString());
//       }
//       setState(() {
//         ccid_ = ccid;
//         name_ = name;
//         gender_ = gender;
//       });
//       print(status);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//
//   /// ✅ Delete Child API
//   Future<void> deleteChild(String childId) async {
//     try {
//       final pref = await SharedPreferences.getInstance();
//       String ip = pref.getString("url").toString();
//
//       String url = ip + "deletechild";
//       print("Deleting child at $url with id=$childId");
//
//       var data = await http.post(Uri.parse(url), body: {'cid': childId});
//       var jsondata = json.decode(data.body);
//
//       if (jsondata['status'] == "ok") {
//         setState(() {
//           int index = ccid_.indexOf(childId);
//           ccid_.removeAt(index);
//           name_.removeAt(index);
//           gender_.removeAt(index);
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Child deleted successfully")),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Delete failed")),
//         );
//       }
//     } catch (e) {
//       print("Delete error: " + e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Children")),
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: ccid_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Column(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 200,
//                     child: Card(
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: Column(
//                         children: [
//                           SizedBox(height: 16),
//                           Row(
//                             children: [
//                               SizedBox(width: 10),
//                               Flexible(
//                                   flex: 2,
//                                   child: Text("Name",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold))),
//                               Flexible(flex: 3, child: Text(name_[index])),
//                             ],
//                           ),
//                           SizedBox(height: 16),
//                           Row(
//                             children: [
//                               SizedBox(width: 10),
//                               Flexible(
//                                   flex: 2,
//                                   child: Text("Gender",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold))),
//                               Flexible(flex: 3, child: Text(gender_[index])),
//                             ],
//                           ),
//                           SizedBox(height: 20),
//                           ElevatedButton.icon(
//                             onPressed: () {
//                               deleteChild(ccid_[index]);
//                             },
//                             icon: Icon(Icons.delete, color: Colors.white),
//                             label: Text("Delete"),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                             ),
//                           ),
//                           SizedBox(height: 20),
//                           ElevatedButton.icon(
//                             onPressed: () async {
//                               SharedPreferences prefs = await SharedPreferences.getInstance();
//                               prefs.setString('rid', ccid_[index]);
//
//
//
//                               Navigator.push(
//                                 context,
//
//                                 MaterialPageRoute(builder: (context) => RequestPage()),
//                               );
//
//
//                             },
//                             icon: Icon(Icons.delete, color: Colors.white),
//                             label: Text("Delete"),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                             ),
//                           ),
//                         ],
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       elevation: 5,
//                       margin: EdgeInsets.all(10),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NewChildPagePage(),
//             ),
//           ).then((_) => load());
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class NewChildPagePage extends StatefulWidget {
//   @override
//   _NewChildPagePageState createState() => _NewChildPagePageState();
// }
//
// class _NewChildPagePageState extends State<NewChildPagePage> {
//   final TextEditingController _ChildPageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//
//   @override
//   void dispose() {
//     _ChildPageController.dispose();
//     _genderController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Add Child")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _ChildPageController,
//               decoration: InputDecoration(hintText: "Enter name..."),
//             ),
//             TextField(
//               controller: _genderController,
//               decoration: InputDecoration(hintText: "Enter gender..."),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 final sh = await SharedPreferences.getInstance();
//                 String namee = _ChildPageController.text;
//                 String genderr = _genderController.text;
//                 String url = sh.getString("url").toString();
//                 String lid = sh.getString("lid").toString();
//
//                 var data = await http.post(Uri.parse(url + "addchild"),
//                     body: {'name': namee, 'gender': genderr, 'lid': lid});
//                 var jasondata = json.decode(data.body);
//
//                 if (jasondata['task'].toString() == "ok") {
//                   Navigator.pushReplacement(
//                       context, MaterialPageRoute(builder: (context) => ChildPage()));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Failed to add child")),
//                   );
//                 }
//               },
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:bustracking/send%20requesest.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChildPage extends StatefulWidget {
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  List<String> ccid_ = [];
  List<String> name_ = [];
  List<String> gender_ = [];

  _ChildPageState() {
    load();
  }

  Future<void> load() async {
    try {
      final pref = await SharedPreferences.getInstance();
      String lid = pref.getString("lid").toString();
      String ip = pref.getString("url").toString();

      String url = ip + "managechild";
      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);

      var arr = jsondata["data"];

      List<String> ccid = [];
      List<String> name = [];
      List<String> gender = [];

      for (int i = 0; i < arr.length; i++) {
        ccid.add(arr[i]['id'].toString());
        name.add(arr[i]['name'].toString());
        gender.add(arr[i]['gender'].toString());
      }

      setState(() {
        ccid_ = ccid;
        name_ = name;
        gender_ = gender;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  /// ✅ Delete Child API
  Future<void> deleteChild(String childId) async {
    try {
      final pref = await SharedPreferences.getInstance();
      String ip = pref.getString("url").toString();

      String url = ip + "deletechild";
      var data = await http.post(Uri.parse(url), body: {'cid': childId});
      var jsondata = json.decode(data.body);

      if (jsondata['status'] == "ok") {
        setState(() {
          int index = ccid_.indexOf(childId);
          ccid_.removeAt(index);
          name_.removeAt(index);
          gender_.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Child deleted successfully")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Delete failed")),
        );
      }
    } catch (e) {
      print("Delete error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Children"),
        backgroundColor: Colors.blue,
      ),
      body: ccid_.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        physics: BouncingScrollPhysics(),
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
                    // Name
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.blue, size: 28),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            name_[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Gender
                    Row(
                      children: [
                        Icon(Icons.wc, color: Colors.purple, size: 22),
                        SizedBox(width: 10),
                        Text(
                          gender_[index],
                          style: TextStyle(
                              fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Buttons Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Delete Button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            deleteChild(ccid_[index]);
                          },
                          icon: Icon(Icons.delete, color: Colors.white),
                          label: Text("Delete",
                              style: TextStyle(color: Colors.white)),
                        ),

                        // Request Button
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            prefs.setString('rid', ccid_[index]);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestPage()),
                            );
                          },
                          icon: Icon(Icons.send, color: Colors.white),
                          label: Text("Send Request",
                              style: TextStyle(color: Colors.white)),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewChildPagePage(),
            ),
          ).then((_) => load());
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class NewChildPagePage extends StatefulWidget {
  @override
  _NewChildPagePageState createState() => _NewChildPagePageState();
}

class _NewChildPagePageState extends State<NewChildPagePage> {
  final TextEditingController _ChildPageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _ChildPageController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Child"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Child Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _ChildPageController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(
                labelText: "Gender",
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
                  String genderr = _genderController.text;
                  String url = sh.getString("url").toString();
                  String lid = sh.getString("lid").toString();

                  var data = await http.post(Uri.parse(url + "addchild"),
                      body: {'name': namee, 'gender': genderr, 'lid': lid});
                  var jasondata = json.decode(data.body);

                  if (jasondata['task'].toString() == "ok") {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChildPage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Failed to add child")),
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
