import '../models/question_model.dart';

final List<Question> hardQuestions = [
  Question(
    text: 'What is the role of the BuildContext in Flutter?',
    options: [
      'It defines widget build logic.',
      'It provides access to theme data.',
      'It holds references to child widgets.',
      'It stores the widget tree structure.'
    ],
    correctOptionIndex: 1,
    definitions: [
      'BuildContext provides access to theme data.',
      'It doesn’t define widget build logic.',
      'It doesn’t hold references to child widgets.',
      'It doesn’t store the widget tree structure.'
    ],
  ),
  Question(
    text: 'How does the "Keys" feature help in Flutter?',
    options: [
      'It rebuilds widgets efficiently.',
      'It enhances UI performance.',
      'It tracks widget states.',
      'It creates reusable layouts.'
    ],
    correctOptionIndex: 0,
    definitions: [
      'Keys help rebuild widgets efficiently.',
      'They don’t enhance UI performance directly.',
      'They don’t track widget states.',
      'They don’t create reusable layouts.'
    ],
  ),
  Question(
    text: 'What is the purpose of "RenderObject" in Flutter?',
    options: [
      'Handles layout and painting',
      'Manages app routing',
      'Optimizes state management',
      'Creates animations'
    ],
    correctOptionIndex: 0,
    definitions: [
      'RenderObject handles layout and painting.',
      'It doesn’t manage app routing.',
      'It doesn’t optimize state management.',
      'It doesn’t create animations.'
    ],
  ),
  Question(
    text: 'What does the "InheritedWidget" class provide?',
    options: [
      'Shared data across the widget tree',
      'State management',
      'Navigation functionality',
      'Efficient rendering'
    ],
    correctOptionIndex: 0,
    definitions: [
      'InheritedWidget allows sharing data across the widget tree.',
      'It is not used for state management directly.',
      'It doesn’t handle navigation.',
      'It doesn’t improve rendering efficiency.'
    ],
  ),
  Question(
    text: 'What is a "Sliver" in Flutter?',
    options: [
      'A scrollable area',
      'A state management tool',
      'An animation package',
      'A data structure'
    ],
    correctOptionIndex: 0,
    definitions: [
      'A sliver is a scrollable area in Flutter.',
      'It is not a state management tool.',
      'It is not an animation package.',
      'It is not a data structure.'
    ],
  ),
  Question(
    text: 'What does the "CustomPainter" class allow in Flutter?',
    options: [
      'Creating custom graphics',
      'Managing app state',
      'Improving animations',
      'Building layouts'
    ],
    correctOptionIndex: 0,
    definitions: [
      'CustomPainter allows creating custom graphics.',
      'It doesn’t manage app state.',
      'It doesn’t improve animations.',
      'It doesn’t build layouts.'
    ],
  ),
  Question(
    text: 'What is the "StatefulWidget lifecycle" used for?',
    options: [
      'Managing state changes',
      'Optimizing rendering',
      'Tracking user input',
      'Handling gestures'
    ],
    correctOptionIndex: 0,
    definitions: [
      'The StatefulWidget lifecycle manages state changes.',
      'It doesn’t directly optimize rendering.',
      'It doesn’t track user input.',
      'It doesn’t handle gestures.'
    ],
  ),
  Question(
    text: 'What is a "Stack" widget used for in Flutter?',
    options: [
      'Overlaying widgets',
      'Arranging widgets horizontally',
      'Managing scrollable views',
      'Optimizing layouts'
    ],
    correctOptionIndex: 0,
    definitions: [
      'A Stack widget overlays widgets on top of each other.',
      'It doesn’t arrange widgets horizontally.',
      'It doesn’t manage scrollable views.',
      'It doesn’t optimize layouts directly.'
    ],
  ),
  Question(
    text: 'What is the function of the "Flutter inspector"?',
    options: [
      'Debugging UI',
      'Improving app performance',
      'Managing app state',
      'Setting app permissions'
    ],
    correctOptionIndex: 0,
    definitions: [
      'The Flutter inspector is used for debugging UI.',
      'It doesn’t directly improve app performance.',
      'It doesn’t manage app state.',
      'It doesn’t set app permissions.'
    ],
  ),
  Question(
    text: 'What is the use of "setState()" in a Flutter app?',
    options: [
      'To rebuild the UI',
      'To manage animations',
      'To handle gestures',
      'To enhance performance'
    ],
    correctOptionIndex: 0,
    definitions: [
      'setState() triggers a rebuild of the UI.',
      'It doesn’t manage animations.',
      'It doesn’t handle gestures.',
      'It doesn’t directly enhance performance.'
    ],
  ),
];
