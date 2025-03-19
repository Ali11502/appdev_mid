import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialState()) {
    on<LoadData>(_onLoadData);
    on<RefreshData>(_onRefreshData);
  }

  void _onLoadData(LoadData event, Emitter<AppState> emit) async {
    emit(LoadingState());

    try {
      // Simulating data fetching (Replace with API call or database query)
      await Future.delayed(const Duration(seconds: 2));
      emit(LoadedState("Data loaded successfully"));
    } catch (e) {
      emit(ErrorState("Failed to load data"));
    }
  }

  void _onRefreshData(RefreshData event, Emitter<AppState> emit) async {
    emit(LoadingState());

    try {
      // Simulating data refresh
      await Future.delayed(const Duration(seconds: 1));
      emit(LoadedState("Data refreshed successfully"));
    } catch (e) {
      emit(ErrorState("Failed to refresh data"));
    }
  }
}
