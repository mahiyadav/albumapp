import 'package:flutter/material.dart';
import '../Models/AlbumModel.dart';
import 'package:intl/intl.dart';
import '../Widgets/Photo_list.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Album_list_model.dart';
import '../Services/Webservice.dart';
class Photo extends StatefulWidget {
  AlbumsModel album;

  Photo(this.album);

  @override
  State<StatefulWidget> createState() {
    return PhotoState();
  }
}

class PhotoState extends State<Photo> {

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
          title: Text(toBeginningOfSentenceCase('${widget.album.title}')),
        ),
        resizeToAvoidBottomPadding: false,
        body: StreamBuilder(
          stream: Webservice().getAllPhotos('${widget.album.id}').asStream(),
          builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
            //print("photo.snapshot.hasData ${snapshot.data}");
            if (snapshot.data != null) {
              return new Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: PhotoList(snapshot.data),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
}

}
