import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final VoidCallback setWorkoutPlan;
  Home(this.setWorkoutPlan);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("Workout Plans",
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
          color: Colors.red[900],
          onPressed: setWorkoutPlan,
        ),
      ),
      color: Colors.black54,
    );
  }
}
