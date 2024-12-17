import '../models/question_model.dart';

final List<Question> easyQuestions = [
  Question(
    text: 'What is Flutter?',
    options: [
      'Programming Language',
      'Mobile App SDK',
      'Database Tool',
      'Operating System'
    ],
    correctOptionIndex: 1,
    definitions: [
      'Flutter is not a programming language.',
      'Flutter is a mobile app SDK developed by Google.',
      'Flutter is not a database tool.',
      'Flutter is not an operating system.'
    ],
  ),
  Question(
    text: 'Which company developed Flutter?',
    options: ['Microsoft', 'Apple', 'Facebook', 'Google'],
    correctOptionIndex: 3,
    definitions: [
      'Microsoft did not develop Flutter.',
      'Apple did not develop Flutter.',
      'Facebook did not develop Flutter.',
      'Google developed Flutter.'
    ],
  ),
  Question(
    text: 'What language is used to code Flutter apps?',
    options: ['Java', 'Swift', 'Dart', 'Python'],
    correctOptionIndex: 2,
    definitions: [
      'Java is not used for Flutter.',
      'Swift is used for iOS apps but not for Flutter.',
      'Dart is the language for Flutter development.',
      'Python is not used for Flutter development.'
    ],
  ),
  Question(
    text: 'What is the main UI building block in Flutter?',
    options: ['Activity', 'View', 'Widget', 'Fragment'],
    correctOptionIndex: 2,
    definitions: [
      'Activity is used in Android, not Flutter.',
      'View is a basic component in Android, not Flutter.',
      'Widget is the main building block in Flutter.',
      'Fragment is used in Android, not Flutter.'
    ],
  ),
  Question(
    text: 'What feature of Flutter allows quick updates without losing state?',
    options: [
      'Full Restart',
      'Hot Reload',
      'Code Compilation',
      'UI Rebuilding'
    ],
    correctOptionIndex: 1,
    definitions: [
      'Full restart restarts the app completely.',
      'Hot Reload updates the app UI without losing state.',
      'Code compilation doesn’t allow quick updates.',
      'UI rebuilding doesn’t retain app state.'
    ],
  ),
  Question(
    text: 'What is the purpose of the "pubspec.yaml" file?',
    options: [
      'To manage dependencies',
      'To create widgets',
      'To set permissions',
      'To configure app routes'
    ],
    correctOptionIndex: 0,
    definitions: [
      'The pubspec.yaml file manages dependencies.',
      'It doesn’t create widgets.',
      'It doesn’t set permissions.',
      'It doesn’t configure app routes.'
    ],
  ),
  Question(
    text: 'Which widget is used to create scrollable lists?',
    options: ['Column', 'ListView', 'Row', 'GridView'],
    correctOptionIndex: 1,
    definitions: [
      'Column is not scrollable.',
      'ListView is used for scrollable lists.',
      'Row is not scrollable.',
      'GridView is used for grids, not lists.'
    ],
  ),
  Question(
    text: 'What is the default programming paradigm in Flutter?',
    options: ['Object-Oriented', 'Declarative', 'Procedural', 'Functional'],
    correctOptionIndex: 1,
    definitions: [
      'Object-oriented is a paradigm but not the default in Flutter.',
      'Flutter uses a declarative programming paradigm.',
      'Procedural programming is not default in Flutter.',
      'Functional programming is not default in Flutter.'
    ],
  ),
  Question(
    text: 'Which command is used to create a new Flutter project?',
    options: ['flutter new', 'flutter init', 'flutter create', 'flutter setup'],
    correctOptionIndex: 2,
    definitions: [
      'flutter new is not correct.',
      'flutter init is incorrect.',
      'flutter create is the correct command.',
      'flutter setup is not correct.'
    ],
  ),
  Question(
    text: 'What is "StatelessWidget" in Flutter?',
    options: [
      'A widget for immutable components',
      'A widget for mutable components',
      'A widget for navigation',
      'A widget for layout'
    ],
    correctOptionIndex: 0,
    definitions: [
      'StatelessWidget is used for immutable UI components.',
      'StatefulWidget is used for mutable components.',
      'StatelessWidget is not used for navigation.',
      'StatelessWidget is not used for layout.'
    ],
  ),
];
