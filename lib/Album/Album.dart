import 'package:flutter/material.dart';
import '../Models/AlbumModel.dart';
import '../Widgets/Album_list.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Album_list_model.dart';

class Album extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlbumState();
  }
}

class AlbumState extends State<Album> {
  List<AlbumsModel> myAlbum;

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
    final alb = Provider.of<AlbumListViewModel>(context);
    alb.fetchAlbums();
    return Scaffold(
        appBar: AppBar(
          title: Text('My Album'),
        ),
        resizeToAvoidBottomPadding: false,
        body: new Container(
          height: MediaQuery.of(context).size.height,
          child: AlbumList(listAlbum:alb.album),
        )
    );
  }


}
