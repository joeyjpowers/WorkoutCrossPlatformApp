import 'package:flutter/material.dart';

class PickSets extends StatefulWidget {
  var _numWorkouts;
  var _numsets;

  PickSets(var numWorkouts) {
    this._numWorkouts = numWorkouts;
    this._numsets = List<String>.filled(numWorkouts.round(), '3');
  }

  @override
  State<PickSets> createState() => _PickSetsState();
}

class _PickSetsState extends State<PickSets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: List.generate(widget._numWorkouts.round(),(index){
          var widgetno = index + 1;
          return Column(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "How many sets in exercise $widgetno?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
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
                      value: widget._numsets[index],
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
                  width: 100,
                  //color: Colors.white,
                  //margin: EdgeInsets.only(left:150, right: 150)
                ),
                SizedBox(height: 10,),
              ]
            );
          }),
      ),
      color: Colors.black54,
    );
  }
}
