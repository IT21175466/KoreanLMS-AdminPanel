import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koreanadminpanel/wigets/custom_button.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 20,
          ),
          // Row(
          //   children: [
          //     Text('data', style:  TextStyle(
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.w500,
          //         fontSize: 20,
          //       ),),
          //   ],
          // ),

          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Students").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Text(
                      'Student ID',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'First Name',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Last Name',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Phone Number',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'NIC',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Date of Birth',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Batch',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Class',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Payment',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Registered Date',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ],
                  rows: snapshot.data!.docs
                      .map<DataRow>((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return DataRow(
                      cells: [
                        DataCell(Text(
                          data['UserID'].toString(),
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )),
                        DataCell(Text(data['FirstName'].toString())),
                        DataCell(Text(data['LastName'].toString())),
                        DataCell(Text(data['PhoneNumber'].toString())),
                        DataCell(Text(data['NIC'].toString())),
                        DataCell(Text(data['DateOfBirth'].toString())),
                        DataCell(Text(data['Email'].toString())),
                        DataCell(Text(data['Batch'].toString())),
                        DataCell(Text(data['Student_Class'].toString())),
                        DataCell(Text(data['Payment'].toString())),
                        DataCell(Text(data['Registed_Date'].toString())),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),

          //Text('${snapshot.data!.docs.length}');
        ],
      ),
    );
  }
}
