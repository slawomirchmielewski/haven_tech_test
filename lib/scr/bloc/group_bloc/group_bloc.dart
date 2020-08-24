import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:haven_tech_test/scr/model/group.dart';
import 'package:haven_tech_test/scr/repository/groups_repository.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, List<Group>> {
  GroupsRepository _groupsRepository;

  GroupBloc({GroupsRepository groupsRepository})
      : _groupsRepository = groupsRepository,
        super(null);

  List<Group> _groups = [];

  @override
  Stream<List<Group>> mapEventToState(
    GroupEvent event,
  ) async* {
    if (event is GroupEventFetchGroups) {
      yield* _fetchGroups();
    }
  }

  Stream<List<Group>> _fetchGroups() async* {
    try {
      _groups = await _groupsRepository.fetchGroups();
      yield _groups;
    } catch (e) {
      print(e.toString());
    }
  }
}
