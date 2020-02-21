import 'package:flutter/material.dart';
import '../Models/AlbumModel.dart';
import '../Album/Photo.dart';
import 'package:intl/intl.dart';

class AlbumList extends StatelessWidget {
  final List<AlbumsModel> listAlbum;

  AlbumList({this.listAlbum});

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      children: new List<Widget>.generate(listAlbum.length, (index) {
        return new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Photo(listAlbum[index])),
              );
            },
            child: new GridTile(
              child: new Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: new Center(
                      child: new Text(
                          toBeginningOfSentenceCase(
                              '${listAlbum[index].title}'),
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  )),
            ));
      }),
    );
  }
}
