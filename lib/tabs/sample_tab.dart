import 'package:flutter/material.dart';
import 'package:koreanadminpanel/providers/batch_provider.dart';
import 'package:koreanadminpanel/wigets/custom_button.dart';
import 'package:provider/provider.dart';

class SampleTab extends StatefulWidget {
  const SampleTab({super.key});

  @override
  State<SampleTab> createState() => _SampleTabState();
}

class _SampleTabState extends State<SampleTab> {
  List<DropdownMenuItem> dropdownMenuItems = [];
  List<DropdownMenuItem> dropddownClassItems = [];

  String selectedItem = '0';
  String selectedClassItem = '0';
  String? selectedBatch;
  String? selectedClass = '';

  bool isBatchSelected = false;
  bool isClassSelected = false;

  final TextEditingController batchController = TextEditingController();

  @override
  void initState() {
    final batchProvider = Provider.of<BatchProvider>(context, listen: false);
    batchProvider.getAllBatches();

    dropdownMenuItems.add(
      DropdownMenuItem(
        child: Text('Select Batch'),
        value: '0',
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Consumer(
          builder: (BuildContext context, BatchProvider batchProvider,
                  Widget? child) =>
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Classes",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              Divider(),
              Container(
                height: 30,
                child: Row(
                  children: [
                    Text(
                      "Batch List - ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: batchProvider.batches.length,
                        itemBuilder: (context, index) {
                          if (dropdownMenuItems.length <=
                              batchProvider.batches.length) {
                            dropdownMenuItems.add(
                              DropdownMenuItem(
                                child: Text(batchProvider.batches[index]),
                                value: batchProvider.batches[index],
                              ),
                            );
                          }

                          return Column(
                            children: [
                              Spacer(),
                              Text('${batchProvider.batches[index]}  '),
                              Spacer(),
                            ],
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: batchProvider.classes.length,
                        itemBuilder: (context, index) {
                          dropddownClassItems.add(
                            DropdownMenuItem(
                              child: Text(batchProvider.classes[index]),
                              value: batchProvider.classes[index],
                            ),
                          );

                          return SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: Center(
                          child: DropdownButton(
                              isExpanded: true,
                              items: dropdownMenuItems,
                              value: selectedItem,
                              onChanged: (value) {
                                print(value);

                                setState(() {
                                  selectedBatch = value;
                                });

                                batchProvider.classes.clear();

                                // batchProvider.classes.clear();

                                setState(() {
                                  dropddownClassItems.clear();
                                });

                                dropddownClassItems.add(
                                  DropdownMenuItem(
                                    child: Text('Select Class'),
                                    value: '0',
                                  ),
                                );

                                batchProvider.getAllClasses(value);
                                if (value == 0) {
                                  setState(() {
                                    isBatchSelected = false;
                                  });
                                } else {
                                  setState(() {
                                    isBatchSelected = true;
                                  });
                                }
                              }),
                        ),
                      ),
                      isBatchSelected
                          ? Container(
                              height: screenHeight / 2,
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    'Selected Batch',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Classes',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    'Delete',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )),
                                ],
                                rows: batchProvider.classes.map((className) {
                                  return DataRow(cells: [
                                    DataCell(Text(selectedBatch!)),
                                    DataCell(Text(className)),
                                    DataCell(
                                      GestureDetector(
                                        onTap: () {
                                          //deleteComformationDialog();
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            )
                          : SizedBox(),
                      isBatchSelected
                          ? CustomButton(
                              text: 'Add Class to ${selectedBatch} Batch',
                              height: 50,
                              width: 250,
                              backgroundColor: Colors.green,
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Divider(),
                  SizedBox(
                    width: 50,
                  ),
                  isBatchSelected
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 300,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                              child: Center(
                                child: DropdownButton(
                                    isExpanded: true,
                                    items: dropddownClassItems,
                                    value: selectedClassItem,
                                    onChanged: (value) {
                                      print(value);

                                      setState(() {
                                        selectedClass = value;
                                      });

                                      if (value == 0) {
                                        setState(() {
                                          isClassSelected = false;
                                        });
                                      } else {
                                        setState(() {
                                          isClassSelected = true;
                                        });
                                      }
                                      // setState(() {
                                      //   batchProvider.classes.length =
                                      //       dropddownClassItems.length;
                                      // });

                                      //batchProvider.classes.clear();
                                      //batchProvider.getAllClasses(value);
                                      // if (value == 0) {
                                      //   setState(() {
                                      //     //isBatchSelected = false;
                                      //   });
                                      // } else {
                                      //   setState(() {
                                      //     //isBatchSelected = true;
                                      //   });
                                      // }
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            isClassSelected
                                ? Text(
                                    "Selected Class",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              selectedClass!,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            isClassSelected
                                ? CustomButton(
                                    text:
                                        'Manage Papers in ${selectedClass} class',
                                    height: 50,
                                    width: 300,
                                    backgroundColor: Colors.green,
                                  )
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                            isClassSelected
                                ? CustomButton(
                                    text:
                                        'Manage Videos in ${selectedClass} class',
                                    height: 50,
                                    width: 300,
                                    backgroundColor: Colors.green,
                                  )
                                : SizedBox(),
                          ],
                        )
                      : SizedBox(),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
