part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RoutesEventCalculateRoute extends RoutesEvent {
  final Group group;
  final List<Group> groups;

  RoutesEventCalculateRoute({this.group, this.groups});

  @override
  List<Object> get props => [group, groups];
}
