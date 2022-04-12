import 'package:flutter/material.dart';

class WorkoutPlans extends StatelessWidget {
  final VoidCallback setHome;

  WorkoutPlans(this.setHome);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("Workout Home",
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
          color: Colors.red[900],
          onPressed: setHome,
        ),
      ),
      color: Colors.black54,
    );
  }
}
