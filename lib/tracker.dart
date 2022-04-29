import 'package:flutter/material.dart';

class Tracker extends StatefulWidget {
  final VoidCallback setHome;
  Tracker(this.setHome);

  @override
  State<Tracker> createState() => _TrackerState();
}
class _TrackerState extends State<Tracker> {
  double _numWorkouts = 3;

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Column(children: [
        Container(
          child: Center(
            child: Text(
              "How many workouts today?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
          margin: EdgeInsets.only(left: 20, top: 100, right: 20),
        ),
        SizedBox(height: 20,),
        Slider(
          value: _numWorkouts,
          max: 6,
          divisions: 6,
          label: _numWorkouts.round().toString(),
          onChanged: (double value) {
            setState(() {
              _numWorkouts = value;
            });
          },
        ),
        Spacer(),
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 8, top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text(
                  "Tracker Home",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                color: Colors.red[900],
                onPressed: widget.setHome,
              ),
            ),
          ),
        ),
      ]),
      color: Colors.black54,
    );
  }
}
