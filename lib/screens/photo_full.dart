import 'package:flutter/material.dart';
import 'package:test_application/models/photo.dart';
import 'package:test_application/widgets/image.dart';

class PhotoFull extends StatelessWidget {
  const PhotoFull({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Full photo"),
      ),
      body: Center(
        child: MyImage(url: photo.urlRegular),
      ),
    );
  }
}
