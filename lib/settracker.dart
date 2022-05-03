import 'package:flutter/material.dart';

class SetTracker extends StatefulWidget {
  var _sets;
  var _names;
  final VoidCallback _setTracker;

  SetTracker(this._sets, this._names, this._setTracker);

  var _beenPressed = new List.empty(growable: true);

  @override
  State<SetTracker> createState() => _SetTrackerState();
}

class _SetTrackerState extends State<SetTracker> {
  @override
  Widget build(BuildContext context) {
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

    if (widget._names == null) {
      widget._names = List<String>.filled(widget._sets.length, "");
    }

    var _pressedMap = new Map();
    var _pressedNum = 0;

    for (var i = 0; i < widget._sets.length; i++) {
      for (var j = 0; j < int.parse(widget._sets[i]); j++) {
        widget._beenPressed.add(false);
        final coordinates = <String, int>{"$i, $j": _pressedNum++};
        _pressedMap.addEntries(coordinates.entries);
      }
    }

    return Container(
      child: ListView(
        children: List.generate(widget._sets.length + 1, (index) {
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
                  onPressed: () => (widget._setTracker()),
                ),
              ),
            );
          }
          var _workoutnum = index + 1;
          return Column(children: [
            if (widget._names[index] == "")
              Text(
                "Workout $_workoutnum",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              )
            else
              Text(
                widget._names[index],
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(int.parse(widget._sets[index]), (index2) {
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
                        widget._beenPressed[_pressedMap["$index, $index2"]] =
                            !widget
                                ._beenPressed[_pressedMap["$index, $index2"]];
                      })
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
          ]);
        }),
      ),
      color: Colors.black54,
    );
  }
}
