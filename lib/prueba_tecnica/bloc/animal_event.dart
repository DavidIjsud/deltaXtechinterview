part of 'animal_bloc.dart';

@immutable
abstract class AnimalEvent {}

class OnLoadAnimals extends AnimalEvent {}

class OnSaveAnimal extends AnimalEvent {
  final Animal animal;

  OnSaveAnimal({required this.animal});
}
