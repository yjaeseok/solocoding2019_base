import 'dart:convert';

import 'package:http/http.dart' as http;

class Project {
  final String userId;
  final String projectId;
  final String description;
  final int commitCount;
  final int defaultFeatureScore;
  final int newFeatureScore;
  final int readmeScore;
  final int totalScore;
  final String avatarUrl;
  final int isTutorial;
  final int rank;

  Project.fromJson(Map jsonMap, int inRank)
      : userId = jsonMap['userId'] == null
            ? jsonMap['projectId'].toString().split('/')[0]
            : jsonMap['userId'],
        projectId = jsonMap['projectId'] == null
            ? 'gdgsuwon/solocoding2019_base'
            : jsonMap['projectId'],
        description =
            jsonMap['description'] == null ? '' : jsonMap['description'],
        commitCount =
            jsonMap['commitCount'] == null ? 8 : jsonMap['commitCount'],
        defaultFeatureScore = jsonMap['defaultFeatureScore'] == null
            ? 0
            : jsonMap['defaultFeatureScore'],
        newFeatureScore =
            jsonMap['newFeatureScore'] == null ? 0 : jsonMap['newFeatureScore'],
        readmeScore =
            jsonMap['readmeScore'] == null ? 0 : jsonMap['readmeScore'],
        avatarUrl = jsonMap['avatarUrl'] == null ? '' : jsonMap['avatarUrl'],
        isTutorial = jsonMap['isTutorial'] == null ? 0 : jsonMap['isTutorial'],
        totalScore = (jsonMap['defaultFeatureScore'] == null
                ? 0
                : jsonMap['defaultFeatureScore']) +
            (jsonMap['newFeatureScore'] == null
                ? 0
                : jsonMap['newFeatureScore']) +
            (jsonMap['readmeScore'] == null ? 0 : jsonMap['readmeScore']),
        rank = inRank;

  String toString() => 'Project: userId: $userId';
}

main() {
  getProjects();
}

/*Future<Stream<Project>>*/ getProjects() async {
  int rank = 1;
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
      .map((jsonBody) => Project.fromJson(jsonBody, rank++));
  // .listen((data) => print(data))
  // .onDone(() => client.close());
}
