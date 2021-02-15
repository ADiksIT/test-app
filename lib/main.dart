import 'package:flutter/material.dart';
import 'package:test_application/widgets/photoCard.dart';
import './models/photo.dart';
import './services/api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsplash App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

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

  ListView _buildListPhoto(ctx, List<Photo> photos) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (ctx, index) => PhotoCard(photo: photos[index]),
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
            return _buildListPhoto(context, snapshot.data);
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
