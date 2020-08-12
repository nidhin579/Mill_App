import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mill_app/detailspage.dart';
import 'package:mill_app/items.dart';

class Home extends StatefulWidget {
  static const String id = "Home";
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
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item,
              style: TextStyle(fontSize: 25),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () {
                  for (int i = 0; i < items.length; i++) {
                    if (items[i][0] == item) {
                      selection = i;
                    }
                  }
                  Navigator.pushNamed(context, DetailPage.id);
                },
                color: Colors.amber,
                child: Text(
                  'View Details',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(
            Icons.shopping_cart,
          ),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'violet',
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                colors: [
                                  Color.fromRGBO(101, 93, 176, 1),
                                  Color.fromRGBO(101, 93, 176, 1)
                                ]),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30))),
                      ),
                      Center(
                        child: Container(
                          height: 70,
                          child: Image.asset(
                            'images/log.jpg',
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                    for (var item in items) listedItem(item[0])
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
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
