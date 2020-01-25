import 'dart:io';

class SpaceAdventure {
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
    print('Welcome to the Solar System!');
    print('There are 8 planets to explore.');
  }

  void printIntroduction(String name) {
    print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
   return stdin.readLineSync();
  }

  void travelToRandomPlanet() {
    print(
      'Ok! Traveling to Mercury...\n'
      'Arrived at Mercury. A very hot planet, closest to the sun.'
    );
  }

  void travelTo(String planetName) {
    print(
      'Traveling to $planetName...\n'
      'Arrived at $planetName. A very cold planet, furthest from the sun.'
    );
  }

  void travel(bool randomDestingation) {
    if (randomDestingation) {
      travelToRandomPlanet();
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
