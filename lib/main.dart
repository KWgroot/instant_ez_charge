import 'dart:async';
import 'app_page.dart';
import 'base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'design/design.dart';
import 'design/btn.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'EzCharge',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {


  @override
  State<StatefulWidget> createState() {
    return _InstantApp();
  }
}

class _InstantApp extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  var poleId = "";

  @override
  Widget build(BuildContext context) {
    if (poleId == "") {
      handleDynamicLinks(context);
      poleId = getChargingStation();
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    }
    return MaterialApp(
      title: 'EZCharge',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('EzCharge ', style: Theme
              .of(context)
              .textTheme
              .bodyText1),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 50.0,),
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height - MediaQuery
                .of(context)
                .padding
                .top - kToolbarHeight,
            key: formKey,
            child: Column(
              children: <Widget>[
                Text('Charge your car',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 36.0),
                    textAlign: TextAlign.center),
                Spacer(),
                Text(
                    'If you push the button below you are paying for a charging session on pole: ' +
                        poleId),
                ButtonTheme(child: buttonBottom(), minWidth: double.infinity,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class buttonBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Button(onPressed: () {
        Fluttertoast.showToast(msg: "You simulated that you have payed");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AppPage()));
      }, text: "Google Pay", tStyle: Theme.of(context).textTheme.button, color: Theme.of(context).buttonColor,),
    );
  }
}