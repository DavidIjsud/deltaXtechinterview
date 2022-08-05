import 'dart:convert';
import 'dart:developer';

import 'package:prueba_tecnica/prueba_tecnica/data/providers/animal_provider.dart';
import 'package:prueba_tecnica/prueba_tecnica/models/animal.dart';

class AnimalRepository {
  final AnimalProvider animalProvider;

  AnimalRepository({required this.animalProvider});

  Future<List<Animal>> getAllAnimals() async {
    Map<String, dynamic> response = await animalProvider.getAllAnimals();
    if (response['status'] == true) {
      if (response['data'] != null) {
        log("Data ${response['data']}");
        return List.from(response['data'] as List<String>)
            .map((e) => Animal.fromJson(
                jsonDecode(e.toString()) as Map<String, dynamic>))
            .toList();
      }
    }

    return [];
  }

  Future<bool> saveAnimal(Animal animal) async {
    Map<String, dynamic> response = await animalProvider.saveAnimal(animal);
    if (response['status'] == true) {
      return true;
    }

    return false;
  }
}
