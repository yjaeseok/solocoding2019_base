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

  Widget getIcon() {
    if (project.description.startsWith("Memo")) {
      return Icon(Icons.note, color: Colors.brown);
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
      subtitle: Row(
        children: <Widget>[
          getIcon(),
          Text(" 구현점수: " +
              project.defaultFeatureScore.toString() +
              " + " +
              project.newFeatureScore.toString() +
              " + " +
              project.readmeScore.toString() +
              " = " +
              (project.defaultFeatureScore +
                      project.newFeatureScore +
                      project.readmeScore)
                  .toString())
        ],
      ),
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
