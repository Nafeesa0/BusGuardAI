import 'dart:convert';


import 'package:bustracking/reg.dart';
import 'package:bustracking/staff%20home.dart';
import 'package:bustracking/userhome.dart';
import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'forgotpassword.dart';
import 'location_service.dart';
//
//
// class login extends StatefulWidget {
//   const login({super.key});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//
//
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: usernameController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     hintText: "Username",
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: passwordController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(),
//                     hintText: "Password",
//                   ),
//                 ),
//               ),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => RegisterPage()));
//                         },
//                         child: Text("Registration"),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed: ()async {
//                           final sh = await SharedPreferences.getInstance();
//                           String Uname=usernameController.text.toString();
//                           String Passwd=passwordController.text.toString();
//                           String url = sh.getString("url").toString();
//                           print("okkkkkkkkkkkkkkkkk");
//                           var data = await http.post(
//                               Uri.parse(url+"logincode/"),
//                               body: {'username':Uname,
//                                 "password":Passwd,
//                               });
//                           var jasondata = json.decode(data.body);
//                           String status=jasondata['task'].toString();
//                           String type=jasondata['type'].toString();
//                           if(status=="valid") {
//                             if (type == 'user') {
//                               String lid = jasondata['lid'].toString();
//                               sh.setString("lid", lid);
//                               Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomePage()));
//                             }
//                             else if (type == 'staff') {
//
//                               String lid = jasondata['lid'].toString();
//                               sh.setString("lid", lid);
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => ShakeDetectionDemo()),
//                               );
//                               Navigator.push(context,
//                                   MaterialPageRoute(
//                                       builder: (context) => staff_home()));
//                             }
//                             else{
//                               print("error");
//
//                             }
//                           }
//                           else{
//                             print("error");
//
//                           }
//
//                         },
//                         child: const Text("Login"),
//                       ),
//                     )
//                   ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bustracking/staff%20home.dart';
import 'package:flutter/material.dart';

import 'location_service.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background 🌈
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF90CAF9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo / Icon
                  Icon(Icons.directions_bus,
                      size: 100, color: Colors.white),
                  const SizedBox(height: 16),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Login Card
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.white.withOpacity(0.95),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email,
                                  color: Colors.blue),
                              labelText: "Email / Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock,
                                  color: Colors.blue),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {

                          final sh = await SharedPreferences.getInstance();
                          String Uname=_emailController.text.toString();
                          String Passwd=_passwordController.text.toString();
                          String url = sh.getString("url").toString();
                          print(url);
                          print('url================');
                          print('url================');
                          print('url================');
                          print('url================');
                          print("okkkkkkkkkkkkkkkkk");
                          var data = await http.post(
                              Uri.parse(url+"logincode/"),
                              body: {'username':Uname,
                                "password":Passwd,
                              });
                          var jasondata = json.decode(data.body);
                          String status=jasondata['task'].toString();
                          String type=jasondata['type'].toString();

                          print(status);
                          print(type);
                          print('===============');
                          print('===============');
                          print('===============');
                          print('===============');

                          if(status=="valid") {
                            if (type == 'user') {
                              String lid = jasondata['lid'].toString();
                              sh.setString("lid", lid);
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                            else if (type == 'staff') {

                              String lid = jasondata['lid'].toString();
                              sh.setString("lid", lid);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShakeDetectionDemo()),
                              );
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => staff_home()));
                            }
                            else{
                              print("error");

                            }
                          }
                          else{
                            print("error");

                          }

                        },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Forgot password
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => forgot()));
                              },


                            child: const Text("Forgot Password?",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RegisterPage()));
                        },

                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
