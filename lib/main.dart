import 'package:flutter/material.dart';
import 'package:game_meta_critics/get_started.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Metakritik',
      theme: ThemeData(),
      home: const GetStarted(),
    );
  }
}
