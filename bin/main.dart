// import 'package:project_2/project_2.dart' as project_2;
import 'dart:io';

void main(List<String> arguments) {
  print('Welcome to the Solar System!');
  print('There are 8 planets to explore.');

  print('What is your name?');

  final name = stdin.readLineSync();

  print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');

  print(
    'Let\'s go on an adventure!\n'
    'Shall I randomly choose a planet for you to visit? (Y or N)'
  );

  final answer = stdin.readLineSync();

  if (answer == 'Y') {
    print(
      'Ok! Traveling to Mercury...\n'
      'Arrived at Mercury. A very hot planet, closest to the sun.'
    );
  } else {
    print('Name the planet you would like to visit.');
    final planetName = stdin.readLineSync();
    print(
      'Traveling to $planetName...\n'
      'Arrived at $planetName. A very cold planet, furthest from the sun.'
    );
  }
}
