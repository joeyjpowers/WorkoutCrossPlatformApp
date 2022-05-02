import 'package:flutter/material.dart';
import './workoutplans.dart';
import './home.dart';
import './tracker.dart';
import './navbar.dart';
import './workoutplanresults.dart';
import './picksets.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState(); //create new MyAppState object
  }
}

class _AppState extends State<App> {
  var _page = 0; //set page to home
  //var _navBarIndex = 0;

  double _numWorkouts = 0.0;


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

  void _setPickSets(double numWorkouts) {
    setState(() {
        _page = 4;
        _numWorkouts = numWorkouts;
    });
  }

  Widget getPage(var page) {
    print(page);
    if (page == 1) {
      return WorkoutPlans(_setHome, _setWorkoutPlanResults);
    } else if (page == 2) {
      return Tracker(_setPickSets);
    } else if (page == 3) {
      return WorkoutPlanResults();
    } else if (page == 4) {
      return PickSets(_numWorkouts);
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
