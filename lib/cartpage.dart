import 'package:flutter/material.dart';

import 'items.dart';

class CartPage extends StatefulWidget {
  static const String id = "CartPage";
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController _controller1;
  TextEditingController _controller2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: Text("PROCEED TO BOOK")),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      errorText: (_controller1.text.isEmpty)
                          ? 'It cant be empty'
                          : null,
                      labelText: 'Enter Name',
                    ),
                  ),
                  TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                      errorText: (isIt2) ? 'It cant be empty' : null,
                      labelText: 'Enter Mobile No.',
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
                child: new Text("Book now"),
                onPressed: () {
                  if (_controller2.text.isEmpty) {
                    isIt2 = true;
                  }
                }),
          ],
        );
      },
    );
  }

  Widget listedItem(String item, String item2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.white.withOpacity(0.5),
        child: Center(
            child: Text(
          item + ' : ' + item2 + ' Kg',
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
                    Text(
                      'CART',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.10),
                      child: Column(
                        children: [
                          for (var item in cart) listedItem(item[0], item[1]),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _showDialog();
                      },
                      color: Colors.amber,
                      child: Text(
                        'PROCEED TO BOOK',
                        style: TextStyle(color: Colors.white),
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
