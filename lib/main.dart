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
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50,0,50,0),
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
            SizedBox(
              height: 20,     //SizeBox is essentially identical to Container
            ),
            Text(
              "$text",
              style: TextStyle( 
                fontSize: 20,
              ),
            ),
          ],
        ),
      )
    );
  }
}
