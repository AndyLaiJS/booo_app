import 'package:flutter/material.dart';

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashPage(),
    );
  }
}

class DashPage extends StatefulWidget {
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  var word = [
    "So",
    "What",
    "Should",
    "I",
    "Do",
    "Now",
  ];

  List<Color> color = [
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.tealAccent,
  ];

  var vword = [
    "Happy",
    "Excited",
    "Joy",
    "Cute",
    "Beautiful",
    "Wonderous",
  ];

  var eword = [
    "Be Happy",
    "Adrenaline",
    "Smile",
    "Adorable",
    "Gorgeous",
    "Magnificent",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Yo"),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: word.length,
              itemBuilder: (BuildContext context, int index) {
                double marg = 0;
                if (index == word.length - 1) marg = 40;
                return Container(
                  margin: EdgeInsets.fromLTRB(40, 40, marg, 40),
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "${word[index]}",
                      style: TextStyle(
                        color: color[index],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: word.length,
              itemBuilder: (context, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: ExpansionTile(
                    title: Text(
                      "${vword[index]}",
                    ),
                    children: <Widget>[],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
