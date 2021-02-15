import 'package:flutter/material.dart';
import 'package:test_application/models/photo.dart';
import 'package:test_application/services/api.dart';
import 'package:test_application/widgets/photo_card.dart';
import 'photo_full.dart';

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

  ListView _buildList(BuildContext context, List<Photo> photos) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (ctx, index) => MyPhotoCard(
        photo: photos[index],
        onTapCard: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoFull(),
            settings: RouteSettings(arguments: photos[index]),
          ),
        ),
      ),
    );
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
            return _buildList(context, snapshot.data);
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
