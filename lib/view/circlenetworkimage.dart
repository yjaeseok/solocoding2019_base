import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleNetworkImage extends StatelessWidget {
  final String url;
  final double size;

  CircleNetworkImage(this.url, {this.size: 70});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => new CircularProgressIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
      fadeOutDuration: new Duration(seconds: 1),
      fadeInDuration: new Duration(seconds: 3),
      width: size,
      height: size,
      fit: BoxFit.scaleDown,
    );
  }
}
