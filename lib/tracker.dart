import 'package:flutter/material.dart';

class Tracker extends StatefulWidget {
  final Function(double) setPickSets;
  Tracker(this.setPickSets);

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
              "How many exercises today?",
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
          divisions: 5,
          min: 1,
          label: _numWorkouts.round().toString(),
          onChanged: (double value) {
            setState(() {
              _numWorkouts = value;
            });
          },
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Text("1", style: TextStyle(color: Colors.white, fontSize: 18),),
              Spacer(),
              Text("2", style: TextStyle(color: Colors.white, fontSize: 18),),
              Spacer(),
              Text("3", style: TextStyle(color: Colors.white, fontSize: 18),),
              Spacer(),
              Text("4", style: TextStyle(color: Colors.white, fontSize: 18),),
              Spacer(),
              Text("5", style: TextStyle(color: Colors.white, fontSize: 18),),
              Spacer(),
              Text("6", style: TextStyle(color: Colors.white, fontSize: 18),),
            ],
          ),
        ),
        Spacer(),
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 8, top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                color: Colors.red[900],
                onPressed: () {
                  widget.setPickSets(_numWorkouts);
                },
              ),
            ),
          ),
        ),
      ]),
      color: Colors.black54,
    );
  }
}
