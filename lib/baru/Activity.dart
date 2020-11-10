import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutterfirebaseauth/baru/dalamkota.dart';
//import 'package:flutterfirebaseauth/baru/history.dart';
import 'package:flutterfirebaseauth/baru/history2.dart';
import 'package:flutterfirebaseauth/baru/jadwal.dart';
import 'package:flutterfirebaseauth/constant.dart';

class Activity extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Activity>with SingleTickerProviderStateMixin {
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
      backgroundColor: Eazy.primary,
      body: TabBarView(
          controller: controller,
          children: <Widget>[
            Jadwal(),
            History2()
          ]
        ),
      
      appBar: AppBar(
        backgroundColor: Eazy.primary,
        centerTitle: true,
        title: Text('Aktifitas Saya',style: TextStyle(color: Colors.black, fontSize: 32),),
        
      bottom :TabBar(    
        controller: controller,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
        tabs: <Tab>[
        Tab(      //text: 'Box',
         text: 'Pengiriman'),
         
        Tab(
                //text: 'Container',
         text: 'Aktifitas'),
              
        ]
      ),
    ),
    );
  } 
}