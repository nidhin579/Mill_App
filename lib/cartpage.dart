import 'package:flutter/material.dart';

import 'items.dart';

class CartPage extends StatefulWidget {
  static const String id = "CartPage";
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
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
                      height: 30,
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
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.10),
                      child: Column(
                        children: [for (var item in cart) listedItem(item[0])],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.amber,
                      child: Text(
                        'BACK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(232, 247, 252, 1)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
