import "package:flutter/material.dart";
import 'main.dart';

class Cipher extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CipherPage(),
    );
  }
}

class CipherPage extends StatefulWidget {
  @override 
  CipherState createState() => CipherState();
}

class CipherState extends State<CipherPage> {
  var pageIndex = 0;
  var dic = {'a':'q', 'b':'r', 'c':'s', 'd':'t', 'e':'u', 'f':'v', 'g':'w', 'h':'x', 'i':'y', 'j':'z', 'k':'a'
  , 'l':'b', 'm':'c', 'n':'d', 'o':'e', 'p':'f', 'q':'g', 'r':'h', 's':'i', 't':'j', 'u':'k', 'v':'l', 'w':'m',
   'x':'n', 'y':'o', 'z':'p'};
  var text = "Not yet";
  var count = 0;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints( 
                minHeight: 80,
              ),
              child: Container( 
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.orange, Colors.pink],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 1), 
                    )
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "$text",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 280,
              child: TextField(
                onChanged: changeText,
                decoration: InputDecoration(
                    hintText: "Cipher",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.pink[300],
                          width: 3,
                      )
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.pink,
                          width: 4,
                      )
                    )
                ),
                
              ),
            )
          ],
        )
      ),
    );
  }
}
