import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:solocoding2019_base/data/project.dart';
import 'package:solocoding2019_base/view/circlenetworkimage.dart';

class ProjectTileWidget extends StatefulWidget {
  final Project project;
  ProjectTileWidget(this.project);

  @override
  State<StatefulWidget> createState() => ProjectTileState(project);
}

class ProjectTileState extends State<ProjectTileWidget> {
  final Project project;
  ProjectTileState(this.project);

  getProgressColor() {
    return Color.lerp(Colors.blueGrey, Colors.blue, project.totalScore / 100.0);
  }

  Widget getIcon() {
    if (project.description.startsWith("Memo")) {
      return Icon(Icons.event_note, color: Colors.brown);
    } else if (project.description.startsWith("Map")) {
      return Icon(Icons.map, color: Colors.blueGrey);
    } else if (project.description.startsWith("Todo")) {
      return Icon(Icons.alarm_on, color: Colors.blueAccent);
    } else if (project.description.startsWith("Calculator")) {
      return Icon(Icons.add_circle_outline, color: Colors.greenAccent);
    } else if (project.description.startsWith("Weather")) {
      return Icon(Icons.brightness_low, color: Colors.red);
    } else {
      return Image.asset("res/images/solocoding.png", width: 20, height: 20);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
            child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              child: Stack(children: <Widget>[
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
              ])),
          title: Text(project.userId,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: <Widget>[
              getIcon(),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(project.description)),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: LinearProgressIndicator(
                        value: project.totalScore / 100.0,
                        valueColor: AlwaysStoppedAnimation(getProgressColor())),
                  )),
            ],
          ),
          trailing: ProjectTrainlingWidget(project),
          onTap: () => launchUrl('https://github.com/' + project.projectId),
        )));
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
    return ProjectCommitWidget(project.totalScore);
  }
}

class ProjectCommitWidget extends StatelessWidget {
  final int totalScore;

  ProjectCommitWidget(this.totalScore);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text(totalScore.toString()));
  }
}
