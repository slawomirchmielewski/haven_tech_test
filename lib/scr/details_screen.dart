import 'package:flutter/material.dart';
import 'package:haven_tech_test/scr/bloc/routes_bloc/routes_bloc.dart';
import 'package:haven_tech_test/scr/model/group.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  final Group group;
  final List<Group> groups;

  DetailsScreen({Key key, this.group, this.groups}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.bloc<RoutesBloc>().add(
        RoutesEventCalculateRoute(group: widget.group, groups: widget.groups));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: BlocBuilder<RoutesBloc, RoutesState>(
          builder: (context, state) {
            if (state is RoutesStateResultCalculated) {
              List<int> path = [];
              int waintingTime = 0;

              for (int i = 0; i <= state.time; i++) {
                path.add(state.route.camps[i]);
              }
              for (int z = 0; z < widget.group.familyId; z++) {
                waintingTime += state.times[z];
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Destination caravans fot the group is Caravan ${widget.group.caravan}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("The route is ${state.route.name}:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: path
                              .map((e) =>
                                  e == 0 ? Text("Gate") : Text("Caravan: $e"))
                              .toList()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Time of travel is ${state.time} min"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Waiting time $waintingTime min"),
                    )
                  ],
                ),
              );
            }

            return Container();
          },
        ));
  }
}
