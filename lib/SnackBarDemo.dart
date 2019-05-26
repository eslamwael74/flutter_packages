import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackbar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnacBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(onPressed: () {
        final snackBar = SnackBar(
          content: Text('Yay! A Snackbar!'),
          action: SnackBarAction(label: 'Undo!', onPressed: () {}),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },child: Text('Show SnackBar! :D')),
    );
  }
}
