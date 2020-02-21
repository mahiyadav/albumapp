
import 'package:flutter/material.dart';
import '../Services/Webservice.dart';
import '../Models/AlbumModel.dart';


class AlbumListViewModel extends ChangeNotifier {
  List<AlbumsModel> album = List<AlbumsModel>();

  Future<void> fetchAlbums() async {
    final results =  await Webservice().getAllAlbums();
    this.album = results;
    //print(this.album);
    notifyListeners();
  }
}

class PhotoListViewModel extends ChangeNotifier {
  List<PhotoModel> photo = List<PhotoModel>();

  Future<void> fetchPhotos(String albumid) async {
    final results =  await Webservice().getAllPhotos(albumid);
    this.photo = results;
    //print(this.photo);
    notifyListeners();
  }
}