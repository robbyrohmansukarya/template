import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/baru/dalamkota.dart';
import 'package:flutterfirebaseauth/baru/history.dart';

class Express extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Express>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
          controller: controller, children: <Widget>[DalamKota(), History()]),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Delivery',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
            controller: controller,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: <Tab>[
              Tab(
                  //text: 'Box',
                  text: 'Within City'),
              Tab(
                  //text: 'Container',
                  text: 'National Wide'),
            ]),
      ),
    );
  }
}
