import 'package:flutter/material.dart';
import 'package:place_picker/place_picker.dart';


class DetailBarang extends StatefulWidget {
  @override
  _DetailBarangPageState createState() => _DetailBarangPageState();
}

class _DetailBarangPageState extends State<DetailBarang> {
  
  String dropJenis = 'Dokumen';
  String dropAsuransi = 'Tidak';
  

  

  final _formKey = GlobalKey<FormState>();
  

  //function datetime picker
  DateTime selectedDate = DateTime.now();
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

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

   

    List<String> _jenisbarang = ['Dokumen', 'Barang Pecah', 'Pakaian'];
    List<String> _asuransi = ['Ya', 'Tidak'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Detail Barang"),
      ),
      body: Container(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          children: <Widget>[
            //label isi formulir
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Silahkan Isi Detail Barang',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),

          
            // Container(
            //   //tanggal penjemputan
            //   height: 60,
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       top: 0.0,
            //     ),
            //     child: Row(
            //       children: <Widget>[
            //         Container(
            //           width: 150,
            //           child: Expanded(
            //             child: RaisedButton.icon(
            //               onPressed: () => _selectDate(context),
            //               label: Text('Pilih Tanggal'),
            //               icon: Icon(Icons.calendar_today),
            //               shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(30.0),
                          
            //               ),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           width: 15,
            //         ),
            //         Container(
            //             width: 165,
            //             child: Expanded(
            //               child: Container(
            //                 // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            //                 child:
            //                     Text("${selectedDate.toLocal()}".split(' ')[0]),
            //               ),
            //             ))
            //       ],
            //     ),
            //   ),
            // ),

            
            Container(
              //berat paket dan kubikasi
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5.0,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      child: Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Berat paket',
                              hintText: 'Berat (kg)',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(
                        width: 165,
                        child: Expanded(
                          child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  labelText: 'Kubikasi Barang',
                                  hintText: 'M3',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0))),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              //jenis barang
              padding: EdgeInsets.only(left: 8.0),
              child: DropdownButton<String>(
                value: dropJenis,
                items:
                    _jenisbarang.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String data) {
                  setState(() {
                    dropJenis = data;
                  });
                },
              ),
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: "Deskripsi Barang",
                  labelText: "Deskripsi Barang",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                )),
            SizedBox(height: 5.0),
            
            Container(
              //asuransi
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5.0,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 190,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Pakai Asuransi ?',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Container(
                        width: 80,
                        child: Expanded(
                          child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: DropdownButton<String>(
                              value: dropAsuransi,
                              items: _asuransi.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String data) {
                                setState(() {
                                  dropAsuransi = data;
                                });
                              },
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            //             SwitchListTile(
            //   title: const Text('Asuransi ?'),
            //   value: _lights,
            //   onChanged: (bool value) {
            //     setState(() {
            //       _lights = value;
            //     });
            //   },
            //   secondary: const Icon(Icons.security),
            // ),

            RaisedButton(
              //tombol order
              child: Text(
                "Order",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
 
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