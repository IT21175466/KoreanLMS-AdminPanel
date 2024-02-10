import 'package:flutter/material.dart';
import 'package:koreanadminpanel/tabs/home_tab.dart';
import 'package:koreanadminpanel/tabs/students_tab.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isExpanded = false;
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeTab(),

    //Students
    Text('Authentication'),

    //Students
    StudentsTab(),

    //Students
    Text('Banners'),

    //Students
    Text('Batches'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Row(
          children: [
            NavigationRail(
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                extended: isExpanded,
                backgroundColor: Colors.green,
                unselectedIconTheme: IconThemeData(
                  color: Colors.white,
                  opacity: 1,
                ),
                selectedLabelTextStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                unselectedLabelTextStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("Dashboad"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.call),
                    label: Text("Authentication"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.people),
                    label: Text("Students"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.image),
                    label: Text("Banners"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.batch_prediction),
                    label: Text("Batches"),
                  ),
                ],
                selectedIndex: _selectedIndex),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
