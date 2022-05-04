class Workout {
  final List<String> names;
  final List<String> sets;
  final List<String> weights;

  Workout({required this.names, required this.sets, required this.weights});

  factory Workout.fromRTDB(Map<String, dynamic> data) {
    return Workout(
      names: data['names'] ?? [""],
      sets: data['sets'] ?? [""],
      weights: data['weights'] ?? [""],
    );
  }
}