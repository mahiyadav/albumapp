
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/AlbumModel.dart';
import '../Utilities/AppUtilities.dart';

class Webservice {

  Future<List<AlbumsModel>> getAllAlbums() async {
    var body = jsonEncode({"status": 1});
    var response = await http.get(APIURL + albums);
    if (response.statusCode == 200) {
      final Iterable dataApi = json.decode(response.body);
      return dataApi.map((album) => AlbumsModel.fromJson(album)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<PhotoModel>> getAllPhotos(String albumid) async {
    var body = jsonEncode({"status": 1});
    var response = await http.get(APIURL + photoAlbum + "$albumid");
    if (response.statusCode == 200) {
      final Iterable dataApi = json.decode(response.body);
      return dataApi.map((photo) => PhotoModel.fromJson(photo)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}