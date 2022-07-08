import 'dart:html';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: "Hola a todos",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hola a todos"),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{}; // NEW
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final index = 1;
    if (index >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }

    final alreadySaved = _saved.contains(_suggestions[index]); // NEW
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    return ListTile(
      title: Text(
        _suggestions[index].asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        // NEW from here ...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      ), // to here.
    );
  }
}
