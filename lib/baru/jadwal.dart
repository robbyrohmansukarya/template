import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/baru/dalamkota.dart';
//import 'package:flutterfirebaseauth/constant.dart';




// ignore: must_be_immutable
class Jadwal extends StatelessWidget {
 var cryptoData = CryptoData.getData; @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
              //tanggal penjemputan
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5.0,left: 0
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 172,
                      child: Expanded(
                        child: ListTile(
                          title: Text('Titik Berangkat',style: TextStyle(fontSize: 12.0),),
                          subtitle: Text('Pilih Titik Berangkat',style: TextStyle(fontSize: 10),),
                          trailing: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ),
                    VerticalDivider(thickness: 2,),
                    Container(
                        width: 172,
                        child: Expanded(
                           child: ListTile(
                          title: Text('Titik Tujuan',style: TextStyle(fontSize: 12.0),),
                          subtitle: Text('Pilih Titik Tujuan',style: TextStyle(fontSize: 10),),
                          trailing: Icon(Icons.keyboard_arrow_down),
                        ),
                        ))
                  ],
                ),
              ),
            ),
            Divider(thickness: 2,),
                  Expanded(
                    child: ListView.builder(
 // scrollDirection: Axis.horizontal,
                    itemCount: cryptoData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 146,
                        width: double.maxFinite,
                        child: Card(
                          
                          elevation: 3,
                          child: Container(
                            
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 2.0, color: cryptoData[index]['iconColor']),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(7, 0, 7, 7),
                              child: Stack(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Stack(
                                    children: <Widget>[
                                      GestureDetector(onTap: (){Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DalamKota()));
                                                    },),
                                      Padding(
                                          padding: const EdgeInsets.only( top: 5),
                                          child: Column(
                                            children: <Widget>[
                                              
                                              Row(
                                                children: <Widget>[
                                                  cryptoIcon(cryptoData[index]),
                                                
                                                cryptoNameSymbol(cryptoData[index]),
                                                Spacer(),
                                                cryptoChange(cryptoData[index]),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                changeIcon(cryptoData[index]),
                                                
                                              ],
                                            ),
                                            Row(
                                            children: <Widget>[
                                              cryptoAmount(cryptoData[index])
                                            ],
                                          )
                                        ],
                                       ))
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ));
  }Widget cryptoIcon(data) {
   return Padding(
     padding: const EdgeInsets.only(left: 0),
     child: Align(
         alignment: Alignment.centerLeft,
         child: Icon(
           data['icon'],
           color: data['iconColor'],
           size: 40,
         )),
   );
  }Widget cryptoNameSymbol(data) {
   return Align(
     alignment: Alignment.centerLeft,
     child: RichText(
       text: TextSpan(
         text: '${data['tujuan']}',
         style: TextStyle(
             fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
         children: <TextSpan>[
           TextSpan(
               text: '\n${data['kendaraan']}',
               style: TextStyle(
                   color: Colors.grey,
                   fontSize: 15,
                   fontWeight: FontWeight.bold)),
           ],
         ),
       ),
     );
  }Widget cryptoChange(data) {
   return Align(
     alignment: Alignment.topRight,
     child: RichText(
       text: TextSpan(
         text: '${data['tonase']}',
         style: TextStyle(
             fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
        //  children: <TextSpan>[
        //    TextSpan(
        //        text: '\n${data['changeValue']}',
        //        style: TextStyle(
        //            color: data['changeColor'],
        //            fontSize: 15,
        //            fontWeight: FontWeight.bold)),
        //   ],
        ),
      ),
    );
  }Widget changeIcon(data) {
   return Align(
       alignment: Alignment.topRight,
       child: data['tonase'].contains('-')
           ? Icon(
         Icons.keyboard_arrow_down,
         color: data['changeColor'],
         size: 30,
       )
           : Icon(
         Icons.keyboard_arrow_up,
         color: data['changeColor'],
         size: 30,
       ));
  }Widget cryptoAmount(data) {
   return Align(
   alignment: Alignment.centerLeft,
   child: Padding(
     padding: const EdgeInsets.only(left: 20.0),
     child: Row(
       children: <Widget>[
         RichText(
           textAlign: TextAlign.left,
           text: TextSpan(
             text: '\n${data['value']}',
             style: TextStyle(
               color: Colors.grey,
               fontSize: 20.0,
             ),
             children: <TextSpan>[
               TextSpan(
                   text: '\n${data['estimasi']}',
                   style: TextStyle(
                       color: Colors.grey,
                       fontStyle: FontStyle.italic,
                       fontSize: 15.0,
                       fontWeight: FontWeight.bold)),
             ],
           ),
         ),
       ],
     ),
   ),
 );
 }
 }
 
 class CryptoData {
   static final getData = [
   {
     'tujuan': 'Bandung - Jakarta',
     'kendaraan': 'Box Engkel',
     'icon': Icons.local_shipping,
     'iconColor': Colors.grey,
     'tonase': '   5.5 Ton',
     'changeColor': Colors.green,
     'value': 'Rp. 500.000',
     'estimasi': 'Estimasi 4 Jam'
   },
   {
     'tujuan': 'Bandung - Semarang',
     'kendaraan': 'Box Engkel',
     'icon': Icons.local_shipping,
     'iconColor': Colors.grey,
     'tonase': '   6 Ton',
     'changeColor': Colors.green,
     'value': 'Rp.750.000',
     'estimasi': 'Estimasi 7 Jam'
   },
   {
     'tujuan': 'Bandung - Tasikmalaya',
     'kendaraan': 'Box Engkel',
     'icon': Icons.local_shipping,
     'iconColor': Colors.grey,
     'tonase': '   6 Ton',
     'changeColor': Colors.green,
     'value': 'Rp.450.000',
     'estimasi': 'Estimasi 5 Jam'
   },
   {
     'tujuan': 'Bandung - Garut',
     'kendaraan': 'Box Engkel',
     'icon': Icons.local_shipping,
     'iconColor': Colors.grey,
     'tonase': '   6 Ton',
     'changeColor': Colors.green,
     'value': 'Rp.450.000',
     'estimasi': 'Estimasi 4 Jam 30 menit'
   },
 ];
}
