import 'package:flutter/material.dart';
import 'package:test_application/models/photo.dart';
import 'package:test_application/screens/photo_full.dart';
import 'package:test_application/widgets/image.dart';

class MyPhotoCard extends StatelessWidget {
  const MyPhotoCard({Key key, @required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoFull(),
            settings: RouteSettings(arguments: photo),
          ),
        ),
        child: Column(children: [
          MyImage(
            url: photo.urlSmall,
          ),
          ListTile(
            title: Text(
              'Photo by ${photo.authorName}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            subtitle: Text(
              photo.description,
              style: TextStyle(fontSize: 17.0),
            ),
          ),
        ]),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
