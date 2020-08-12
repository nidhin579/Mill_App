import 'package:flutter/material.dart';
import 'package:mill_app/homepage.dart';

class FirstPage extends StatefulWidget {
  static const String id = 'FirstPage';
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Home.id);
          },
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.play_arrow,
            size: 50,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
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
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
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
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          )
        ],
      ),
    );
  }
}
