import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class LastWorkout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('last_workout')
            .orderBy('date', descending: true)
            .limit(3)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.size > 0) {
              return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                      children:
                      [
                        Text("Last Workouts", style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 28)),
                        Column(
                          children: snapshot.data!.docs.map((workout) {
                            var names = workout['names'] ?? List.empty();
                            var sets = workout['sets'] ?? List.empty();
                            var weights = workout['weights'] ?? List.empty();
                            var rawDate = workout['date'] ?? DateTime.now();
                            var date = DateFormat('MM-dd-yyyy').format(workout['date'].toDate());
                            return Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                  children: [
                                    Text("Workout on ${date}", style: TextStyle(color: Colors.white70, fontSize: 24, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Column(
                                  children: List.generate(names.length, (index) {
                                    return Text("${names[index]}: ${sets[index]} sets at ${weights[index]} lbs", style: TextStyle(color: Colors.white70, fontSize: 18));
                                  })
                                )
                                ]
                              )
                            );
                          }).toList(),
                        )
                      ]
                  ));
            } else {
              return Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  "You have no past workouts!\n\nUse the Set Tracker to add a workout or find a workout plan in Workout Plans!",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            }

          } else if (snapshot.hasError) {
            print('${snapshot.error}');
            return Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "You have no past workouts!\n\nUse the Set Tracker to add a workout or find a workout plan in Workout Plans!",
                style: TextStyle(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Container( margin: EdgeInsets.only(top: 100), child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CircularProgressIndicator()]));
          }
        });
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
