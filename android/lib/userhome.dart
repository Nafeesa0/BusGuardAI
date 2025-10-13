// import 'package:bustracking/view%20accident.dart';
// import 'package:bustracking/view%20bus.dart';
// import 'package:bustracking/viewbussts.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'manage child.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//
//   final List<String> imageList = [
//     'assets/img1.jpeg',
//     'assets/img2.jpeg',
//     'assets/img3.jpeg',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Bus Tracking App"),
//         centerTitle: true,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.green),
//               child: Text(
//                 "Menu",
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.child_care),
//               title: Text("Manage Child"),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ChildPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.notifications),
//               title: Text("View Notification"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => viewbususersts()),
//                 );// Navigate to Notification Page
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text("Track Bus"),
//               onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => viewbususersts()),
//               );
//               },
//             ),
//             // ListTile(
//             //   leading: Icon(Icons.directions_bus),
//             //   title: Text("Track Bus"),
//             //   onTap: () {
//             //
//             //     // Navigate to Bus Tracking Page
//             //   },
//             // ),
//             ListTile(
//               leading: Icon(Icons.warning),
//               title: Text("View Accident"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => viewaccident()),
//                 );
//                 // Navigate to Accident Info Page
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//           CarouselSlider(
//             options: CarouselOptions(
//               height: 200.0,
//               autoPlay: true,
//               enlargeCenterPage: true,
//             ),
//             items: imageList.map((item) => Container(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(item, fit: BoxFit.cover, width: 1000),
//               ),
//             )).toList(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:bustracking/view%20accident.dart';
import 'package:bustracking/view%20bus.dart';
import 'package:bustracking/view%20notification.dart';
import 'package:bustracking/viewbussts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'manage child.dart';
import 'login.dart'; // For logout navigation

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> imageList = [
    'assets/img1.jpeg',
    'assets/img2.jpeg',
    'assets/img3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1976D2), Color(0xFF42A5F5)], // Blue gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text("Bus Tracking App",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 5,
      ),

      // Drawer with profile + menu + logout
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                ),
              ),
              accountName: const Text("Parent User"),
              accountEmail: const Text("parent@email.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.child_care, color: Colors.blue),
                    title: const Text("Manage Child"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChildPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications,
                        color: Colors.orange),
                    title: const Text("View Notification"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => viewnotification()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_bus,
                        color: Colors.green),
                    title: const Text("Track Bus"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => viewbususersts()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: const Text("View Accident"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewAccident()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black87),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => login()),
                );
              },
            ),
          ],
        ),
      ),

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
              items: imageList.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(item,
                      fit: BoxFit.cover, width: double.infinity),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Quick action cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildActionCard(Icons.child_care, "Manage Child",
                      Colors.blue, () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ChildPage()));
                      }),
                  _buildActionCard(Icons.directions_bus, "Track Bus",
                      Colors.green, () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => viewbususersts()));
                      }),
                  _buildActionCard(Icons.notifications, "Notifications",
                      Colors.orange, () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => viewnotification()));
                      }),
                  _buildActionCard(Icons.warning, "View Accident", Colors.red,
                          () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ViewAccident()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Nav
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   selectedItemColor: Colors.blueAccent,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: "Search",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildActionCard(
      IconData icon, String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
