import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'asd',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Card statsWidget() {
    return new Card(
        elevation: 1.5,
        margin: EdgeInsets.only(bottom: 320, left: 20.0, right: 20.0),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(20.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "Photos",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            )),
                        new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "22k",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Color(0xff167F67),
                              ),
                            )),
                      ],
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "Followers",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            )),
                        new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "232k",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Color(0xff167F67),
                              ),
                            )),
                      ],
                    ),
                    flex: 1,
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "Following",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Colors.grey, fontSize: 16.0),
                            )),
                        new Align(
                            alignment: Alignment.center,
                            child: new Text(
                              "332k",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                color: Color(0xff167F67),
                              ),
                            )),
                      ],
                    ),
                    flex: 1,
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  build(BuildContext context) {
    return new Material(
        type: MaterialType.transparency,
        child: new Stack(
          children: [
            new Column(
              children: <Widget>[
                headerWidget(),
                bodyWidget(),
              ],
            ),
            new Center(
              child: statsWidget(),
            ),
          ],
        ));
  }

  Widget headerWidget() {
    var header = new Expanded(
      child: new Container(
        decoration: new BoxDecoration(
          color: const Color(0xff167F67),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new Container(
                margin: EdgeInsets.only(bottom: 10.0),
                height: 80.0,
                width: 80.0,
                decoration: new BoxDecoration(
                  color: const Color(0xff167F67),
                  image: new DecorationImage(
                    image: new NetworkImage(
                        "https://4.bp.blogspot.com/-QXHUYmKycZU/W-Vv9G01aAI/AAAAAAAAATg/eF1ArYpCo7Ukm1Qf-JJhwBw3rOMcj-h6wCEwYBhgL/s1600/logo.png"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(40.0)),
                ),
              ),
            ),
            new Text(
              "Developer Libs",
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
      flex: 1,
    );

    return header;
  }

  Widget bodyWidget() {
    var bodyWidget = new Expanded(
      child: new Container(
          decoration: new BoxDecoration(
            color: const Color(0xffffffff),
          ),
          child: new Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
            child: new Column(
              children: <Widget>[
                new CustomText(
                        label: "contact@developer",
                        textColor: 0xff858585,
                        iconColor: 0xff167F67,
                        fontSize: 15.0,
                        icon: Icons.email)
                    .text(),
                new CustomText(
                        label: "+919999999999",
                        textColor: 0xff858585,
                        iconColor: 0xff167F67,
                        fontSize: 15.0,
                        icon: Icons.phone)
                    .text(),
                new CustomText(
                        label: "Developer libs",
                        textColor: 0xff858585,
                        iconColor: 0xff167F67,
                        fontSize: 15.0,
                        icon: Icons.youtube_searched_for)
                    .text(),
                new CustomText(
                        label: "Google Map",
                        textColor: 0xff858585,
                        iconColor: 0xff167F67,
                        fontSize: 15.0,
                        icon: Icons.add_location)
                    .text(),
              ],
            ),
          )),
      flex: 2,
    );
    return bodyWidget;
  }
}

class CustomText {
  final String label;
  final double fontSize;
  final String fontName;
  final int textColor;
  final int iconColor;
  final TextAlign textAlign;
  final int maxLines;
  final IconData icon;

  CustomText(
      {@required this.label,
      this.fontSize = 10.0,
      this.fontName,
      this.textColor = 0xFF000000,
      this.iconColor = 0xFF000000,
      this.textAlign = TextAlign.start,
      this.maxLines = 1,
      this.icon = Icons.broken_image});

  Widget text() {
    var text = new Text(
      label,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: new TextStyle(
        color: Color(textColor),
        fontSize: fontSize,
        fontFamily: fontName,
      ),
    );

    return new Row(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: new Icon(
            icon,
            color: Color(iconColor),
          ),
        ),
        text
      ],
    );
  }
}
