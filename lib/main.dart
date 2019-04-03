import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // set material design app
    return MaterialApp(
      title: 'solocoding2019', // application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'), // app bar title
        ),
        body: Center(
          child: Text('Hello, world'), // center text
        ),
      ),
    );
  }
}

/* TODO:
  1. make dummy list _places = List.generate(100, (i) => 'Restaurant $i');
  2. change text to listview ListView(
          children: _places.map((place) => Text(place)).toList(),
  3. explain hot-reload principle
  4. google maps api
  5. add http.dart module
  6. dart places.dart
  7. stream to place
  8. make function Future<Stream<Place>> getPlaces(double lat, double lng) async {
  9. @override
  initState() {
    super.initState();
    listenForPlaces();
  }

  listenForPlaces() async {
    var stream = await getPlaces(37.290414,127.0485383); // Avenue France
    stream.listen( (place) => _places.add(place) )
  }
  10. class _MyHomePageState extends State<MyHomePage> {
      List<Place> _places = <Place>[];
  11. child: ListView(
          children: _places.map((place) => Text(place.name)).toList(),
        )
  12. class PlaceWidget extends StatelessWidget {
  final Place _place;
  PlaceWidget(this._place);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(_place.name)
    );
  }
}

   13. children: _places.map((place) => PlaceWidget(place)).toList(),
   14. @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(_place.rating.toString()),
        backgroundColor: Colors.green
      ),
      title: Text(_place.name),
      subtitle: Text(_place.address),
    );
  }
    15. Color getColor(double rating) {
    return Color.lerp(Colors.red, Colors.green, rating/5);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(_place.rating.toString()),
        backgroundColor: getColor(_place.rating)
    16. return Dismissible(
      key: Key(_place.name),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(_place.rating.toString()),
          backgroundColor: getColor(_place.rating)
        ),
        title: Text(_place.name),
        subtitle: Text(_place.address),
      ),
    );
  }
    17. onDismissed: (direction) => 
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(_place.name + " is dismissed")),
        )
    */
