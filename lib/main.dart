import 'package:flutter/material.dart';
import 'package:solocoding2019_base/data/project.dart';
import 'package:solocoding2019_base/view/attendee.dart';
import 'package:solocoding2019_base/view/gdgsuwon.dart';
import 'package:solocoding2019_base/view/introduce.dart';
import 'package:solocoding2019_base/view/madeby.dart';
import 'package:solocoding2019_base/view/splashscreen.dart';
import 'package:solocoding2019_base/view/projecttilewidget.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => HomeScreen(),
    },
  ));
}

// This widget is the root of your application.
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SoloCodingDashBoard();
}

class SoloCodingDashBoard extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // set material design app
    return MaterialApp(
      title: '나코딩한다', // application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: MenuDrawer(),
        appBar: AppBar(
          title: Text('  나 코딩한다 Flutter 편!'), // app bar title
        ),
        body: Center(
          child: ProjectListWidget(), // center text
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/Introduce': (BuildContext context) => Introduce(),
        '/Attendee': (BuildContext context) => Attendee(),
        '/GDGSuwon': (BuildContext context) => GDGSuwon(),
        '/MadeBy': (BuildContext context) => MadeBy(),
      },
    );
  }
}

class ProjectListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProjectListState();
}

class ProjectListState extends State<ProjectListWidget> {
  List<Project> projectList;

  @override
  void initState() {
    initProjectList();
    super.initState();
  }

  void initProjectList() async {
    projectList = List();
    Stream<Project> streamProjectList = await getProjects();
    streamProjectList
        .listen((project) => setState(() => projectList.add(project)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
          projectList.map((project) => ProjectTileWidget(project)).toList(),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("'나 코딩한다' Flutter 편"),
              accountEmail: Text("GDG Suwon"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("res/images/solocoding.png"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                    backgroundImage: AssetImage("res/images/flutter.png")),
                CircleAvatar(backgroundImage: AssetImage("res/images/gdg.png")),
              ]),
          ListTile(
            title: Text('나 코딩한다 소개'),
            onTap: () {
              Navigator.pop(context);
              showSnackBar(context, "준비 중 입니다.");
            },
          ),
          ListTile(
            title: Text('참가자 목록'),
            onTap: () {
              Navigator.pop(context);
              showSnackBar(context, "준비 중 입니다.");
            },
          ),
          ListTile(
            title: Text('GDG Suwon 소개'),
            onTap: () {
              Navigator.pop(context);
              showSnackBar(context, "준비 중 입니다.");
            },
          ),
          ListTile(
            title: Text('만든이'),
            onTap: () {
              Navigator.pop(context);
              showSnackBar(context, "준비 중 입니다.");
            },
          ),
        ],
      ),
    );
  }
}
