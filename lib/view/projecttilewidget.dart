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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(children: <Widget>[
        CircleNetworkImage(project.avatarUrl),
        Positioned(
            right: 0,
            height: 25,
            width: 25,
            child: project.isTutorial > 0
                ? Image.asset('res/images/smile.png')
                : IgnorePointer(
                    ignoring: true,
                  ))
      ]),
      title: Text(project.userId),
      subtitle: Text(project.description),
      trailing: ProjectTrainlingWidget(project),
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
  final Project project;
  ProjectTrainlingWidget(this.project);
  @override
  Widget build(BuildContext context) {
    return ProjectCommitWidget(project.commitCount);
  }
}

class ProjectCommitWidget extends StatelessWidget {
  final int commitCount;

  getColor() {
    if (commitCount <= 18) {
      return Color.lerp(Colors.white, Colors.blue, (commitCount - 6) / 11.0);
    } else {
      return Colors.blue;
    }
  }

  ProjectCommitWidget(this.commitCount);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: getColor(), child: Text(commitCount.toString()));
  }
}
