import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';


class SenderDetail extends StatefulWidget {
  @override
  _SenderDetailPageState createState() => _SenderDetailPageState();
}

class _SenderDetailPageState extends State<SenderDetail> {
  TextEditingController namaPengirimController = new TextEditingController();
  final alamatPengirimController = TextEditingController();
  final beratController = TextEditingController();
  final deskripsiController = TextEditingController();
  final namaPenerimaController = TextEditingController();
  final alamatPenerimaController = TextEditingController();
  final kodePosController = TextEditingController();
  final noTelpPenerima = TextEditingController();
 

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    namaPengirimController.dispose();
    super.dispose();
  }

  //function datetime picker
  DateTime selectedDate = DateTime.now();
 

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyB2NxIbwMNyqRfNfo_VMlxLWs_-s1e8sdE")));

    // Handle the result in your way
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    //condition harga asuransi

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Alamat Baru"),
      ),
      body: Container(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 3, right: 3),
          children: <Widget>[
            //label isi formulir
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Silahkan Isi Formulir dengan lengkap',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),

            Container(
                //textfield nama pengirim
                height: 40,
                child: TextFormField(
                  controller: namaPengirimController,
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                )),
            
            Container(
              height: 40,
              //alamat pengirim
              child: TextFormField(
                  controller: alamatPengirimController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    hintText: "Nomor Handphone",
                    labelText: "No. Handphone",
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  )),
            ),
            SizedBox(height: 8,),
             Card(
                    //color: Colors.blue[50],
                     child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Provinsi"),
                      
                      onTap: () {},
                    ),
                  ),
                 Card(
                     child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Kabupaten"), onTap: () {},
                    ),
                  ), 
           Card(
                     child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("Kecamatan"),
                      onTap: () {},
                    ),
                  ),
              Card(
                     child: ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // ignore: unnecessary_brace_in_string_interps
                      title: Text("kode Pos"),
                      onTap: () {},
                    ),
                  ),
            RaisedButton.icon(
              //tombol pick location
              onPressed: () {
                showPlacePicker();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              label: Text(
                'Pilih lokasi akurat',
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              textColor: Colors.black,
              splashColor: Colors.red,
              color: Colors.white,
            ),
           

            RaisedButton(
              //tombol order
              child: Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: () {
               
               
              },
            ),
          ],
        ),
      ),
    );
  }
}

