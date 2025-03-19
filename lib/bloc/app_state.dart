import 'package:equatable/equatable.dart';

// Abstract base class for all states
abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

// Initial state
class InitialState extends AppState {}

// State when data is loading
class LoadingState extends AppState {}

// State when data is successfully loaded
class LoadedState extends AppState {
  final String data;

  const LoadedState(this.data);

  @override
  List<Object> get props => [data];
}

// State when an error occurs
class ErrorState extends AppState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
