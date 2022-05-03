import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final VoidCallback setWorkoutPlan;
  final VoidCallback setTracker;
  Home(this.setWorkoutPlan, this.setTracker);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      color: Colors.black54,
    );
    //color: Colors.black54,
  }
}
