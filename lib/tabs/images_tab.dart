import 'package:flutter/material.dart';

class ImagesTab extends StatefulWidget {
  const ImagesTab({super.key});

  @override
  State<ImagesTab> createState() => _ImagesTabState();
}

class _ImagesTabState extends State<ImagesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Banner Images',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 240, 240),
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(
                    //   image: NetworkImage(image),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 50,
                        ),
                        Text(
                          'Add Banner Image 1',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 240, 240),
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(
                    //   image: NetworkImage(image),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 50,
                        ),
                        Text(
                          'Add Banner Image 2',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 240, 240),
                    borderRadius: BorderRadius.circular(10),
                    // image: DecorationImage(
                    //   image: NetworkImage(image),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 50,
                        ),
                        Text(
                          'Add Banner Image 3',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Add Background Image',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 240, 240),
                borderRadius: BorderRadius.circular(10),
                // image: DecorationImage(
                //   image: NetworkImage(image),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo,
                      size: 50,
                    ),
                    Text(
                      'Add Background Image',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
