import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightDatabase {

  //add to last workout
  void addWeights(List<String> names, List<String> weights, List<String> sets, VoidCallback setTracker) {
    final _db = FirebaseFirestore.instance.collection('last_workout'); //get collection for last workout

    //if no name, change workout name to workout number
    //set weights to 0.0 if a non-number or negative number is entered
    for (int i = 0; i < names.length; i++) {
      if (names[i] == "") {
        names[i] = "Workout ${i + 1}";
      }
      if (double.tryParse(weights[i]) == null || double.parse(weights[i]) < 0.0) {
        weights[i] = '0.0';
      }
    }
    //update database
    _db
        .doc(DateTime.now().toString())
        .set({"date": DateTime.now(), "names": names, "sets": sets, "weights": weights})
        .onError((e, _) => print("Error writing document: $e"));

    setTracker();
  }
}