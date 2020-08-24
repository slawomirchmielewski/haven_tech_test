import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haven_tech_test/scr/app.dart';
import 'package:haven_tech_test/scr/bloc/group_bloc/group_bloc.dart';
import 'package:haven_tech_test/scr/bloc/routes_bloc/routes_bloc.dart';
import 'package:haven_tech_test/scr/repository/groups_repository.dart';

void main() {
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<GroupsRepository>(
      create: (context) => GroupsRepository(),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GroupsRepository _groupsRepository;

  @override
  void initState() {
    super.initState();
    _groupsRepository ??= RepositoryProvider.of<GroupsRepository>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GroupBloc>(
          create: (context) => GroupBloc(groupsRepository: _groupsRepository),
        ),
        BlocProvider<RoutesBloc>(create: (context) => RoutesBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
      ),
    );
  }
}
