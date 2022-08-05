import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/prueba_tecnica/bloc/animal_bloc.dart';
import 'package:prueba_tecnica/prueba_tecnica/models/animal.dart';
import 'package:prueba_tecnica/prueba_tecnica/models/ubication.dart';

class AddAnimalPage extends StatefulWidget {
  const AddAnimalPage({Key? key}) : super(key: key);

  @override
  State<AddAnimalPage> createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends State<AddAnimalPage> {
  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _locationController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar animal"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Image.network("https://picsum.photos/200"),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Tipo o nombre del animal",
                    ),
                    controller: _nameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Ubicacion del animal",
                    ),
                    controller: _locationController,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            InkWell(
              onTap: () {
                String locationInString = _locationController.text;
                double lat = double.parse(locationInString.split(",")[0]);
                double lng = double.parse(locationInString.split(",")[1]);
                context.read<AnimalBloc>().add(OnSaveAnimal(
                    animal: Animal(
                        name: _nameController.text,
                        image: "https://picsum.photos/200",
                        ubication: Ubication(lat: lat, lng: lng))));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "Guardar",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
