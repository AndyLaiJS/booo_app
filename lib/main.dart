import "package:flutter/material.dart";
import "dart:math";
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'chatBot.dart';
import 'line.dart';
import 'decipher.dart';
import 'cipher.dart';
import 'note.dart';
import 'cool.dart';

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
  var pageIndex = 0;
  var dic = {'a':'q', 'b':'r', 'c':'s', 'd':'t', 'e':'u', 'f':'v', 'g':'w', 'h':'x', 'i':'y', 'j':'z', 'k':'a'
  , 'l':'b', 'm':'c', 'n':'d', 'o':'e', 'p':'f', 'q':'g', 'r':'h', 's':'i', 't':'j', 'u':'k', 'v':'l', 'w':'m',
   'x':'n', 'y':'o', 'z':'p'};
  var text = "Not yet";
  var count = 0;

  var List = [
    Cipher(),
    Decipher(),
    Temp(),
    Dash(),
  ];

  void decipher(var str) {
    setState(() {
      text = "";
      count = 0;
      for (int i=0; i<str.length; i++) {
        dic.forEach((key, value) {
          if (str[i] == " ") {
            text += " ";
          } else if(str[i] == str[i].toLowerCase()) {
            if (str[i] == value) {
              text += key;
            }
          } else {
            if (str[i].toLowerCase() == value) {
              text += key.toUpperCase();
            }
          }
        });
      }
    });
  }
  
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
          "Sam"
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget> [
            Container(
              height: 150,
              child: DrawerHeader(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Yoooo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            ListTile(
              title: Text("Never"),
            ),
            ListTile(
              title: Text("Settle"),
            ),
            ListTile(
              title: Text("Don't buy"),
            ),
            ListTile(
              title: Text("Chinese phones"),
            ),
          ],
        ),
      ),
      body: List[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        fixedColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            title: Text("Cipher"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open),
            title: Text("Decipher")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text("Note")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text("Note")
          ),
        ]
        // child: Container(
        //   height: 70,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       IconButton(
        //         color: Colors.pink,
        //         icon: Icon(Icons.lock),
        //         onPressed: () => {}
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.lock_open),
        //         onPressed: () => Navigator.push(context, new MaterialPageRoute(
        //           builder: (context) => new Decipher()
        //           )
        //         ),
        //       )
        //     ],
        //   ),
        // )
      ),
    );
  }
}
