// import 'package:bustracking/staffviewaccident.dart';
// import 'package:bustracking/staffviewbus.dart';
// import 'package:bustracking/staffviewstudent.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class staff_home extends StatefulWidget {
//   @override
//   _staff_homeState createState() => _staff_homeState();
// }
//
// class _staff_homeState extends State<staff_home> {
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
//         title: Text("Kerala Kalarupam App"),
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
//               title: Text("view Child"),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => staffChildPage()));
//                 // Navigate to Manage Child Page
//               },
//             ),
//
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text("View Status"),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => staffViewAccident()));
//                 // Navigate to Status Page
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.directions_bus),
//               title: Text("Assigned Bus"),
//               onTap: () {
//     Navigator.push(context,
//     MaterialPageRoute(builder: (context) => ViewBusUserStaff()));
//                 // Navigate to Bus Tracking Page
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.warning),
//               title: Text("View Accident"),
//               onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => staffViewAccident()));
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
import 'package:bustracking/login.dart';
import 'package:bustracking/staffviewaccident.dart';
import 'package:bustracking/staffviewbus.dart';
import 'package:bustracking/staffviewstudent.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class staff_home extends StatefulWidget {
  @override
  _staff_homeState createState() => _staff_homeState();
}

class _staff_homeState extends State<staff_home> {
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
        title: const Text("Bus tracking App",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 3,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text("Staff Member",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              accountEmail: Text("staff@kalarupam.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.green, size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.child_care),
              title: const Text("View Child"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => staffChildPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_bus),
              title: const Text("Assigned Bus"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ViewBusUserStaff()));
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.info),
            //   title: const Text("View Status"),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => StaffViewAccident()));
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text("View Accident"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => staffViewAccident()));
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            // Image Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: imageList
                  .map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(item,
                      fit: BoxFit.cover, width: 1000),
                ),
              ))
                  .toList(),
            ),

            const SizedBox(height: 20),

            // Quick Action Buttons (Dashboard Style)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  buildDashboardCard(
                    icon: Icons.child_care,
                    label: "View Child",
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => staffChildPage()));
                    },
                  ),
                  buildDashboardCard(
                    icon: Icons.directions_bus,
                    label: "Assigned Bus",
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewBusUserStaff()));
                    },
                  ),
                  // buildDashboardCard(
                  //   icon: Icons.info,
                  //   label: "View Status",
                  //   color: Colors.green,
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => StaffViewAccident()));
                  //   },
                  // ),
                  buildDashboardCard(
                    icon: Icons.warning,
                    label: "View Accident",
                    color: Colors.red,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => staffViewAccident()));
                    },
                  ),    buildDashboardCard(
                    icon: Icons.logout,
                    label: "logout",
                    color: Colors.red,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => login()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   selectedItemColor: Colors.green,
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

  Widget buildDashboardCard(
      {required IconData icon,
        required String label,
        required Color color,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color.withOpacity(0.85),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
