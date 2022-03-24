import 'package:flutter/material.dart';
import 'package:insta/pages/root_app.dart';
import 'package:provider/provider.dart';
import 'package:insta/Model/network.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => NetworkHelper(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootApp(),
      ),
    );
  }
}


