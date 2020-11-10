import 'package:flutter/material.dart';


class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Card( 
                  color: Colors.red[50],
                  child: ListTile(
                  trailing: Text("Waiting"),
                  leading: Icon(Icons.timelapse,color: Colors.red,),
                  title: Text("00001"),
                  subtitle: Text("Jl. ABCD JAKARTA SELATAN"),
          ),
              ),
              Card( 
                  color: Colors.green[50],
                  child: ListTile(
                  trailing: Text("Delivered"),
                  leading: Icon(Icons.local_shipping),
                  title: Text("0002"),
                  subtitle: Text("Jl. EFGH Surabaya Jawa Timur"),
          ),
              ),
               Card( 
                  color: Colors.yellow[50],
                  child: ListTile(
                  trailing: Text("Done"),
                  leading: Icon(Icons.check_circle,color: Colors.green),
                  title: Text("00003"),
                  subtitle: Text("Jl. ABCD Semarang Jawa Tengah"),
          ),
              ),
              Card( 
                  color: Colors.blue[50],
                  child: ListTile(
                  trailing: Text("Finish >"),
                  leading: Icon(Icons.flag,color: Colors.blue),
                  title: Text("0004"),
                  subtitle: Text("Jl. EFGH Badung Bali"),
          ),
              )
          ],
        ),
      ),
    );
  }
}