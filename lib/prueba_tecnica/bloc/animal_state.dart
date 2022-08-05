part of 'animal_bloc.dart';

@immutable
abstract class AnimalState {}

class AnimalInitial extends AnimalState {}

class AnimalLoading extends AnimalState {}

class AnimalLoaded extends AnimalState {
  final List<Animal> animals;

  AnimalLoaded({required this.animals});
}

class AnimalErrorOnLoad extends AnimalState {
  final String error;

  AnimalErrorOnLoad({required this.error});
}

class AnimalSaved extends AnimalState {
  final Animal animal;

  AnimalSaved({required this.animal});
}
