import 'package:flutter/material.dart';
import 'package:flutterfirebaseauth/constant.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Eazy.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.account_balance_wallet, color: Colors.white, size: 40.0),
                          Container(
                            width: 90.0,
                            child: new Divider(color: Colors.white),
                          ),
                          Text(
                            "EAZY Wallet",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 70.0),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    'Payment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'IDR 25.000',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Random',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: MediaQuery.of(context).size.width - 270.0,
                      child: FractionalTranslation(
                        translation: const Offset(0.0, 0.8),
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          label: Text('Topup'),
                          icon: Icon(Icons.payments),
                          
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text("Recent Transactions",
                              style: new TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16.0,
                                  color: Colors.black38)),
                        ),
                      ],
                    ),
                  ),
                  Card( 
                  color: Colors.red[50],
                  child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_down),
                  leading: Icon(Icons.local_shipping),
                  title: Text("Pembayaran kirim paket Bandung ke Jakarta"),
                  subtitle: Text("- Rp.100.000,-"),
          ),
              ),
              Card( 
                  color: Colors.green[50],
                  child: ListTile(
                  trailing: Icon(Icons.keyboard_arrow_down),
                  leading: Icon(Icons.monetization_on),
                  title: Text("Top Up Via M-Banking"),
                  subtitle: Text("+ Rp.150.000,-"),
          ),
              )
                ],
              )
            ],
          )),
        ),
      ],
    );
  }
}
