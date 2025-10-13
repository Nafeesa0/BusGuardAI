// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import 'login.dart';
//
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController nameCtrl = TextEditingController();
//   TextEditingController emailCtrl = TextEditingController();
//   TextEditingController phoneCtrl = TextEditingController();
//   TextEditingController usernameCtrl = TextEditingController();
//   TextEditingController passwordCtrl = TextEditingController();
//
//   // void registerUser() {
//   //   if (_formKey.currentState!.validate()) {
//   //     // Send data to Django backend API
//   //     print("Name: ${nameCtrl.text}");
//   //     print("Email: ${emailCtrl.text}");
//   //     print("Phone: ${phoneCtrl.text}");
//   //     print("Username: ${usernameCtrl.text}");
//   //     print("Password: ${passwordCtrl.text}");
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Parent Registration")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: nameCtrl,
//                   decoration: InputDecoration(labelText: "Full Name"),
//                   validator: (v) => v!.isEmpty ? "Enter your name" : null,
//                 ),
//                 TextFormField(
//                   controller: emailCtrl,
//                   decoration: InputDecoration(labelText: "Email"),
//                   validator: (v) => v!.isEmpty ? "Enter your email" : null,
//                 ),
//                 TextFormField(
//                   controller: phoneCtrl,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(labelText: "Phone"),
//                   validator: (v) => v!.isEmpty ? "Enter your phone" : null,
//                 ),
//                 TextFormField(
//                   controller: usernameCtrl,
//                   decoration: InputDecoration(labelText: "Username"),
//                   validator: (v) => v!.isEmpty ? "Enter username" : null,
//                 ),
//                 TextFormField(
//                   controller: passwordCtrl,
//                   obscureText: true,
//                   decoration: InputDecoration(labelText: "Password"),
//                   validator: (v) => v!.length < 6 ? "Password must be 6+ chars" : null,
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if(!_formKey.currentState!.validate())
//                     {print("vvvvvvvvvvvvvvvvvvv");}
//                     else{
//                       final sh = await SharedPreferences.getInstance();
//                       print("Name: ${nameCtrl.text}");
//                       print("Email: ${emailCtrl.text}");
//                       print("Phone: ${phoneCtrl.text}");
//                       print("Username: ${usernameCtrl.text}");
//                       print("Password: ${passwordCtrl.text}");
//                       String name=nameCtrl.text.toString();
//                       String phone=phoneCtrl.text.toString();
//                       String email=emailCtrl.text.toString();
//                       String uname=usernameCtrl.text.toString();
//                       String pasword=passwordCtrl.text.toString();
//
//
//                       String url = sh.getString("url").toString();
//                       print("okkkkkkkkkkkkkkkkk");
//                       var data = await http.post(
//                           Uri.parse(url+"registrationcode/"),
//                           body: {'name':name,
//                             'phone':phone,
//                             'email':email,
//                             'uname':uname,
//                             'password':pasword,
//
//                           });
//                       var jasondata = json.decode(data.body);
//                       String status=jasondata['task'].toString();
//                       if(status=="valid")
//                       {
//
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => login()));
//
//                       }
//                       else{
//                         print("error");
//
//                       }}
//
//                   },
//                   child: Text("Register"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Parent Registration"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Full Name
                    TextFormField(
                      controller: nameCtrl,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? "Enter your name" : null,
                    ),
                    const SizedBox(height: 15),

                    // Email
                    TextFormField(
                      controller: emailCtrl,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? "Enter your email" : null,
                    ),
                    const SizedBox(height: 15),

                    // Phone
                    TextFormField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: "Phone",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? "Enter your phone" : null,
                    ),
                    const SizedBox(height: 15),

                    // Username
                    TextFormField(
                      controller: usernameCtrl,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.account_circle),
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? "Enter username" : null,
                    ),
                    const SizedBox(height: 15),

                    // Password
                    TextFormField(
                      controller: passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (v) =>
                      v!.length < 6 ? "Password must be 6+ chars" : null,
                    ),
                    const SizedBox(height: 25),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: _registerUser,
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => login()),
                        );
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    final sh = await SharedPreferences.getInstance();
    String url = sh.getString("url").toString();

    var data = await http.post(
      Uri.parse("$url/registrationcode/"),
      body: {
        'name': nameCtrl.text,
        'phone': phoneCtrl.text,
        'email': emailCtrl.text,
        'uname': usernameCtrl.text,
        'password': passwordCtrl.text,
      },
    );

    var jsonData = json.decode(data.body);
    String status = jsonData['task'].toString();

    if (status == "valid") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration failed!")),
      );
    }
  }
}
