import "package:flutter/material.dart";
import "dart:math";

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primarySwatch: Colors.pink,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override 
  PageState createState() => PageState();
}

class PageState extends State<MainPage> {

  var text = "Not yet";

  void changeText(var str) {
    setState(() {
      text = str;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        centerTitle: true,
        title: Text(
          "Andy's Canvas"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: TextField(
                onSubmitted: changeText,
              )
            ),
            SizedBox(
              height: 20,     //SizeBox is essentially identical to Container
            ),
            Text("$text"),
          ],
        ),
      )
    );
  }
}
