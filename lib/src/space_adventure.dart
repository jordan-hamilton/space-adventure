import 'dart:io';
import 'planetary_system.dart';

class SpaceAdventure {

  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    travel(
      promptForRandomOrSpecificDestination(
        'Shall I randomly choose a planet for you to visit? (Y or N)'
      )
    );
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  String responseToPrompt(String prompt) {
  print(prompt);
  return stdin.readLineSync();
  }

  void printIntroduction(String name) {
    print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  void travelToRandomDestination() {
    print(
      'Ok! Traveling to Mercury...\n'
      'Arrived at Mercury. A very hot planet, closest to the sun.'
    );
  }

  void travelTo(String destination) {
    print('Traveling to $destination...');
    planetarySystem.planets.forEach( (planet) {
      if (planet.name == destination) {
        print('Arrived at ${planet.name}. ${planet.description}');
      }
    });
  }

  void travel(bool randomDestination) {
    if (randomDestination) {
      travelToRandomDestination();
    } else {
      travelTo(responseToPrompt('Name the planet you would like to visit.'));
    }
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I didn\'t get that');
      }
    }
    return false;
  }
}
