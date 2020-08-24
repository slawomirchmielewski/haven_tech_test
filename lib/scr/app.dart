import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haven_tech_test/scr/bloc/group_bloc/group_bloc.dart';
import 'package:haven_tech_test/scr/details_screen.dart';
import 'package:haven_tech_test/scr/model/group.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    context.bloc<GroupBloc>().add(GroupEventFetchGroups());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
      ),
      body: BlocBuilder<GroupBloc, List<Group>>(
        builder: (context, groups) {
          if (groups == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("Group ${groups[index].familyId.toString()}"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsScreen(group: groups[index])));
              },
            ),
          );
        },
      ),
    );
  }
}
