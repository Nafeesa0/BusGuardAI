// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // removes debug banner
//       title: "BusNav",
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const IpSet(), // starting page
//     );
//   }
// }
//
// class IpSet extends StatefulWidget {
//   const IpSet({Key? key}) : super(key: key);
//
//   @override
//   State<IpSet> createState() => _IpSetState();
// }
//
// class _IpSetState extends State<IpSet> {
//   final TextEditingController ipController = TextEditingController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text("BusNav"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/ip.jpg'), // Replace with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(25),
//                       child: TextField(
//                         controller: ipController,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: "IP Address",
//                           hintText: "Enter a valid IP address",
//                           filled: true,
//                           fillColor: Colors.white54,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: ElevatedButton.icon(
//                       onPressed: () async {
//                         String ip = ipController.text.trim();
//                         if (_isValidIp(ip)) {
//                           final sh = await SharedPreferences.getInstance();
//                           sh.setString("url", "http://$ip:8000/myapp/");
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => login()),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text("Invalid IP Address"),
//                             ),
//                           );
//                         }
//                       },
//                       icon: const Icon(Icons.key),
//                       label: const Text('Set IP'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool _isValidIp(String ip) {
//     // Basic IP address format validation
//     final ipRegex = RegExp(
//       r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
//     );
//     return ipRegex.hasMatch(ip);
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BusNav",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Roboto",
      ),
      home: const IpSet(),
    );
  }
}

class IpSet extends StatefulWidget {
  const IpSet({Key? key}) : super(key: key);

  @override
  State<IpSet> createState() => _IpSetState();
}

class _IpSetState extends State<IpSet> {
  final TextEditingController ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background 🌈
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF90CAF9)], // Blue theme
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App icon / logo
                    Icon(Icons.directions_bus,
                        color: Colors.white, size: 90),
                    const SizedBox(height: 20),
                    const Text(
                      "BusGuardAI",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Card with shadow ✨
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: ipController,
                              style: const TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.public,
                                    color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "IP Address",
                                hintText: "Enter server IP (e.g., 192.168.1.100)",
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  String ip = ipController.text.trim();
                                  print(ip);
                                  print('===============');
                                  if (_isValidIp(ip)) {
                                    final sh =
                                    await SharedPreferences.getInstance();
                                    sh.setString(
                                        "url", "http://$ip:8000/myapp/");
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login()),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Invalid IP Address"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade700,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  "Set IP",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  bool _isValidIp(String ip) {
    final ipRegex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.'
      r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
    );
    return ipRegex.hasMatch(ip);
  }
}
