import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expenses'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container(width:double.infinity,
            color:Colors.orange,
            height: 100,
              child: Text('CHART'),
            ),
            elevation: 5,
          ),
          Card(
            child: Text('List of Transactions...'),
          )
        ],
      ),
    );
  }
}
