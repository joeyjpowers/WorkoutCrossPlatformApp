import 'package:flutter/material.dart';
import './workoutplans.dart';
import './home.dart';
import './tracker.dart';
import './navbar.dart';
import './workoutplanresults.dart';
import './picksets.dart';
import './settracker.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState(); //create new MyAppState object
  }
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _workoutApp = Firebase.initializeApp(); //initialize firebase
  var _page = 0; //keep track of page number
  double _numWorkouts = 0.0; //number of workouts for picksets
  var _sets = null; //sets array
  var _names = null; //names array
  var _days = 0; //days for workoutplanresults
  var _type = ""; //weight type for workoutplanresults

  //set page to home page
  void _setHome() {
    setState(() {
      _page = 0;
    });
  }

  //set page to workoutplans first page
  void _setWorkoutPlan() {
    setState(() {
      _page = 1;
    });
  }

  //set page to tracker first page
  void _setTracker() {
    setState(() {
      _page = 2;
    });
  }

  //set page to workout plans second page
  void _setWorkoutPlanResults(int days, String type) {
    setState(() {
      _page = 3;
      _days = days;
      _type = type;
    });
  }

  //set page to tracker second page
  void _setPickSets(double numWorkouts) {
    setState(() {
      _page = 4;
      _numWorkouts = numWorkouts;
    });
  }

  //set page to third tracker page
  void _setSetTracker(List<String> sets, List<String> names) {
    setState(() {
      _page = 5;
      _sets = sets;
      _names = names;
    });
  }

  //display widget corresponding to page variable
  Widget getPage(var page) {
    if (page == 1) {
      return WorkoutPlans(_setHome, _setWorkoutPlanResults);
    } else if (page == 2) {
      return Tracker(_setPickSets);
    } else if (page == 3) {
      return WorkoutPlanResults(_days, _type);
    } else if (page == 4) {
      return PickSets(_numWorkouts, _setSetTracker);
    } else if (page == 5) {
      return SetTracker(_sets, _names, _setTracker);
    } else {
      return Home();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      //setup firebase
      home: FutureBuilder(
          future: _workoutApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('You have an error! ${snapshot.error.toString()}');
              return Container(
                color: Colors.black54,
                child: Text("Something went wrong!"),
              );
            } else if (snapshot.hasData) {
              return Scaffold(
                //top bar
                appBar: AppBar(
                  title: Center(
                      child: Text(
                    "Workout App",
                    style: TextStyle(fontSize: 28),
                  )),
                  backgroundColor: Colors.red[900],
                ),
                //page displayed
                body: getPage(_page),
                //bottom bar
                bottomNavigationBar:
                    NavBar(_setHome, _setWorkoutPlan, _setTracker),
              );
            } else {
              //return loading while still loading
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
