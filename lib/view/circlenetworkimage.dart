import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircleNetworkImage extends StatelessWidget {
  final String url;
  final double size;

  CircleNetworkImage(this.url, {this.size: 60});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => new CircularProgressIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
      width: size,
      height: size,
      fit: BoxFit.scaleDown,
    ));
  }
}
