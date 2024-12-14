class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;
  final List<String> definitions;
  int selectedOptionIndex = -1;

  Question({
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    required this.definitions,
    this.selectedOptionIndex = -1,
  });
}
