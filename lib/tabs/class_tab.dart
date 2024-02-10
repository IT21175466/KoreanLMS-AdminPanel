import 'package:flutter/material.dart';
import 'package:koreanadminpanel/providers/batch_provider.dart';
import 'package:provider/provider.dart';

class ClassTab extends StatefulWidget {
  const ClassTab({super.key});

  @override
  State<ClassTab> createState() => _ClassTabState();
}

class _ClassTabState extends State<ClassTab> {
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

  List<DropdownMenuItem> dropdownMenuItems = [];

  String selectedItem = '0';
  String? selectedBatch;

  bool isBatchSelected = false;

  final TextEditingController batchController = TextEditingController();

  void addClassAlertDialog() {
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
          "Do you want delete this class?",
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
      child: Consumer(
        builder: (BuildContext context, BatchProvider batchProvider,
                Widget? child) =>
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     //addClassAlertDialog();
            //     batchProvider.getAllBatches();
            //   },
            //   child: CustomButton(
            //     text: 'Add Class',
            //     height: 40,
            //     width: 200,
            //     backgroundColor: Colors.green,
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Batch List",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            Divider(),
            Container(
              height: 30,
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
            Divider(),
            SizedBox(
              height: 15,
            ),
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
                    height: 200,
                    //width: 200,
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text(
                          'Selected Batch',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                        DataColumn(
                            label: Text(
                          'Classes',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ],
                      rows: batchProvider.classes.map((className) {
                        return DataRow(cells: [
                          DataCell(Text(selectedBatch!)),
                          DataCell(Text(className)),
                        ]);
                      }).toList(),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
