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
  final _saveRandomWordPair = Set<WordPair>();

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
    final alreadySave = _saveRandomWordPair.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: const TextStyle(fontSize: 15.0),
      ),
      trailing: Icon(
        alreadySave ? Icons.favorite : Icons.favorite_border,
        color: alreadySave ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySave) {
            _saveRandomWordPair.remove(pair);
          } else {
            _saveRandomWordPair.add(pair);
          }
        });
      },
    );
  }

  void _pushSave() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<Widget> tiles = _saveRandomWordPair.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: const TextStyle(fontSize: 18.0),
          ),
        );
      });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('SaveValues'),
            backgroundColor: Colors.purple[800]),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSave,
          )
        ],
      ),
      body: _buildList(),
    );
  }
}
