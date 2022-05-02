import 'package:flutter/material.dart';

class SetTracker extends StatefulWidget {
  var _sets;
  final VoidCallback _setTracker;

  SetTracker(this._sets, this._setTracker);

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
    return Container();
  }
}
