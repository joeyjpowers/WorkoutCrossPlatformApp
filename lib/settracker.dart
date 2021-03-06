import 'package:flutter/material.dart';
import 'package:workout_app/weightdatabase.dart';

class SetTracker extends StatefulWidget {
  var _sets;
  var _names;
  var _weights;
  var _beenPressed;
  final VoidCallback _setTracker;

  SetTracker(this._sets, var names, this._setTracker) {
    this._names = names;
    this._weights = new List.filled(names.length, '0');
    this._beenPressed = new List.empty(growable: true);
  }

  @override
  State<SetTracker> createState() => _SetTrackerState();
}

class _SetTrackerState extends State<SetTracker> {

  @override
  Widget build(BuildContext context) {
    //ensure sets is properly initialized
    if (widget._sets == null) {
      return Container(
        child: Center(
          child: RaisedButton(
            child: Text("No sets were specified"),
            onPressed: widget._setTracker,
          ),
        ),
        color: Colors.black54,
      );
    }

    //ensure names is properly initialized
    if (widget._names == null) {
      widget._names = List<String>.filled(widget._sets.length, "");
    }

    var _pressedMap = new Map(); //map for each button to see whether it has been pressed
    var _pressedNum = 0; //var to set each index of pressedMap

    for (var i = 0; i < widget._sets.length; i++) {
      for (var j = 0; j < int.parse(widget._sets[i]); j++) {
        widget._beenPressed.add(false);
        final coordinates = <String, int>{"$i, $j": _pressedNum++}; //set map entry to coordinates
        _pressedMap.addEntries(coordinates.entries); //add entry to map
      }
    }

    return Container(
      child: ListView(
        children: List.generate(widget._sets.length + 1, (index) {
          //add end workout button at end
          if (index == widget._sets.length) {
            return Container(
              margin: EdgeInsets.only(bottom: 8, top: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  child: Text(
                    "End Workout",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  color: Colors.red[900],
                  onPressed: () {
                    WeightDatabase().addWeights(widget._names, widget._weights, widget._sets, widget._setTracker);
                  },
                ),
              ),
            );
          }
          //display set tracker for each workout
          return Container(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
                children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                //see if name has been specified
                child: (widget._names[index] == "") ?
                Text(
                  "Workout ${index + 1}",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )
              : Text(
                  widget._names[index],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
          ),
                SizedBox(width: 20),
                //input weight
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: (value) => (widget._weights[index] = value),
                  ),

                ),
              ]),
              SizedBox(height: 10),
              //set tracker buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(int.parse(widget._sets[index]), (index2) {
                  var _setNum = index2 + 1;
                  return Flexible(
                    flex: 1,
                    child: RaisedButton(
                      child: new Text('$_setNum'),
                      textColor: Colors.white,
                      color: widget._beenPressed[_pressedMap["$index, $index2"]]
                          ? Colors.green[900]
                          : Colors.red[900],
                      // 3
                      onPressed: () => {
                        setState(() {
                          widget._beenPressed[_pressedMap["$index, $index2"]] = !widget._beenPressed[_pressedMap["$index, $index2"]];
                        })
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 10,),

            ]),
          );
        }),
      ),
      color: Colors.black54,
    );
  }
}
