import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final appTitle = 'NavDrawer';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  String homeItem = "..*...*..";

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {}

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Text(widget.homeItem,
          style: TextStyle(fontSize: 50.30 ),
          ),
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("EslamWael"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            )
          ],
        )));
  }
}
