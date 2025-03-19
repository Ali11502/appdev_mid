import 'package:equatable/equatable.dart';

// Abstract base class for all events
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

// Event to load data
class LoadData extends AppEvent {}

// Event to refresh data
class RefreshData extends AppEvent {}
