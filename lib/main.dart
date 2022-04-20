import 'package:flutter/material.dart';
import './workoutplans.dart';
import './home.dart';
import './tracker.dart';
import './navbar.dart';
import './workoutplanresults.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState(); //create new MyAppState object
  }
}

class _AppState extends State<App> {
  var _page = 0; //set page to home
  var _navBarIndex = 0;

  void _setHome() {
    setState(() {
      _page = 0;
    });
  }

  void _setWorkoutPlan() {
    setState(() {
      _page = 1;
    });
  }

  void _setTracker() {
    setState(() {
      _page = 2;
    });
  }

  void _setWorkoutPlanResults() {
    setState(() {
      _page = 3;
    });
  }

  Widget getPage(var page) {
    if (page == 1) {
      return WorkoutPlans(_setHome, _setWorkoutPlanResults);
    } else if (page == 2) {
      return Tracker(_setHome);
    } else if (page == 3) {
      return WorkoutPlanResults();
    } else {
      return Home(_setWorkoutPlan, _setTracker);
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Workout App",
                      style: TextStyle(fontSize: 28),)),
        backgroundColor: Colors.red[900],
      ),
      body: getPage(_page),
      bottomNavigationBar: NavBar(_setHome, _setWorkoutPlan, _setTracker),
    ));
  }
}
