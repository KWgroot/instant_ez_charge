import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'invoices.dart';
import 'settings.dart';

/// This is the stateful widget that the main application instantiates.
class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}
/// instant app
/// This is the private State class that goes with the AppPage class.
class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Homepage(), Invoices(), Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Not available',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Not available',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}