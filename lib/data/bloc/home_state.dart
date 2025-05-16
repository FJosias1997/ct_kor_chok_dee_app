import 'package:ct_kor_chok_dee_app/data/models/students_model.dart';

abstract class HomeState {}

class HomeInitialState implements HomeState {}

class HomeLoadingState implements HomeState {}

class HomeLoadedState implements HomeState {
  final List<StudentsModel> students;

  HomeLoadedState({required this.students});
}

class UserLoadedState implements HomeState {
  final StudentsModel student;

  UserLoadedState({required this.student});
}

class HomeErrorState implements HomeState {
  final int? statusCode;
  final String message;
  final String? detailedMessage;

  HomeErrorState({
    this.statusCode,
    this.detailedMessage,
    required this.message,
  });
}
