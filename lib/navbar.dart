import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final VoidCallback setHome; //change widget to home
  final VoidCallback setWorkoutPlan; //change widget to workout plans
  final VoidCallback setTracker; //change widget to set tracker


  NavBar(this.setHome, this.setWorkoutPlan, this.setTracker);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _navBarIndex = 0; //which nav bar button is pressed

  void _onTapped(int index) {
    setState(() {
      _navBarIndex = index; //change nav bar index when button is pressed
    });

    //call corresponding widget
    if (index == 0) {
      widget.setHome();
    } else if (index == 1) {
      widget.setWorkoutPlan();
    } else if (index == 2) {
      widget.setTracker();
    }

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.red[900],
      currentIndex: _navBarIndex,
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.white,
      //buttons on bar
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department),
          label: 'Workout Plans',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center_rounded),
          label: 'Set Tracker',
        ),
      ],

      onTap: _onTapped,
    );
  }
}

