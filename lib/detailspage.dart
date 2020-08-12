import 'package:flutter/material.dart';

import 'items.dart';

class DetailPage extends StatefulWidget {
  static const String id = "DetailPage";
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(child: Text("ADD TO CART")),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Product :$product',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      errorText: (isIt) ? 'There isnt much' : null,
                      labelText: 'Amount needed',
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
                child: new Text("Add to cart"),
                onPressed: () {
                  if (int.parse(_controller.text) <= int.parse(quantity)) {
                    cart.add(['', '']);
                    isIt = false;
                    cart[noitem][0] = product;
                    cart[noitem][1] = _controller.text;
                    noitem++;
                    setState(() {
                      items[selection][1] = (int.parse(items[selection][1]) -
                              int.parse(_controller.text))
                          .toString();
                    });
                    Navigator.of(context).pop('return this');
                    Navigator.pop(context);
                  } else if (_controller.text.isEmpty) {
                    isIt = true;
                  } else {
                    setState(() {
                      isIt = true;
                    });
                  }
                }),
          ],
        );
      },
    );
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

  var product = items[selection][0];
  var quantity = items[selection][1];
  var price = items[selection][2];
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
                        children: [
                          listedItem('Product : $product'),
                          listedItem(
                            'Available amount : $quantity',
                          ),
                          listedItem(
                            'Price : $price',
                          ),
                          FlatButton(
                            onPressed: () {
                              _showDialog();
                            },
                            color: Colors.amber,
                            child: Text(
                              'ADD TO CART',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
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
