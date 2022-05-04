import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class WeightDatabase {
  final _database = FirebaseDatabase.instance.ref("last_workout");

  void addWeights(List<String> names, List<String> weights, List<String> sets, VoidCallback setTracker) {
    for (int i = 0; i < names.length; i++) {
      if (names[i] == "") {
        names[i] = "Workout ${i + 1}";
      }
      if (int.tryParse(weights[i]) == null) {
        weights[i] = '0';
      }
    }
    try {
      _database.set({'names': names, 'sets': sets, 'weights': weights});
    } catch (e) {
      print('There was an error in data entry: $e');
    }
    setTracker();
  }
}