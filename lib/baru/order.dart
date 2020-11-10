import 'package:flutter/material.dart';
//import 'package:flutterfirebaseauth/page/history/history.dart';
//import 'package:flutterfirebaseauth/page/history/history_delivered.dart';
//import 'package:flutterfirebaseauth/page/mapspicker.dart';
//import 'package:flutterfirebaseauth/page/tabcon.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:shortuuid/shortuuid.dart';
//import 'package:cool_alert/cool_alert.dart';
import 'package:place_picker/place_picker.dart';
import 'package:latlong/latlong.dart' as hitung;

class Order extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<Order> {
  TextEditingController namaPengirimController = new TextEditingController();
  final alamatPengirimController = TextEditingController();
  final beratController = TextEditingController();
  final deskripsiController = TextEditingController();
  final namaPenerimaController = TextEditingController();
  final alamatPenerimaController = TextEditingController();
  final kodePosController = TextEditingController();
  final noTelpPenerima = TextEditingController();
  String dropProvinsi = 'Jawa Barat';
  String dropJenis = 'Dokumen';
  String dropAsuransi = 'Tidak';
  String dropKabupaten = 'Bandung Kota';
  var lat1 = -6.914744;
  var lon1 = 107.609810;
  var lat2 = -6.200000;
  var lon2 = 106.816666;

  int asuransi = 0;
  final orderId = Uuid().v1();
  String nama;

  String total;
  static hitung.Distance distance = new hitung.Distance();
  static double km = distance.as(
      hitung.LengthUnit.Kilometer,
      new hitung.LatLng(-6.914744, 107.609810),
      new hitung.LatLng(-6.200000, 106.816666));
  _OrderPageState({this.nama, this.total});
  var hkm = km.toInt();
  int hargajarak = 100;

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    namaPengirimController.dispose();
    super.dispose();
  }

  //function datetime picker
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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

    var harga = 500;
    if (dropAsuransi == "Ya") {
      asuransi = 5000;
    } else {
      asuransi = 0;
    }

    List<String> _jenisbarang = ['Dokumen', 'Barang Pecah', 'Pakaian'];
    List<String> _provinsi = ['Jawa Barat', 'Jakarta', 'Jawa Timur'];
    List<String> _kabupaten = ['Bandung Kota', 'Jakarta Kota', 'Surabaya'];
    List<String> _asuransi = ['Ya', 'Tidak'];

    return Form(
      child: Container(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
                    hintText: 'Nama Pengirim',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                 
                )),
            SizedBox(height: 8.0),
            Container(
              //alamat pengirim
              child: TextFormField(
                  controller: alamatPengirimController,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: "alamat Pengirim",
                    labelText: "Alamat Pengirim",
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  )),
            ),
            SizedBox(height: 8.0),
            Container(
              //tanggal penjemputan
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
                        child: RaisedButton.icon(
                          onPressed: () => _selectDate(context),
                          label: Text('Pilih Tanggal'),
                          icon: Icon(Icons.calendar_today),
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
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                        ))
                  ],
                ),
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
                          controller: beratController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Berat paket',
                              hintText: 'Berat (kg)',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
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
                                          BorderRadius.circular(5.0))),
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
                //deskripsi barang
                controller: deskripsiController,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: "Deskripsi Barang",
                  labelText: "Deskripsi Barang",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                )),
            SizedBox(height: 5.0),
            Container(
              //nama penerima
              height: 40,
              child: TextField(
                controller: namaPenerimaController,
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Nama Penerima',
                  labelText: 'Nama Penerima',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            TextFormField(
                //alamat penerima
                controller: alamatPenerimaController,
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: "alamat Rumah/kantor",
                  labelText: "Alamat Detail Penerima",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                )),
            Padding(
              //provinsi dan kota penerima
              padding:
                  EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropProvinsi,
                      items: _provinsi
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String data) {
                        setState(() {
                          dropProvinsi = data;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 5.0 * 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropKabupaten,
                      items: _kabupaten
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String data) {
                        setState(() {
                          dropKabupaten = data;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              //kode pos dan notelp
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: kodePosController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Kode Pos',
                            hintText: 'Kode Pos',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 30,
                    ),
                    Container(
                        width: 170,
                        child: Expanded(
                          child: TextFormField(
                            controller: noTelpPenerima,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'No.Telp Penerima',
                                hintText: 'No.Telp Penerima',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            RaisedButton.icon(
              //pilih lokasi penerima
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
              color: Colors.blueAccent,
              onPressed: () {
                
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (
                        context,
                      ) =>
                              Payment(
                                asuransi: asuransi.toString(),
                                namaPengirim: namaPengirimController.text,
                                alamatPengirim: alamatPengirimController.text,
                                tglJemput: selectedDate.toString(),
                                berat: beratController.text,
                                jenis: dropJenis,
                                deskripsi: deskripsiController.text,
                                namaPenerima: namaPenerimaController.text,
                                tujuan: namaPenerimaController.text +
                                    ' ' +
                                    alamatPenerimaController.text +
                                    ' ' +
                                    dropProvinsi +
                                    ' ' +
                                    dropKabupaten +
                                    ' ' +
                                    kodePosController.text +
                                    '(' +
                                    noTelpPenerima.text +
                                    ')',
                                noTelp: noTelpPenerima.text,
                                total:
                                    ((int.parse(beratController.text) * harga) +
                                            (hkm * hargajarak))
                                        .toString(),
                              )));
                // return showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //         content: Column(
                //       crossAxisAlignment: CrossAxisAlignment.stretch,
                //       //position

                //       mainAxisSize: MainAxisSize.min,
                //       // wrap content in flutter
                //       children: <Widget>[
                //         Text("OrderId : " + this.orderId),
                //         Text("Nama Pengirim : " + namaPengirimController.text),
                //         Text("Alamat Pengirim : " +
                //             alamatPengirimController.text),
                //         Text("Tanggal Penjemputan : " + tanggalController.text),
                //         Text('Berat Paket : ' + beratController.text + 'Kg'),
                //         Text('Jenis paket : ' + dropJenis),
                //         Text('Deskripsi Barang : ' + deskripsiController.text),
                //         Text('Tujuan : ' +
                //             namaPenerimaController.text +
                //             ' ' +
                //             alamatPenerimaController.text +
                //             ' ' +
                //             dropProvinsi +
                //             ' ' +
                //             dropKabupaten +
                //             ' ' +
                //             kodePosController.text +
                //             '(' +
                //             noTelpPenerima.text +
                //             ')'),
                //         SizedBox(height: 8),
                //         Text("Biaya Pengiriman : Rp." +
                //             (int.parse(beratController.text) * harga)
                //                 .toString()),
                //         Text('Biaya Assuransi : Rp.' + asuransi.toString()),
                //         Text(
                //           'Total : Rp.' +
                //               ((int.parse(beratController.text) * harga) +
                //                       asuransi)
                //                   .toString(),
                //           style: TextStyle(fontSize: 20),
                //         ),
                //         RaisedButton(
                //           child: Text('Next'),
                //           color: Colors.blue,
                //           onPressed: () {
                //             Navigator.pushReplacement(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (
                //                   context,
                //                 ) =>
                //                         Payment(
                //                           asuransi: asuransi.toString(),
                //                           namaPengirim:
                //                               namaPengirimController.text,
                //                           alamatPengirim:
                //                               alamatPengirimController.text,
                //                           tglJemput: tanggalController.text,
                //                           berat: beratController.text,
                //                           jenis: dropJenis,
                //                           deskripsi: deskripsiController.text,
                //                           namaPenerima:
                //                               namaPenerimaController.text,
                //                           tujuan: namaPenerimaController.text +
                //                               ' ' +
                //                               alamatPenerimaController.text +
                //                               ' ' +
                //                               dropProvinsi +
                //                               ' ' +
                //                               dropKabupaten +
                //                               ' ' +
                //                               kodePosController.text +
                //                               '(' +
                //                               noTelpPenerima.text +
                //                               ')',
                //                           noTelp: noTelpPenerima.text,
                //                           total: ((int.parse(beratController
                //                                           .text) *
                //                                       harga) +
                //                                   asuransi)
                //                               .toString(),
                //                         )));
                //           },
                //         )
                //       ],
                //     ));
                //     },
                //   );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Payment extends StatefulWidget {
  final String namaPengirim;
  final String alamatPengirim;
  final String tglJemput;
  final String berat;
  final String jenis;
  final String deskripsi;
  final String namaPenerima;
  final String tujuan;
  final String noTelp;
  final String total;
  final String asuransi;
  Payment(
      {Key key,
      this.namaPengirim,
      this.alamatPengirim,
      this.tglJemput,
      this.berat,
      this.jenis,
      this.deskripsi,
      this.namaPenerima,
      this.asuransi,
      this.noTelp,
      this.total,
      this.tujuan})
      : super(key: key);
  String get formattedPrice => Payment.formatter
      .format((int.parse(this.total)) + (int.parse(this.asuransi)));
  static final formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: "Rp ");
  final orderId = Uuid().v1();
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final orderId = ShortUuid.shortv4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Payment"),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
             
              //   CoolAlert.show(
              //     context: context,
              //     type: CoolAlertType.success,
              //     onConfirmBtnTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context,) =>TabCon()));
              //     },
              //     text: "Transaksi Sukses",
              //   );
            },
            child: Text("Checkout"),
          )
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 190,
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: Container(
            child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                children: <Widget>[
              Row(
                //Nama Pengirim
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Order ID",
                      style: TextStyle(fontSize: 14),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          orderId,
                          style: TextStyle(fontSize: 14),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //Nama Pengirim
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Nama Pengirim",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.namaPengirim}",
                          style: TextStyle(fontSize: 20),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //Alamat Pengirim
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Alamat Pengirim",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.alamatPengirim}",
                          style: TextStyle(fontSize: 16),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //TGL Jemput
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Tanggal Penjemputan",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.tglJemput}".split(' ')[0],
                          style: TextStyle(fontSize: 16),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //Berat
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Berat Paket",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.berat}" + " Kg",
                          style: TextStyle(fontSize: 16),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //Jenis
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Jenis Barang",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.jenis}",
                          style: TextStyle(fontSize: 16),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //Deskripsi
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Deskripsi",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.deskripsi}",
                          style: TextStyle(fontSize: 16),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //nama Penerima
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Nama Penerima",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.namaPenerima}",
                          style: TextStyle(fontSize: 18),
                        )),
                      ))
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                //Tujuan
                children: <Widget>[
                  Container(
                    width: 150,
                    child: Expanded(
                        child: Text(
                      "Tujuan",
                      style: TextStyle(fontSize: 15),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 165,
                      child: Expanded(
                        child: Container(
                            // padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                          "${widget.tujuan}",
                          style: TextStyle(fontSize: 15),
                        )),
                      ))
                ],
              ),
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
      margin: const EdgeInsets.only(top: 25.0, bottom: 0.0),
      child: Center(
        child: ListTile(
          trailing: Text(
            widget.formattedPrice,
            style: TextStyle(fontSize: 22),
          ),
          leading: Icon(Icons.payments),
          title: Text(
            "Total Biaya",
            style: TextStyle(fontSize: 22),
          ),
          onTap: () {},
        ),
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
      margin: const EdgeInsets.only(top: 25.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(25, 25, 5, 0),
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Row(
                //Tujuan
                children: <Widget>[
                  Container(
                    width: 175,
                    child: Expanded(
                        child: Text(
                      "Biaya Pengiriman",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 140,
                      child: Expanded(
                        child: Container(
                            child: Text(
                          "${widget.total}",
                          style: TextStyle(fontSize: 18),
                        )),
                      ))
                ],
              ),
              Row(
                //Tujuan
                children: <Widget>[
                  Container(
                    width: 175,
                    child: Expanded(
                        child: Text(
                      "Biaya Asuransi",
                      style: TextStyle(fontSize: 18),
                    )),
                  ),
                  Container(
                    child: Text(":"),
                    width: 15,
                  ),
                  Container(
                      width: 140,
                      child: Expanded(
                        child: Container(
                            child: Text(
                          "${widget.asuransi}",
                          style: TextStyle(fontSize: 18),
                        )),
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
