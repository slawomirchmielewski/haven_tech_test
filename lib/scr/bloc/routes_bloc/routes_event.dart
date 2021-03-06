part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RoutesEventCalculateRoute extends RoutesEvent {
  final Group group;

  RoutesEventCalculateRoute({this.group});

  @override
  List<Object> get props => [group];
}
