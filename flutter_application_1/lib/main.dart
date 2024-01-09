import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Name App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home:  MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body:Column(
        children: [
          const Text('A random AWESOME idea'),
          Text(appState.current.asUpperCase),
          ElevatedButton(
              onPressed: () {
                print('button pressed!');
              },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}

