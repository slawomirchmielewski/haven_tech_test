import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:haven_tech_test/scr/model/group.dart';
import 'package:haven_tech_test/scr/model/route.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  List<Route> _routes;

  final Route _routeOne =
      Route(name: "Route One", camps: [0, 1, 2, 3, 4, 5, 6, 7, 8]);
  final Route _routeTwo =
      Route(name: "Route Two", camps: [0, 1, 13, 16, 15, 14, 8]);
  final Route _routeThree =
      Route(name: "Route Three", camps: [0, 1, 13, 12, 11, 10, 9, 8]);

  RoutesBloc() : super(RoutesInitial()) {
    _routes = [_routeOne, _routeTwo, _routeThree];
  }

  @override
  Stream<RoutesState> mapEventToState(
    RoutesEvent event,
  ) async* {
    if (event is RoutesEventCalculateRoute) {
      yield* _mapRoutesEventCalculateRouteToState(event.group, event.groups);
    }
  }

  Stream<RoutesState> _mapRoutesEventCalculateRouteToState(
      Group group, List<Group> groups) async* {
    Route route;
    int time = 0;
    List<int> times = [];

    for (int i = 0; i < _routes.length; i++) {
      for (int y = 1; y < _routes[i].camps.length; y++) {
        if (group.caravan == _routes[i].camps[y]) {
          route = _routes[i];
          time = y * 1;
        }
      }
    }

    for (int z = 0; z < groups.length; z++) {
      times.add(getTime(groups[z]));
    }

    yield RoutesStateResultCalculated(route: route, time: time, times: times);
  }

  int getTime(Group group) {
    int time = 0;

    for (int i = 0; i < _routes.length; i++) {
      for (int y = 1; y < _routes[i].camps.length; y++) {
        if (group.caravan == _routes[i].camps[y]) {
          time = y * 1;
        }
      }
    }

    return time;
  }
}
