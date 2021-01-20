import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'global_variables.dart' as globals;

class Homepage extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<Homepage> {
  String _data = "";
  bool sessionStarted = false;
  int poleId = Random().nextInt(1000);
  String docRef = "";
  bool _isButtonDisabled = false;
  String hasStation = "";

  var docs;
  List<String> date = ["\n-\n", "\n-\n", "\n-\n"];
  List<String> location = ["\n-\n", "\n-\n", "\n-\n"];
  List<String> timeCharged = ["\n-\n", "\n-\n", "\n-\n"];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double heigth =
        MediaQuery.of(context).size.height/3.7;
    double colWidth =
        MediaQuery.of(context).size.width/9.7;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: new AppBar(
          title: Text('Home', style: Theme.of(context).textTheme.bodyText1),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Theme.of(context).primaryColor,
                      Theme.of(context).buttonColor
                    ]
                )
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
            child: Form(
                child: Column(children: <Widget>[
          SizedBox(height: 5),
          Text('EzCharge',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center),

          Text(hasStation + globals.chargingStation,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center),

          Text('Recente laad sessies',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center),
          ConstrainedBox(
            constraints: BoxConstraints.expand(
                width: MediaQuery.of(context).size.width,
                height: heigth),
            child: DataTable(
              showBottomBorder: true,
              dividerThickness: 0,
              columnSpacing: colWidth,
              columns: <DataColumn>[
                DataColumn(
                  label: Text('\nDatum\n',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                DataColumn(
                  label: Text('\nLocatie\n',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                DataColumn(
                  label: Text('\nTijd geladen\n',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ],
              rows: List<DataRow>.generate(
                3,
                (index) => DataRow(
                    color: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (index % 2 == 0) return Colors.grey.withOpacity(0.3);
                      return null;
                    }),
                    cells: [
                      DataCell(Center(
                          child: Text(
                        date[index],
                        style: Theme.of(context).textTheme.subtitle1,
                      ))),
                      DataCell(Center(
                          child: Text(
                        location[index],
                        style: Theme.of(context).textTheme.subtitle1,
                      ))),
                      DataCell(Center(
                          child: Text(
                        timeCharged[index],
                        style: Theme.of(context).textTheme.subtitle1,
                      )))
                    ]),
              ),
            ),
          ),

          SizedBox(height: 20),
          Text('Start sessie',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center),



          SizedBox(height: 90),
          (_isButtonDisabled)
              ? Text("Verifieer email om te starten",
                  style: Theme.of(context).textTheme.bodyText2)
              : Text("Gebruikt camera",
                  style: Theme.of(context).textTheme.subtitle1)
          // THIS LINE IS REQUIRED
          // FOR SOME REASON ICONS ARE NOT SEEN AS FILLING
          // MEANING THAT WHEN YOU PUT THE PHONE SIDEWAYS
          // IT WONT SCROLL ALL THE WAY DOWN WITHOUT THIS.
        ]))));
  }
}
