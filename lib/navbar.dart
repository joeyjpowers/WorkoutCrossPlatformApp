import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final VoidCallback setHome;
  final VoidCallback setWorkoutPlan;
  final VoidCallback setTracker;
  int navBarIndex = 0;

  NavBar(this.setHome, this.setWorkoutPlan, this.setTracker);

  void _onTapped(int index) {
    if (index == 0) {
      setHome();
    } else if (index == 1) {
      setWorkoutPlan();
    } else if (index == 2) {
      setTracker();
    }
    navBarIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      backgroundColor: Colors.red[900],
      currentIndex: navBarIndex,
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.white,
      onTap: _onTapped,
    );
  }
}
