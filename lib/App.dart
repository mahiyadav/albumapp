import 'package:flutter/material.dart';
import 'Album/Album.dart';
import 'Splash.dart';
import 'package:provider/provider.dart';
import 'ViewModel/Album_list_model.dart';

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => AlbumListViewModel(),
          child: Album(),
        ),
      ),
    );
  }
}

/// Splash Screen Widget
class AppSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
