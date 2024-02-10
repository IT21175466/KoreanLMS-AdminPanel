import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
