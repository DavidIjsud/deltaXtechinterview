import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/prueba_tecnica/bloc/animal_bloc.dart';
import 'package:prueba_tecnica/prueba_tecnica/view/add_new_animal.dart';
import 'package:prueba_tecnica/prueba_tecnica/view/map.dart';
import 'package:prueba_tecnica/prueba_tecnica/view/widgets/animal_item.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<AnimalBloc>().add(OnLoadAnimals());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animales encontrados"),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddAnimalPage()));
            }),
        body: BlocConsumer<AnimalBloc, AnimalState>(
            buildWhen: ((previous, current) =>
                current is AnimalLoaded || current is AnimalLoading),
            builder: (context, state) {
              if (state is AnimalLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is AnimalLoaded) {
                return ListView(
                  children: state.animals
                      .map((animal) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MapUbication(
                                      lat: animal.ubication.lat,
                                      lng: animal.ubication.lng)));
                            },
                            child: AnimalItem(
                              image: animal.image,
                              ubication: animal.ubication,
                              name: animal.name,
                            ),
                          ))
                      .toList(),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
            listener: (context, state) {
              if (state is AnimalSaved) {
                context.read<AnimalBloc>().add(OnLoadAnimals());
              }
            }));
  }
}
