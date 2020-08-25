part of 'routes_bloc.dart';

abstract class RoutesState extends Equatable {
  @override
  List<Object> get props => [];
}

class RoutesInitial extends RoutesState {}

class RoutesStateResultCalculated extends RoutesState {
  final Route route;
  final int time;
  final List<int> times;

  RoutesStateResultCalculated({this.route, this.time, this.times});

  @override
  List<Object> get props => [route, time, times];
}
