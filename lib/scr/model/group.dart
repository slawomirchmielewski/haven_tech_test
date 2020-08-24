import 'package:equatable/equatable.dart';

class Group extends Equatable {
  final int familyId;
  final int groupSize;
  final int caravan;

  Group({
    this.familyId,
    this.groupSize,
    this.caravan,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      familyId: json["familyid"],
      groupSize: json["groupsize"],
      caravan: json["caravan"],
    );
  }

  @override
  List<Object> get props => [familyId, groupSize, caravan];
}
