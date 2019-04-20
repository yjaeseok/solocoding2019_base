import 'package:flutter/material.dart';

class GDGSuwon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Image.asset("res/images/gdg.png", width: 50, height: 50),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          "GDG Suwon",
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("res/images/gdg.png"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final String content = "#GDG Suwon? \n\n" +
        "GDG Suwon은 수원 지역에 개발자 커뮤니티를 형성하고, 개발자들이 커뮤니케이션하면서 서로 더 성장할 수 있는 기회를 만들고자 생성된 챕터입니다. " +
        "기존에 개발자 행사를 하나 참여하려고 해도 1시간 정도의 이동시간을 소요했던 수원에 계신 개발자분들이, " +
        "이제는 가까운 곳에서 더 많이 성장을 꿈꿀 수 있도록 하기 위해 시작한 작은 챕터입니다.";

    final bottomContentText = Text(
      content,
      style: TextStyle(fontSize: 18.0),
    );
    final bottomContent = Container(
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: bottomContentText,
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    ));
  }
}
