import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_tecnica/prueba_tecnica/bloc/animal_bloc.dart';
import 'package:prueba_tecnica/prueba_tecnica/data/providers/animal_provider.dart';
import 'package:prueba_tecnica/prueba_tecnica/data/repository/animal_repository.dart';
import 'package:prueba_tecnica/prueba_tecnica/view/animal_view.dart';

void main() async {
  await Hive.initFlutter();
  openBoxes();
  runApp(const MyApp());
}

Future<void> openBoxes() async {
  await Hive.openBox<List<String>>('animalls');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnimalBloc(
              animalRepository:
                  AnimalRepository(animalProvider: AnimalProvider())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AnimalPage(),
      ),
    );
  }
}
