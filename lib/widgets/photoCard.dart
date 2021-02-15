import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/photo.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({Key key, @required this.photo}) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => null,
        child: Column(children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: photo.urlSmall,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
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
