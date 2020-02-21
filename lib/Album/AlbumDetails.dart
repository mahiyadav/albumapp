import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:http/http.dart' as http;
import '../Models/AlbumModel.dart';
import 'package:intl/intl.dart';

class AlbumDetails extends StatefulWidget {
  PhotoModel photo;

  AlbumDetails(this.photo);

  @override
  State<StatefulWidget> createState() {
    return AlbumDetailsState();
  }
}

class AlbumDetailsState extends State<AlbumDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toBeginningOfSentenceCase('${widget.photo.title}')),
      ),
      resizeToAvoidBottomPadding: false,
      body: photoListRow(context, widget.photo),
    );
  }

  /// Build UI for Photo Details with Picture and title,albumid & photoid
  Widget photoListRow(BuildContext context, PhotoModel details) {
    return new Card(
      elevation: 5.0,
      child: new Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: new Column(
          children: <Widget>[
            new Image.network('${details.url}', fit: BoxFit.fill),
            new Divider(
              height: 5,
              color: Colors.transparent,
            ),
            new Row(
              children: [
                new Padding(padding: EdgeInsets.only(right: 10)),
                new Expanded(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                        child: Text(
                          toBeginningOfSentenceCase('${details.title}'),
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ))),
              ],
            ),
            new Divider(
              height: 5,
              color: Colors.transparent,
            ),
            new Row(
              children: [
                new Padding(padding: EdgeInsets.only(right: 10)),
                new Expanded(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                        child: Text(
                          'AlbumId : ${details.albumId}',
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ))),
              ],
            ),
            new Divider(
              height: 5,
              color: Colors.transparent,
            ),
            new Row(
              children: [
                new Padding(padding: EdgeInsets.only(right: 10)),
                new Expanded(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                        child: Text(
                          'PhotoId : ${details.id}',
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ))),
              ],
            ),
            new Divider(
              height: 8,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
