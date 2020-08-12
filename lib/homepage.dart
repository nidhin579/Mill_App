import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'items.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget listedItem(String item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.white.withOpacity(0.5),
        child: Center(
            child: Text(
          item,
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.refresh,
          ),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mill',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60),
                      ),
                      Text(
                        'App',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          colors: [
                            Color.fromRGBO(101, 93, 176, 1),
                            Color.fromRGBO(101, 93, 176, 1)
                          ]),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                ),
              ),
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color:
                                            Color.fromRGBO(232, 247, 252, 1)),
                                  ),
                                  Center(
                                    child: FlatButton(
                                      onPressed: () {},
                                      color: Colors.amber,
                                      child: Text(
                                        'BOOK NOW',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Available Items',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    for (var item in items) listedItem(item)
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromRGBO(232, 247, 252, 1)),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.3)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.amber,
                        child: Text(
                          'View Details',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
