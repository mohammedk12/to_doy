class Task {
  final String name;
  bool isDone;

  Task(
      {required this.name,
      this.isDone = false}); // by defult it's false (not done)

  void toggleDone() {
    isDone = !isDone;
  }
}
