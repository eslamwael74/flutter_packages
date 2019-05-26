import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Package Fonts',
      theme: ThemeData(fontFamily: 'BalooBhai'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar uses the app-default Raleway font.
      appBar: AppBar(title: Text('Package Fonts')),
      body: Center(
        // This Text Widget uses the RobotoMono font.
        child: Text(
          'Using the Raleway font from the awesome_package',
          style: TextStyle(
            fontFamily: 'BalooBhai'
          ),
        ),
      ),
    );
  }
}
