import 'package:flutter/material.dart';
import './lastworkout.dart';

//Home page

class Home extends StatelessWidget {

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
          Center(
            child: LastWorkout(), //widget to get last workouts
          ),
        ],
      ),
      color: Colors.black54,
    );
    //color: Colors.black54,
  }
}
