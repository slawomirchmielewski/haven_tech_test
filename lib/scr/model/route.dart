import 'package:equatable/equatable.dart';

class Route extends Equatable {
  final name;
  final List<int> camps;

  Route({this.name, this.camps});

  @override
  List<Object> get props => [name, camps];
}
