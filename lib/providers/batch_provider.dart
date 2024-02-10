import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BatchProvider extends ChangeNotifier {
  List<String> batches = [];
  List<String> classes = [];

  bool isBatchSelected = false;

  getAllBatches() async {
    CollectionReference batchesCollection =
        FirebaseFirestore.instance.collection("Batches");

    // Fetch all documents in the collection
    QuerySnapshot querySnapshot = await batchesCollection.get();

    batches.clear();

    // Extract document IDs
    querySnapshot.docs.forEach((doc) {
      batches.add(doc.id);
    });
    print(batches);
    notifyListeners();
  }

  getAllClasses(String batch) async {
    CollectionReference classesCollection = FirebaseFirestore.instance
        .collection("Batches")
        .doc(batch)
        .collection("Classes");

    // Fetch all documents in the collection
    QuerySnapshot querySnapshot = await classesCollection.get();

    classes.clear();

    // Extract document IDs
    querySnapshot.docs.forEach((doc) {
      classes.add(doc.id);
    });
    print(classes);
    notifyListeners();
  }
}
