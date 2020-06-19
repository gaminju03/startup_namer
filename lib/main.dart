import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// Implementar Package english_wods.dart
// Se puede implementr Cupertino con Mateerial
// StateleesWidget con StatefulWidget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {  //StatelessWidget 
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return CupertinoApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
      
    );
  }
}

class RandomWords extends StatefulWidget {  //StatefulWidget 
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> { 
@override
Widget build(BuildContext context) {
  return Material(  //implementar Material con Cupertino 
      child: CupertinoPageScaffold( 
       navigationBar: CupertinoNavigationBar(
        middle: Text('Startup Name Generator'),
      ),
      child: _buildSuggestions(),
    ),
  );
}

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
 
  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(color: Colors.blue,); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
}


Widget _buildRow(WordPair pair) {
  return ListTile(//Lista de material
    leading: Icon(CupertinoIcons.check_mark_circled_solid),
    trailing: Icon(CupertinoIcons.right_chevron),
    subtitle: Text('Subtitulo'),//Material
    //subtitle: Icon(Icons.adb),
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
}
      
    
  
