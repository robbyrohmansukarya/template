import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/baru/sender_detail.dart';


class SenderRecent extends StatefulWidget {
  @override
  _SenderRecentPageState createState() => _SenderRecentPageState();
}

class _SenderRecentPageState extends State<SenderRecent>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Sender'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              
            },
            child: Text("Ubah")
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
          key: _formKey,
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 4),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Card(
                   child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      leading: Icon(Icons.place),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Robby Rohman [Rumah]"),
                      // ignore: unnecessary_brace_in_string_interps
                      subtitle: Text("(+62)89627397841,Kp.Rambutan RT.01 RW.05 Desa Maju jaya Kecamatan Cipatat KAB. BANDUNG BARAT JAWA BARAT (40554)"),

                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Card(
                    color: Colors.blue[50],
                    child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      leading: Icon(Icons.place),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Robby Rohman [Kantor]"),
                      // ignore: unnecessary_brace_in_string_interps
                      subtitle: Text("(+62)89627397841, JL. Lembah Sukaresmi III No.32 Desa Cipedes Kec.Sukajadi KOTA BANDUNG JAWA BARAT (40162)"),
                      
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Card(
                    color: Colors.blue[50],
                     child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      leading: Icon(Icons.place),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Robby Rohman [Lainnya]"),
                      // ignore: unnecessary_brace_in_string_interps
                      subtitle: Text("(+62)89627397841, JL. Duren Matang No.90 KOTA BANDUNG JAWA BARAT (40162)"),
                      
                      onTap: () {},
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Card(
                    color: Colors.blue[50],
                     child: ListTile(
                      trailing: Icon(Icons.add),
                      leading: Icon(Icons.place),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Tambahkan Alamat Baru"),
                      // ignore: unnecessary_brace_in_string_interps
                      //subtitle: Text("(+62)89627397841, JL. Duren Matang No.90 KOTA BANDUNG JAWA BARAT (40162)"),
                      
                      onTap: () {
                         Navigator.push(
              context,
                MaterialPageRoute(
                    builder: (context) =>
                      SenderDetail()));
                      },
                    ),
                  ),
                ),
              ])),
    );
  }
}
