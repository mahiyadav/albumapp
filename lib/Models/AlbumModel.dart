import 'package:flutter/material.dart';



class AlbumsModel {
  final int userId;
  final int id;
  final String title;

  AlbumsModel({this.userId, this.id, this.title});
  factory AlbumsModel.fromJson(Map<String, dynamic> json) {
    return AlbumsModel(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
    );
  }
}

class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({this.albumId, this.id, this.title,this.url,this.thumbnailUrl});
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}