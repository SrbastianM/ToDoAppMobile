// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:english_words/english_words.dart';

class RandomWorlds extends StatefulWidget {
  @override
  RandomWorldState createState() => RandomWorldState();
}

class RandomWorldState extends State<RandomWorlds> {
  final _randomWorldPair = <WordPair>[];

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();

          final index = item ~/ 2;

          if (index >= _randomWorldPair.length) {
            _randomWorldPair.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_randomWorldPair[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 15.0),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
      ),
      body: _buildList(),
    );
  }
}
