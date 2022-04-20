import 'package:flutter/material.dart';

/*class NavBar extends StatelessWidget {
  final VoidCallback setHome;
  final VoidCallback setWorkoutPlan;
  final VoidCallback setTracker;
  int navBarIndex;

  NavBar(this.setHome, this.setWorkoutPlan, this.setTracker, this.navBarIndex);

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
}*/

class NavBar extends StatefulWidget {
  final VoidCallback setHome;
  final VoidCallback setWorkoutPlan;
  final VoidCallback setTracker;


  NavBar(this.setHome, this.setWorkoutPlan, this.setTracker);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _navBarIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _navBarIndex = index;
    });
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

