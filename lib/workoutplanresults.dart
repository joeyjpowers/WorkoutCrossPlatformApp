import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutPlanResults extends StatefulWidget {
  var _days;
  var _type;
  WorkoutPlanResults(this._days, type) {
    if (type == "Body Weight") {
      _type = "bodyweight";
    } else if (type == "Kettlebell") {
      _type = "kettlebell";
    } else if (type == "Dumbell") {
      _type = "dumbell";
    } else if (type == "Barbell") {
      _type = "barbell";
    } else {
      _type = type;
    }
  }

  //String days;
  //WorkoutPlanResults(this.days);

  @override
  State<WorkoutPlanResults> createState() => _WorkoutPlanResultsState();
}

class _WorkoutPlanResultsState extends State<WorkoutPlanResults> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black54,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Results",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('workout_plans')
                  .where(widget._type, isEqualTo: true)
                  .where('days', isEqualTo: widget._days)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.size > 0) {
                    return Center(
                        child: ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((workoutPlan) {
                        return Container(
                            color: Colors.red[900],
                            margin: EdgeInsets.all(20),
                            child: Center(
                              child: InkWell(
                                child: Column(children: [
                                  Text(workoutPlan['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: 'Roboto',
                                          color: Colors.white)),
                                  SizedBox(height: 5),
                                  Text("Wesbite: ${workoutPlan['website']}",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 5),
                                  Text("Days per week: ${workoutPlan['days']}",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(height: 5),
                                  Text("Tags",
                                      style: TextStyle(
                                          color: Colors.white,
                                          decoration:
                                              TextDecoration.underline)),
                                  (workoutPlan['barbell'])
                                      ? Text("Barbell",
                                          style: TextStyle(color: Colors.white))
                                      : SizedBox.shrink(),
                                  (workoutPlan['bodyweight'])
                                      ? Text("Body Weight",
                                          style: TextStyle(color: Colors.white))
                                      : SizedBox.shrink(),
                                  (workoutPlan['dumbell'])
                                      ? Text("Dumbell",
                                          style: TextStyle(color: Colors.white))
                                      : SizedBox.shrink(),
                                  (workoutPlan['kettlebell'])
                                      ? Text("Kettlebell",
                                          style: TextStyle(color: Colors.white))
                                      : SizedBox.shrink(),
                                ]),
                                onTap: () async {
                                  var url = workoutPlan['link'];
                                  if (!await launch(url))
                                    throw 'Could not launch $url';
                                },
                              ),
                            ));
                      }).toList(),
                    ));
                  } else {
                    return Container( margin: EdgeInsets.only(top: 10), child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No Results were found",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28))
                        ]));
                  }
                } else if (snapshot.hasError) {
                  print('${snapshot.error}');
                  return Text("${snapshot.error}");
                } else {
                  return Container( margin: EdgeInsets.only(top: 100), child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CircularProgressIndicator()]));
                }
              }),

        ]));
  }
}