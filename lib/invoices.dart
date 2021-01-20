

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Invoices extends StatefulWidget {
  @override
  invoiceScreen createState() => invoiceScreen();
}

class invoiceScreen extends State<Invoices> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Invoices', style: Theme.of(context).textTheme.bodyText1),
        // backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).buttonColor
              ])),
        ),
      ),
    );
  }
}
