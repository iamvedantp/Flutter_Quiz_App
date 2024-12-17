import '../models/question_model.dart';

final List<Question> mediumQuestions = [
  Question(
    text: 'Which widget is used to manage states in Flutter?',
    options: [
      'StatefulWidget',
      'StatelessWidget',
      'InheritedWidget',
      'Container'
    ],
    correctOptionIndex: 0,
    definitions: [
      'StatefulWidget manages state in Flutter apps.',
      'StatelessWidget cannot manage states.',
      'InheritedWidget passes data to child widgets but doesn’t manage state.',
      'Container is a layout widget, not for state management.'
    ],
  ),
  Question(
    text: 'What does the "Navigator.push()" method do?',
    options: [
      'Adds a new route',
      'Replaces the current route',
      'Removes all routes',
      'Closes the app'
    ],
    correctOptionIndex: 0,
    definitions: [
      'Navigator.push() adds a new route to the navigation stack.',
      'It doesn’t replace the current route.',
      'It doesn’t remove all routes.',
      'It doesn’t close the app.'
    ],
  ),
  Question(
    text: 'What is a "GlobalKey" used for in Flutter?',
    options: [
      'To uniquely identify widgets',
      'To manage widget states',
      'To improve app performance',
      'To handle routing'
    ],
    correctOptionIndex: 0,
    definitions: [
      'GlobalKey uniquely identifies widgets.',
      'It doesn’t directly manage widget states.',
      'It doesn’t improve app performance.',
      'It doesn’t handle routing.'
    ],
  ),
  Question(
    text: 'What is the primary purpose of the "StreamBuilder" widget?',
    options: [
      'To manage app state',
      'To display stream data',
      'To optimize performance',
      'To handle user input'
    ],
    correctOptionIndex: 1,
    definitions: [
      'StreamBuilder is not used for managing app state.',
      'StreamBuilder is used to display stream data in real time.',
      'StreamBuilder does not optimize performance.',
      'StreamBuilder is not for handling user input.'
    ],
  ),
  Question(
    text: 'What does "flutter pub get" do?',
    options: [
      'Installs dependencies',
      'Updates Flutter SDK',
      'Generates widgets',
      'Clears app cache'
    ],
    correctOptionIndex: 0,
    definitions: [
      'flutter pub get installs project dependencies.',
      'It doesn’t update Flutter SDK.',
      'It doesn’t generate widgets.',
      'It doesn’t clear app cache.'
    ],
  ),
  Question(
    text: 'What is a "FutureBuilder" widget used for?',
    options: [
      'Displaying async data',
      'Creating animations',
      'Handling gestures',
      'Managing app lifecycle'
    ],
    correctOptionIndex: 0,
    definitions: [
      'FutureBuilder displays asynchronous data.',
      'It is not used for creating animations.',
      'It doesn’t handle gestures.',
      'It doesn’t manage app lifecycle.'
    ],
  ),
  Question(
    text: 'What is the role of "setState()" in Flutter?',
    options: [
      'To trigger a rebuild',
      'To update widget properties',
      'To initialize state',
      'To optimize performance'
    ],
    correctOptionIndex: 0,
    definitions: [
      'setState() triggers a rebuild of the widget tree.',
      'It doesn’t update widget properties directly.',
      'It doesn’t initialize state.',
      'It doesn’t optimize performance directly.'
    ],
  ),
  Question(
    text: 'What is the purpose of the "GestureDetector" widget?',
    options: [
      'To handle gestures',
      'To track widget states',
      'To rebuild the UI',
      'To improve layout design'
    ],
    correctOptionIndex: 0,
    definitions: [
      'GestureDetector is used to handle gestures like tap, swipe, and pinch.',
      'It doesn’t track widget states.',
      'It doesn’t rebuild the UI.',
      'It doesn’t improve layout design.'
    ],
  ),
  Question(
    text: 'Which package is used for state management in Flutter?',
    options: ['Provider', 'Dart', 'Router', 'Navigator'],
    correctOptionIndex: 0,
    definitions: [
      'Provider is a popular package for state management.',
      'Dart is the programming language for Flutter, not a state management package.',
      'Router is for navigation, not state management.',
      'Navigator is used for route handling, not state management.'
    ],
  ),
  Question(
    text:
        'What is the difference between "StatelessWidget" and "StatefulWidget"?',
    options: [
      'StatelessWidget has no state, while StatefulWidget has mutable state.',
      'StatefulWidget is faster than StatelessWidget.',
      'StatelessWidget stores app data.',
      'There is no difference.'
    ],
    correctOptionIndex: 0,
    definitions: [
      'StatelessWidget has no state, while StatefulWidget has mutable state.',
      'StatefulWidget is not necessarily faster.',
      'StatelessWidget doesn’t store app data.',
      'There is a significant difference.'
    ],
  ),
];
