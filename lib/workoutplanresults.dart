import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

class WorkoutPlanResults extends StatefulWidget {
  const WorkoutPlanResults({Key? key}) : super(key: key);

  //String days;
  //WorkoutPlanResults(this.days);

  @override
  State<WorkoutPlanResults> createState() => _WorkoutPlanResultsState();
}

class _WorkoutPlanResultsState extends State<WorkoutPlanResults> {

  void referenceDatabase() {
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello World ${Random().nextInt(100)}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Press me"),
        onPressed: referenceDatabase,
      ),
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: FutureBuilder(
          future: WorkoutHelper.instance.getAllWorkouts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Workouts>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.isEmpty
                  ? Center(child: Text('No workouts were found.'))
                  : ListView(
                      children: snapshot.data!.map((workouts) {
                        return Container(
                            color: Colors.red[900],
                            margin: EdgeInsets.all(20),
                            child: Center(
                              child: InkWell(
                                child: Column(children: [Text(workouts.name, style: TextStyle(fontSize: 24, fontFamily: 'Roboto', color: Colors.white)), Text(workouts.website)]),
                                onTap: () async {
                                  var url = workouts.link;
                                  if (!await canLaunch(url))
                                    launch(url);
                                  else
                                    print("Cannot launch " + url);
                                },
                          ),
                        ));
                      }).toList(),
                    );
            } else {
              return Center(child: Text("Loading..."));
            }
          }),
    );
  }*/
}
