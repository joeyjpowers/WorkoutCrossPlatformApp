import 'package:flutter/material.dart';

class PickSets extends StatefulWidget {
  var _numWorkouts; //number of workouts selected
  var _numsets; //number of sets selected
  var _names; //names of workouts
  final Function(List<String>, List<String>) _setSetTracker; //return to set tracker

  PickSets(var numWorkouts, this._setSetTracker) {
    this._numWorkouts = numWorkouts;
    this._numsets = List<String>.filled(numWorkouts.round(), '3'); //default sets to 3
    this._names = List<String>.filled(numWorkouts.round(), ""); //default names to empty

  }

  @override
  State<PickSets> createState() => _PickSetsState();
}

class _PickSetsState extends State<PickSets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: List.generate(widget._numWorkouts.round() + 1,(index) { //add new member of list for each workout
          if (index < widget._numWorkouts) {
            //for each workout return picker
            return Column(
                children: [
                  Container(
                    child: Center(
                      //workout name
                      child: Text(
                        "Workout ${index + 1}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                  ),
                  SizedBox(height: 15,),

                  //set workout name
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text("Name: ", style: TextStyle(fontSize: 22, color: Colors.white)),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 3,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Workout Name (optional)',
                            ),
                            onChanged: (value) => (widget._names[index] = value),
                          ),

                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(left: 20),
                  ),
                  SizedBox(height: 10,),

                  //set num sets
                  Container(
                    child: Row(
                    children: [
                      //sets word
                      Flexible(
                        flex: 1,
                        child: Text("Sets: ", style: TextStyle(fontSize: 22, color: Colors.white)),
                      ),
                      SizedBox(width: 10),
                      //sets form field
                      Flexible(
                        flex: 3,
                        child: DropdownButtonFormField<String>(
                          value: widget._numsets[index],
                          icon: const Icon(
                              Icons.arrow_downward, color: Colors.white,
                              size: 25),
                          elevation: 16,
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                          //underline: Container(
                          //height: 3,
                          //color: Colors.white,
                          //),
                          dropdownColor: Colors.black12,

                          onChanged: (String? newValue) {
                            setState(() {
                              widget._numsets[index] = newValue!;
                            });
                          },
                          onSaved: (String? newValue) {
                            setState(() {
                              widget._numsets[index] = newValue!;
                            });
                          },
                          //sets options
                          items: <String>['2', '3', '4', '5', '6']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
                    padding: EdgeInsets.only(left: 30, right: 10),
                    //color: Colors.white,
                    //margin: EdgeInsets.only(left:150, right: 150)
                  ),
                  SizedBox(height: 15,),
                ]
            );
          } else {
            //submit button
            return Container(
              margin: EdgeInsets.only(bottom: 8, top: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  color: Colors.red[900],
                  onPressed: () => (widget._setSetTracker(widget._numsets, widget._names)),
                ),
              ),
          );
          }
          }),
      ),
      color: Colors.black54,
    );
  }
}
