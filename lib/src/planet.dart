class Planet {

  final String name;
  final String description;

  Planet({this.name, this.description});

  Planet.nullPlanet() : name = 'Null', description = 'Null';

  bool get notNull => name != 'Null' && description != 'Null';

}