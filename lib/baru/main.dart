import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/baru/Activity.dart';
//import 'package:flutterfirebaseauth/baru/halaman.dart';
import 'package:flutterfirebaseauth/baru/home.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutterfirebaseauth/baru/payment.dart';
import 'package:flutterfirebaseauth/baru/profile.dart';
//import 'package:flutterfirebaseauth/chat/views/chat.dart';
import 'package:flutterfirebaseauth/chat/views/chatrooms.dart';
import 'package:flutterfirebaseauth/constant.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Tab Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Nested Tab Bar Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  final _widgetOptions = [Home(),Activity(), Payment(), ChatRoom(), ProfilePage()];
  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: FFNavigationBar(
            theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: Colors.blue,
              selectedItemBackgroundColor: Eazy.primary,
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Colors.black,
            ),
            selectedIndex: _selectedIndex,
            onSelectTab: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData: Icons.explore,
                label: 'Home',
              ),
              FFNavigationBarItem(
                iconData: Icons.receipt_long,
                label: 'Activity',   
            ),
              
              FFNavigationBarItem(
                iconData: Icons.account_balance_wallet,
                label: 'Wallet',
              ),
              FFNavigationBarItem(
                iconData: Icons.textsms,
                label: 'Messages',
              ),
              FFNavigationBarItem(
                iconData: Icons.account_circle,
                label: 'account',
              ),
            ],
          ),
        ));
  }
}
