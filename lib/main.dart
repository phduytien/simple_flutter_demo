import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  String username = "Flutter";
  bool alreadySubmitted = false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _renewUsername() {
    setState(() {
        widget.alreadySubmitted = false;
    });
  }

  void _submitUsername() {
    setState(() {
        widget.alreadySubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final String welcome = !widget.alreadySubmitted ?
    "Welcome to ${widget.username}!" :
    "Hello ${widget.username}!";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                welcome,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)
            ),
            if (!widget.alreadySubmitted) Container(
              padding: EdgeInsets.only(top: 24.0, left: 36.0, right: 36.0, bottom: 24.0),
              child: TextField(
                onChanged: (text) {
                  widget.username = text;
                },
                decoration: InputDecoration(
                    hintText: 'Please enter your name'
                ),
              )
            ),
            if (!widget.alreadySubmitted) RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _submitUsername,
              child: Text("Submit"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _renewUsername,
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
