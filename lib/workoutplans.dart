import 'package:flutter/material.dart';
import './workouts.dart';

class WorkoutPlans extends StatelessWidget {
  final VoidCallback setHome;
  final VoidCallback setResults;

  WorkoutPlans(this.setHome, this.setResults);

  @override
  Widget build(BuildContext context) {

    return Ink(
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Text(
                "How many days?",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
            margin: EdgeInsets.all(20),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 8, top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text(
                  "Results page",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                color: Colors.red[900],
                onPressed: setResults,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
