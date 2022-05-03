import 'package:flutter/material.dart';

class LastWorkout extends StatelessWidget {
  const LastWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Text(
          "You have no past workouts!\n\nUse the Set Tracker to add workouts or find a workout plan in Workout Plans!",
          style: TextStyle(fontSize: 28, color: Colors.white),
          textAlign: TextAlign.center,
        ),
    );
  }
}
