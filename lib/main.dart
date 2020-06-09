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
          "A very SUPER Wise Canvas"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100,0,100,0),
                child: TextField(
                  onSubmitted: changeText,
                  decoration: InputDecoration(
                    hintText: "Yo Wise type something here and click enter",  // this is new, I made this change and now you can see it too
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200),
                      borderSide: BorderSide(
                        color: Colors.pink[300],
                        width: 3,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200),
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 4,
                      )
                    )
                  ),
                ),
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
