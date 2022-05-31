// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
// ignore: unused_import
import './random_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RandomWorlds());
  }
}
