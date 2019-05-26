import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // Provide a function to handle named routes. Use this function to
      // identify the named route being pushed and create the correct
      // Screen.
      onGenerateRoute: (routeSettings) {
        // If you push the PassArguments route
        if (routeSettings.name == PassArgsScreen.routeName) {
          // Cast the arguments to the correct type: ScreenArguments.
          final ScreenArguments args = routeSettings.arguments;

          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return MaterialPageRoute(builder: (context) {
            return PassArgsScreen(
              title: args.title,
              message: args.message,
            );
          });
        }
      },
      title: 'Navigation With AArguments!',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A button that navigates to a named route that. The named route
            // extracts the arguments by itself.
            RaisedButton(
                child: Text('Navigate to screen that extracts arguments'),
                onPressed: () {
                  // When the user taps the button, navigate to the specific route
                  // and provide the arguments as part of the RouteSettings.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExtractArgsScreen(),
                          // Pass the arguments as part of the RouteSettings. The
                          // ExtractArgumentScreen reads the arguments from these
                          // settings.
                          settings: RouteSettings(
                              arguments: ScreenArguments(
                                  'Extract Arguments Screen',
                                  'This message is extracted in the build method.'))));
                }),
            // A button that navigates to a named route. For this route, extract
            // the arguments in the onGenerateRoute function and pass them
            // to the screen.
            RaisedButton(
                child: Text('Navigate to a named that accepts arguments'),
                onPressed: () {
                  // When the user taps the button, navigate to a named route
                  // and provide the arguments as an optional parameter.
                  Navigator.pushNamed(context, PassArgsScreen.routeName,
                      arguments: ScreenArguments(
                        'Accept Arguments Screen',
                        'This message is extracted in the onGenerateRoute function.',
                      ));
                })
          ],
        ),
      ),
    );
  }
}

// A Widget that accepts the necessary arguments via the constructor *Not.
class PassArgsScreen extends StatelessWidget {
  static const routeName = 'passArgs';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  PassArgsScreen({Key key, @required this.title, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

// A Widget that extracts the necessary arguments from the ModalRoute.
class ExtractArgsScreen extends StatelessWidget {
  static const routeName = '/extractArgs';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(args.title)),
      body: Center(child: Text(args.message)),
    );
  }
}

// You can pass any object to the arguments parameter. In this example, create a
// class that contains both a customizable title and message.
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
