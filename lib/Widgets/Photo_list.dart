import 'package:flutter/material.dart';
import '../Models/AlbumModel.dart';
import '../Album/AlbumDetails.dart';
import 'package:intl/intl.dart';

class PhotoList extends StatefulWidget {
  final List<PhotoModel> myPhotoAll;
  PhotoList(this.myPhotoAll);
  @override
  State<StatefulWidget> createState() {
    return PhotoListState();
  }
}

class PhotoListState extends State<PhotoList> {

  List<PhotoModel> myPhoto = List<PhotoModel>();
  int pageCount = 1;

  @override
  Widget build(BuildContext context) {
    getPagination();
    //myPhoto = widget.myPhotoAll;
    return _createListView(widget.myPhotoAll);
  }


  Widget _createListView(List<PhotoModel> listAlbum) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        Future.delayed(Duration(seconds: 0, milliseconds: 100));
        _loadMore();
      }
    });
    return ListView.builder(
      controller: _scrollController,
      itemCount: myPhoto.length + 1,
      itemBuilder: (context, index) {
        if (index >= widget.myPhotoAll.length) {
          return new Text("");
        }
        if (myPhoto.length != widget.myPhotoAll.length && myPhoto.length == index) {
          return loadMore();
        }

        return new GestureDetector(
          onTap: () {
            //AlbumDetails
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AlbumDetails(myPhoto[index])),
            );
          },
          child: photoListRow(context, myPhoto[index], index),
        );
      },
    );
  }

  /// Call For load more function for Pagination
  _loadMore() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    setState(() {});
  }

  Widget loadMore() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("   Load More ...")),
        ],
      ),
    );
  }

  /// Configure Photo List Row with childs
  Widget photoListRow(BuildContext context, PhotoModel details, int index) {
    return new Card(
      elevation: 5.0,
      child: new Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: new Row(
          children: <Widget>[
            new Container(
              width: 70,
              child: Image.network('${details.thumbnailUrl}', fit: BoxFit.fill),
            ),
            new Expanded(
                child: new Column(
                  children: <Widget>[
                    new Divider(
                      height: 5,
                      color: Colors.transparent,
                    ),
                    new Row(
                      children: [
                        new Padding(padding: EdgeInsets.only(right: 10)),
                        new Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5.0, right: 5.0, top: 5.0),
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
                                padding: EdgeInsets.only(
                                    left: 5.0, right: 5.0, top: 5.0),
                                child: Text(
                                  'AlbumId : ${details.albumId}  ||  PhotoId : ${details.id}',
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
                ))
          ],
        ),
      ),
    );
  }

   getPagination()  {
    if (myPhoto.length > 9) {
      int indexPage = 1;
      for (PhotoModel data3 in widget.myPhotoAll) {
        if (myPhoto.length == indexPage && myPhoto.length < pageCount * 10) {
          myPhoto.add(data3);
        }
        indexPage += 1;
      }
      pageCount += 1;
    } else {
      for (PhotoModel data3 in widget.myPhotoAll) {
        if (myPhoto.length < 11) {
          myPhoto.add(data3);
        }
      }
    }
  }
}