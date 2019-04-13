import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class Project {
  final String userId;
  final String projectId;
  final String description;
  String profileImagePath;

  Project.fromJson(Map jsonMap)
      : userId = jsonMap['projectId'].toString().split('/')[0],
        projectId = jsonMap['projectId'],
        description = jsonMap['description'],
        profileImagePath = "";

  String toString() => 'Project: userId: $userId';
}

main() {
  getProjects();
}

/*Future<Stream<Project>>*/ getProjects() async {
  var url =
      'https://raw.githubusercontent.com/gdgsuwon/solocoding2019_dashboard/master/data.json';

  // http.get(url).then((res) => print(res.body));

  http.Client client = http.Client();
  http.StreamedResponse streamedResponse =
      await client.send(http.Request('get', Uri.parse(url)));

  return streamedResponse.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((jsonBody) => (jsonBody as Map)['project'])
      .map((jsonBody) => Project.fromJson(jsonBody));
  // .listen((data) => print(data))
  // .onDone(() => client.close());
}
