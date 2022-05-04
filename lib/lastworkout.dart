import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class LastWorkout extends StatelessWidget {
  final _database = FirebaseDatabase.instance.ref("last_workout");

  @override
  Widget build(BuildContext context) {
    return Container();
  }
    /*return FutureBuilder(
      future: _database.once(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final workout = Map<String, dynamic>.from((snapshot.data as DataSnapshot).value));

        } else if (snapshot.hasError) {
          print('You have an error! ${snapshot.error.toString()}');
          return Container(
            color: Colors.black54,
            child: Text("Something went wrong!"),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(top: 100),
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 28, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );


Container(
        margin: EdgeInsets.only(top: 100),
        child: Text(
          "You have no past workouts!\n\nUse the Set Tracker to add a workout or find a workout plan in Workout Plans!",
          style: TextStyle(fontSize: 28, color: Colors.white),
          textAlign: TextAlign.center,
        ),
    );*/

}
