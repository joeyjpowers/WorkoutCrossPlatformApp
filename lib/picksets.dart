import 'package:flutter/material.dart';

class PickSets extends StatefulWidget {
  var _numWorkouts;
  var _numsets;
  var _names;
  final Function(List<String>, List<String>) _setSetTracker;

  PickSets(var numWorkouts, this._setSetTracker) {
    this._numWorkouts = numWorkouts;
    this._numsets = List<String>.filled(numWorkouts.round(), '3');
    this._names = List<String>.filled(numWorkouts.round(), "");

  }

  @override
  State<PickSets> createState() => _PickSetsState();
}

class _PickSetsState extends State<PickSets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: List.generate(widget._numWorkouts.round() + 1,(index) {
          if (index < widget._numWorkouts) {
            var widgetno = index + 1;
            return Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "Workout $widgetno",
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
                  Container(
                    child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text("Sets: ", style: TextStyle(fontSize: 22, color: Colors.white)),
                      ),
                      SizedBox(width: 10),
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
