import 'package:flutter/material.dart';
import 'package:koreanadminpanel/wigets/custom_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isExpanded = false;
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          // Row(
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         setState(() {
          //           isExpanded = !isExpanded;
          //         });
          //       },
          //       icon: Icon(Icons.menu),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.article,
                              size: 26.0,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Students",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(
                                  255,
                                  109,
                                  109,
                                  109,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "760 Students",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.article,
                              size: 26.0,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Batches",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(
                                  255,
                                  109,
                                  109,
                                  109,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "30 Batches",
                          style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    ),

    //Students
    Text('Authentication'),

    //Students
    Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomButton(
            text: 'Add Student',
            height: 40,
            width: 200,
            backgroundColor: Colors.green,
          ),
        ],
      ),
    ),

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
