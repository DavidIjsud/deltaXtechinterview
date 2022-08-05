import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/prueba_tecnica/models/animal.dart';

class AnimalProvider {
  AnimalProvider();

  Future<Map<String, dynamic>> saveAnimal(Animal animal) async {
    try {
      final boxAnimal = Hive.box<List<String>>('animalls');
      final List<String>? animals = boxAnimal.get('anims', defaultValue: []);
      String animalJson = """{
        "name":  "${animal.name.toString()}",
        "image": "${animal.image.toString()}",
        "ubication": {
          "lat": ${animal.ubication.lat},
          "lng": ${animal.ubication.lng}
        }
      }""";
      animals!.add(animalJson);
      await boxAnimal.put("anims", animals);
      return {'status': true, 'data': {}};
    } catch (e) {
      return {'status': false, 'data': e.toString()};
    }
  }

  Future<Map<String, dynamic>> getAllAnimals() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    Box<List<String>> animals = Hive.box<List<String>>("animalls");

    if (response.statusCode == 200) {
      return {"status": true, "data": animals.get("anims", defaultValue: [])};
    } else {
      return {"status": false, "data": {}};
    }
  }
}
