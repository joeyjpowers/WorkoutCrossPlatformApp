import 'package:flutter/material.dart';

class Tracker extends StatelessWidget {

  final VoidCallback setHome;
  Tracker(this.setHome);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("Tracker Home",
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
          color: Colors.red[900],
          onPressed: setHome,
        ),
      ),
      color: Colors.black54,
    );;
  }
}
