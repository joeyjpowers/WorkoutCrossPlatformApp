import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final VoidCallback setWorkoutPlan;
  final VoidCallback setTracker;
  Home(this.setWorkoutPlan, this.setTracker);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
      margin: EdgeInsets.all(20),
      child: Center(
            child: ButtonTheme(
              minWidth: 300,
              height: 100,
              child: RaisedButton(
                child: Text(
                  "Workout Plans",
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
                color: Colors.red[900],
                onPressed: setWorkoutPlan,
              ),
            ),
          )),
          Container(
              margin: EdgeInsets.all(30),
              child: Center(
            child: ButtonTheme(
              minWidth: 200,
              height: 100,
              child: RaisedButton(
                child: Text(
                  "Set Tracker",
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
                color: Colors.red[900],
                onPressed: setTracker,
              ),
            ),
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      color: Colors.black54,
    );
    //color: Colors.black54,
  }
}
