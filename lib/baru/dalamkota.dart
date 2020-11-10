import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/baru/barang_detail.dart';
import 'package:flutterfirebaseauth/baru/receiver_detail.dart';
import 'package:flutterfirebaseauth/baru/sender_recent.dart';
import 'package:flutterfirebaseauth/constant.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DalamKota extends StatefulWidget {
  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<DalamKota>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Eazy.primary,
      ),
      body: SlidingUpPanel(
        maxHeight: 190,
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: Container(
            key: _formKey,
            child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Card(
                        color: Colors.blue[50],
                      child: ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          leading: Icon(Icons.my_location),
          // ignore: unnecessary_brace_in_string_interps
          title: Text("Identitas Pengirim" ),
          // ignore: unnecessary_brace_in_string_interps
          subtitle: Text("Isi Formulir pengirim"),
          onTap: () {
             Navigator.push(
              context,
                MaterialPageRoute(
                    builder: (context) =>
                      SenderRecent()));
          },
        ),),),
                  Container(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0,),
                      child: Card(
                        color: Colors.blue[50],
                      child: ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          leading: Icon(Icons.place),
          // ignore: unnecessary_brace_in_string_interps
          title: Text("Identitas Penerima"),
          // ignore: unnecessary_brace_in_string_interps
          subtitle: Text("Isi Formulir penerima"),
          onTap: () {
             Navigator.push(
              context,
                MaterialPageRoute(
                    builder: (context) =>
                      ReceiverDetail()));
          },
        ),),),
        Container(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, ),
                      child: Card(
                        color: Colors.blue[50],
                      child: ListTile(
          trailing: Icon(Icons.keyboard_arrow_right),
          leading: Icon(Icons.all_inbox),
          // ignore: unnecessary_brace_in_string_interps
          title: Text("Detail Barang" ),
          // ignore: unnecessary_brace_in_string_interps
          subtitle: Text("Isi Keterangan barang"),
          onTap: () {
             Navigator.push(
              context,
                MaterialPageRoute(
                    builder: (context) =>
                      DetailBarang()));
          },
        ),),),
                ])),
      ),
    );
  }

  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.only(top: 0.0,bottom: 0.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            trailing: Text("Rp. 15.000"),
            leading: Icon(Icons.payment),
            title: Text("Total Biaya"), 
          ),
          Container(
            width: 170,
          child: RaisedButton(
              //tombol order
              child: Text(
                "Bayar",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20.0),),
              color: Eazy.primary,
              onPressed: () {
               
               
              },
            ),),
         ]
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.only(top:24.0),
      
        child: Card(
          color: Colors.blue[50],
          child: ListTile(
            trailing: Icon(Icons.keyboard_arrow_down),
            leading: Icon(Icons.local_shipping),
            title: Text("Bandung ke Jakarta"),
            subtitle: Text("Rp.100.000,-"),
          ),
        ),
       
    );
  }
}
