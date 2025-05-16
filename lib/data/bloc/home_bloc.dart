import 'package:ct_kor_chok_dee_app/data/bloc/home_event.dart';
import 'package:ct_kor_chok_dee_app/data/bloc/home_state.dart';
import 'package:ct_kor_chok_dee_app/data/models/api_exception_model.dart';
import 'package:ct_kor_chok_dee_app/data/providers/home_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeProvider provider = HomeProvider();

  HomeBloc() : super(HomeInitialState()) {
    on<GetUsersEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final usersList = await provider.getUsers();
        emit(HomeLoadedState(students: usersList));
      } on ApiException catch (e) {
        emit(HomeErrorState(statusCode: e.statusCode, message: e.message));
      } catch (e) {
        emit(
          HomeErrorState(
            message: 'Erro inesperado ao processar resposta do servidor',
          ),
        );
      }
    });
  }
}
