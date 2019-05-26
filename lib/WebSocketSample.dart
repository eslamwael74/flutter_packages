import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');

class MyApp extends StatelessWidget {
  final title = 'Socket';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title, channel: channel),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final IOWebSocketChannel channel;

  MyHomePage({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                child: TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'Send a message'),
            )),
            StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMsg,
        tooltip: 'Send Message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMsg() {
    if (_textEditingController.text.isNotEmpty) {
      widget.channel.sink.add(_textEditingController.text.toString());
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
