import "package:flutter/material.dart";
import "dart:math";
import 'package:gradient_app_bar/gradient_app_bar.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override 
  PageState createState() => PageState();
}

class PageState extends State<MainPage> {
  var dic = {'a':'q', 'b':'r', 'c':'s', 'd':'t', 'e':'u', 'f':'v', 'g':'w', 'h':'x', 'i':'y', 'j':'z', 'k':'a'
  , 'l':'b', 'm':'c', 'n':'d', 'o':'e', 'p':'f', 'q':'g', 'r':'h', 's':'i', 't':'j', 'u':'k', 'v':'l', 'w':'m',
   'x':'n', 'y':'o', 'z':'p'};
  var text = "Not yet";

  void changeText(var str) {
    setState(() {
      text = "";
      for (int i=0; i< str.length ; i++){
        if (str[i] == " ") {
          text += " ";
        }
        else if(str[i] == str[i].toLowerCase()){
          text += dic[str[i]];
        }
        else {
           text += dic[str[i].toLowerCase()].toUpperCase();
        }
      }
    });
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: GradientAppBar( 
        backgroundColorStart: Colors.pink,
        backgroundColorEnd: Colors.orange,
        centerTitle: true,
        title: Text(
          "ENCRYPTED TEXT"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 80,
                maxWidth: 250,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.orange, Colors.pink],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "$text",
                      style: TextStyle( 
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50,20,50,0),
                child: TextField(
                  onChanged: changeText,
                  decoration: InputDecoration(
                    hintText: "Yo Wise type something here and click enter",  // this is new, I made this change and now you can see it too
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200),
                      borderSide: BorderSide(
                        color: Colors.pink,
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
          ],
        ),
      )
    );
  }
}
