  import 'dart:convert';
  import 'dart:async';

  import 'package:http/http.dart' as http;

  import 'key.dart';

  main() {
    getPlaces(37.290414, 127.0485383); // Avenue France
  }

  class Place {
    final String name;
    final double rating;
    final String address;

    Place.fromJson(Map jsonMap) :
      name = jsonMap['name'],
      rating = jsonMap['rating']?.toDouble() ?? -1.0,
      address = jsonMap['vicinity'];
    
    String toString() => 'Place: $name';
  }

  Future<Stream<Place>> getPlaces(double lat, double lng) async {
    var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json' +
      '?location=$lat,$lng' +
      '&radius=2000&type=restraurant&keyword=맛집' +
      '&key=$key';

    // http.get(url).then(
    //   (res) => print(res.body)
    // );
    
    http.Client client = http.Client();
    http.StreamedResponse streamdRes = await client.send(
      http.Request('get', Uri.parse(url))
    );

    return streamdRes.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((jsonBody) => (jsonBody as Map)['results'])
      .map((jsonBody) => Place.fromJson(jsonBody));
      // .listen((data) => print(data))
      // .onDone(() => client.close());
  }

