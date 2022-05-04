import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightDatabase {
  final _database = FirebaseDatabase.instance.ref("last_workout");

  void addWeights(List<String> names, List<String> weights, List<String> sets, VoidCallback setTracker) {
    final _db = FirebaseFirestore.instance.collection('last_workout');

    for (int i = 0; i < names.length; i++) {
      if (names[i] == "") {
        names[i] = "Workout ${i + 1}";
      }
      if (int.tryParse(weights[i]) == null) {
        weights[i] = '0';
      }
    }
    _db
        .doc(DateTime.now().toString())
        .set({"date": DateTime.now(), "names": names, "sets": sets, "weights": weights})
        .onError((e, _) => print("Error writing document: $e"));
    try {
      _database.set({'names': names, 'sets': sets, 'weights': weights});
    } catch (e) {
      print('There was an error in data entry: $e');
    }
    setTracker();
  }
}