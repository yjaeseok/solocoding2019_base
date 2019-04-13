import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:solocoding2019_base/data/project.dart';
import 'package:solocoding2019_base/view/circlenetworkimage.dart';
import 'package:solocoding2019_base/key.dart';

import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class ProjectTileWidget extends StatefulWidget {
  final Project project;
  ProjectTileWidget(this.project);

  @override
  State<StatefulWidget> createState() => ProjectTileState(project);
}

class ProjectTileState extends State<ProjectTileWidget> {
  final Project project;
  ProjectTileState(this.project);

  @override
  void initState() {
    initProfileImagePath();
    super.initState();
  }

  void initProfileImagePath() async {
    var res = await http.get('https://api.github.com/users/' +
        project.userId +
        '?client_id=$client_id&client_secret=$client_secret');
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        project.profileImagePath = data["avatar_url"] as String;
      } else {
        print('https://api.github.com/users/' +
            project.userId +
            'statusCode' +
            res.statusCode.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleNetworkImage(project.profileImagePath),
      title: Text(project.userId),
      subtitle: Text(project.projectId),
      trailing: ProjectTrainlingWidget(),
      onTap: () => launchUrl('https://github.com/' + project.projectId),
    );
  }

  launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ProjectTrainlingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [ProjectIssueWidget(), new Text('I miss you')]);
  }
}

class ProjectIssueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      color: Colors.orange,
      child: Text(
        "0",
        style: Theme.of(context).primaryTextTheme.headline,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
    );
  }
}

class ProjectCommitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.0,
      color: Colors.orange,
      child: Text(
        "1",
        style: Theme.of(context).primaryTextTheme.headline,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
    );
  }
}
