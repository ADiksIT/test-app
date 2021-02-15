import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({Key key, @required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
