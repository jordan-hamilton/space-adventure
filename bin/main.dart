import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:project_2/project_2.dart';

void main(List<String> arguments) async {
  final filePath = arguments[0];
  
  if (await isValidFile(filePath)) {
    final systemData = await getSystemData(filePath);
    final systemName = systemData['systemName'];
    final planetData = systemData['planets'];

    SpaceAdventure(
      planetarySystem: PlanetarySystem(
        name: systemName,
        planets: planetData
      )
    ).start();
  } else {
    print('We couldn\'t find a planetary system at the specified file path.');
  }
}

Future<bool> isValidFile(String filePath) async {
  return await File(filePath).exists();
}

Future<String> getJsonData(String filePath) async {
  String data;

  try {
    data = await File(filePath).readAsString();
  } catch (e) {
    print(e);
  }
  return data;
}

Future<Map> getSystemData(String filePath) async {
    final jsonData = jsonDecode(
      await getJsonData(filePath)
    );

    final systemName = jsonData['name'];
    final planets = jsonData['planets'];

    var systemData = {'systemName': systemName};

    systemData['planets'] = planets.map<Planet>( (e) => Planet(
      name: e['name'],
      description: e['description']
    )).toList();
    return systemData;
}
