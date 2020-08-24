import 'dart:convert';

import 'package:haven_tech_test/scr/model/group.dart';
import 'package:http/http.dart' as http;

class GroupsRepository {
  final url =
      "https://haven-tech-test.s3-eu-west-1.amazonaws.com/tech+test+json.json";

  Future<List<Group>> fetchGroups() async {
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body) as List;
        List<Group> groups =
            jsonResponse.map((group) => Group.fromJson(group)).toList();
        return groups;
      } else {
        throw Exception('Failed to load groups');
      }
    } catch (_) {
      throw Exception('Failed to load groups');
    }
  }
}
