import 'package:prueba_tecnica/prueba_tecnica/models/ubication.dart';

class Animal {
  final String name;
  final String image;
  final Ubication ubication;

  Animal({
    required this.name,
    required this.image,
    required this.ubication,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      name: json['name'],
      image: json['image'],
      ubication: Ubication.fromJson(json['ubication']),
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ubication': ubication.toJson(),
    };
  }
}
