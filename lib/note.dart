import "package:flutter/material.dart";
import 'main.dart';

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotePage(),
    );
  }
}

class NotePage extends StatefulWidget {
  @override
  NoteState createState() => NoteState();
}

class NoteState extends State<NotePage> {
  ScrollController _scrollController = new ScrollController();

  List<Color> entries = [
    Colors.pink,
    Colors.orange,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.tealAccent,
    Colors.blueAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value) {},
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Input something",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink[300],
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 4,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: entries[index],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: ListTile(
                          leading: Icon(Icons.store, color: Colors.white),
                          title: Text(
                            "Baby Porridge",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              Text(
                                "Banana",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                " Flavour",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.tealAccent[100],
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        // child: ExpansionTile(
                        //   title: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       "Baby Porridge",
                        //       style: TextStyle(
                        //         fontSize: 25,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        //   children: <Widget>[
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 16),
                        //       child: Align(
                        //         alignment: Alignment.centerLeft,
                        //         child: Text(
                        //           "Banana Flavour",
                        //           style: TextStyle(
                        //             fontSize: 16,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                      ),
                    ),
                  );
                },
              ),
            ),

            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Wrap (
            //       runSpacing: 20,
            //       children: <Widget>[
            //         Container(
            //           height: 100,
            //           color: Colors.pink,
            //         ),
            //         Container(
            //           height: 100,
            //           color: Colors.orange
            //         ),
            //         Container(
            //           height: 100,
            //           color: Colors.purpleAccent
            //         ),
            //         Container(
            //           height: 100,
            //           color: Colors.pinkAccent
            //         ),
            //         Container(
            //           height: 100,
            //           color: Colors.tealAccent
            //         ),
            //         Container(
            //           height: 100,
            //           color: Colors.blueAccent
            //         ),
            //       ],
            //     ),
            //   )
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            entries.add(Colors.amberAccent);
            _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut);
          });
        },
      ),
    );
  }
}
