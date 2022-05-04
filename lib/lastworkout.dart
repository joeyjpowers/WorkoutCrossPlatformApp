import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

//Get last workouts or print message telling to enter workouts
class LastWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //get three most recently entered workouts
        stream: FirebaseFirestore.instance
            .collection('last_workout')
            .orderBy('date', descending: true)
            .limit(3)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            //check if there are workouts
            if (snapshot.data != null && snapshot.data!.size > 0) {
              //Return colum of last workouts
              return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(children: [
                    Text("Last Workouts",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 28)),
                    Column(
                      children: snapshot.data!.docs.map((workout) {
                        var names = workout['names'] ??
                            List.empty(); //set names if exists
                        var sets = workout['sets'] ??
                            List.empty(); //set sets if exists
                        var weights = workout['weights'] ??
                            List.empty(); //set weights if exists
                        var date = DateFormat('MM-dd-yyyy').format(
                            workout['date'].toDate() ??
                                DateTime.now()); //set date if exists
                        return Container(
                            margin: EdgeInsets.all(20),
                            child: Column(children: [
                              //return workout number
                              Text("Workout on ${date}",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 24,
                                      fontWeight: FontWeight
                                          .bold)),
                              SizedBox(height: 5),
                              Column(
                                  children:
                                  List.generate(names.length, (
                                      index) { //get list of workouts
                                    //return info about workout
                                    return Text(
                                        "${names[index]}: ${sets[index]} sets at ${weights[index]} lbs",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18));
                                  }))
                            ]));
                      }).toList(),
                    )
                  ]));
            } else {
              //if no data is returned, print message
              return Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  "You have no past workouts!\n\nUse the Set Tracker to add a workout or find a workout plan in Workout Plans!",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              );
            }
            //error checking
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
            //loading
          } else {
            return Container(
                margin: EdgeInsets.only(top: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CircularProgressIndicator()]));
          }
        });
  }
}