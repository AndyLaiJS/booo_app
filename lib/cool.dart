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
    " ",
    " ",
    "Happy",
    "Excited",
    "Joy",
    "Cute",
    "Beautiful",
    "Wonderous",
  ];

  var eword = [
    "",
    "",
    "开心😄",
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
          SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: vword.length,
              itemBuilder: (context, int index) {
                bool exp = false;
                if (index == 2) 
                  exp = true;
                else  
                  exp = false;
                
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 40, bottom: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "I'm Hungry",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                    ),
                  );
                } else if (index == 1) {
                  return Container(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: word.length,
                      itemBuilder: (BuildContext context, int index) {
                        double marg = 0;
                        if (index == word.length - 1) marg = 40;
                        return Container(
                          margin: EdgeInsets.fromLTRB(40, 25, marg, 20),
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
                  );
                }
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ExpansionTile(
                    initiallyExpanded: exp,
                    title: Text(
                      "${vword[index]}",
                      style: TextStyle(
                        fontSize: 20,
                      )
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${eword[index]}",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                    ],
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
