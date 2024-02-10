import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koreanadminpanel/wigets/custom_button.dart';
import 'package:koreanadminpanel/wigets/text_filed.dart';

class BatchesTab extends StatefulWidget {
  const BatchesTab({super.key});

  @override
  State<BatchesTab> createState() => _BatchesTabState();
}

class _BatchesTabState extends State<BatchesTab> {
  final TextEditingController sampleController = TextEditingController();

  void addBatchAlertDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Add a new Batch",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "Add a new Student",
              //   style: TextStyle(
              //     fontFamily: 'Poppins',
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              CustomTextField(
                  controller: sampleController, labelText: 'Batch Name'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text(
              "Add",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteComformationDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Alert",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          "Do you want delete this batch?",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text(
              "No",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              addBatchAlertDialog();
            },
            child: CustomButton(
              text: 'Add Batch',
              height: 40,
              width: 200,
              backgroundColor: Colors.green,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("All_Batches")
                .snapshots(),
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
                      'Batch Name',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Edit',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                    DataColumn(
                        label: Text(
                      'Delete',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                  ],
                  rows: snapshot.data!.docs
                      .map<DataRow>((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return DataRow(
                      cells: [
                        DataCell(Text(data['Batch_Name'].toString())),
                        DataCell(Icon(Icons.edit)),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              deleteComformationDialog();
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
