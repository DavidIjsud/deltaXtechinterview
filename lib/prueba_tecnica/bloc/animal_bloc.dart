import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prueba_tecnica/prueba_tecnica/data/repository/animal_repository.dart';
import 'package:prueba_tecnica/prueba_tecnica/models/animal.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  final AnimalRepository animalRepository;

  AnimalBloc({required this.animalRepository}) : super(AnimalInitial()) {
    on<OnLoadAnimals>(_onLoadAnimals);
    on<OnSaveAnimal>(_onSaveAnimal);
  }

  Future<void> _onSaveAnimal(
      OnSaveAnimal event, Emitter<AnimalState> emit) async {
    emit(AnimalLoading());
    final response = await animalRepository.saveAnimal(event.animal);
    if (response == true) {
      emit(AnimalSaved(animal: event.animal));
    } else {
      emit(AnimalErrorOnLoad(error: 'Error al guardar el animal'));
    }
  }

  Future<void> _onLoadAnimals(
      OnLoadAnimals event, Emitter<AnimalState> emit) async {
    emit(AnimalLoading());
    try {
      final response = await animalRepository.getAllAnimals();
      emit(AnimalLoaded(animals: response));
    } catch (e) {
      emit(AnimalErrorOnLoad(error: e.toString()));
    }
  }
}
