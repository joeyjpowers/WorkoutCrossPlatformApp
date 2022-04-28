import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import './workouts.dart';
class WorkoutPlans extends StatefulWidget {

  final VoidCallback setHome;
  final VoidCallback setResults;
  String daysSelected = '2';//number of days for workout
  String weightType = 'Body Weight';

  String get days {
    return daysSelected;
  }

  WorkoutPlans(this.setHome, this.setResults);

  @override
  State<WorkoutPlans> createState() => _WorkoutPlansState();
}

class _WorkoutPlansState extends State<WorkoutPlans> {

  @override
  Widget build(BuildContext context) {


    return Ink(
      color: Colors.black54,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Text(
                "How many days per week?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
          ),
          SizedBox(height: 10,),
          Container(
            child: Center(
              child: DropdownButtonFormField<String>(
                value: widget.daysSelected,
                icon: const Icon(Icons.arrow_downward, color: Colors.white, size: 25),
                elevation: 16,
                style: const TextStyle(fontSize: 24, color: Colors.white),
                //underline: Container(
                  //height: 3,
                  //color: Colors.white,
                //),
                dropdownColor: Colors.black12,

                onChanged: (String? newValue) {
                  setState(() {
                    widget.daysSelected = newValue!;
                  });
                },
                onSaved: (String? newValue) {
                  setState(() {
                    widget.daysSelected = newValue!;
                  });
                },
                items: <String>['2', '3', '4', '5', '6']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            width: 100,
            //color: Colors.white,
            //margin: EdgeInsets.only(left:150, right: 150)
          ),
          SizedBox(height: 20,),
          Container(
            child: Center(
              child: Text(
                "What weight type do you have access to?",
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            margin: EdgeInsets.only(left:20, right: 20)
          ),
          SizedBox(height: 20,),
          Container(
            child: Center(
              child: DropdownButtonFormField<String>(
                value: widget.weightType,
                icon: const Icon(Icons.arrow_downward, color: Colors.white, size: 25),
                elevation: 16,
                style: const TextStyle(fontSize: 24, color: Colors.white),
                //underline: Container(
                //height: 3,
                //color: Colors.white,
                //),
                dropdownColor: Colors.black12,

                onChanged: (String? newValue) {
                  setState(() {
                    widget.weightType = newValue!;
                  });
                },
                onSaved: (String? newValue) {
                  setState(() {
                    widget.weightType = newValue!;
                  });
                },
                items: <String>['Body Weight', 'Barbell', 'Dumbell', 'Kettlebell']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            width: 200,
            //color: Colors.white,
            //margin: EdgeInsets.only(left:150, right: 150)
          ),
          Spacer(), //push to bottom
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
                onPressed: widget.setResults,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
