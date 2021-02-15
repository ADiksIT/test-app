import 'package:flutter/material.dart';
import 'package:test_application/models/photo.dart';
import 'package:test_application/services/api.dart';
import 'package:test_application/widgets/photo_card.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Photo>> _images;

  @override
  void initState() {
    super.initState();
    _images = fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _images,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) =>
                  MyPhotoCard(photo: snapshot.data[index]),
            );
          }
          if (snapshot.hasError) {
            return Text('The fetching of photos ended with an error');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
