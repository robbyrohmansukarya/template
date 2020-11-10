import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//import 'package:flutterfirebaseauth/baru/express.dart';
import 'package:flutterfirebaseauth/baru/menu_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<Home> with TickerProviderStateMixin {
  TabController _nestedTabController;
  static final List<String> imgSlider = [
    'promo1.jpg',
    'promo2.jpg',
    'promo3.jpg',
    'promo4.jpg',
    'promo5.jpg'
  ];
  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            // ignore: unnecessary_brace_in_string_interps
            'assets/slider/${fileImage}',
            width: 10000,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    height: 150,
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
  );
  
  List<GrabService> _grabServiceList = [];

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
    _grabServiceList.add(new GrabService(
        image: Icons.directions_bike, color: Color(0xffe99e1e), title: "Bike"));
    _grabServiceList.add(new GrabService(
        image: Icons.local_car_wash, color: Color(0xff14639e), title: "Car"));
    _grabServiceList.add(
      
      new GrabService(
      
        image: Icons.local_hospital,
        color: Color(0xffec1d27),
        title: "Health")
        );
    _grabServiceList.add(new GrabService(
        image: Icons.restaurant, color: Color(0xff2da5d9), title: "Food"));
    _grabServiceList.add(new GrabService(
        image: Icons.next_week, color: Color(0xff8dc53e), title: "Express"));
    _grabServiceList.add(new GrabService(
        image: Icons.shopping_cart, color: Color(0xfff43f24), title: "Mart"));
    _grabServiceList.add(new GrabService(
        image: Icons.phonelink_ring,
         color: Color(0xff72d2a2), title: "Pulsa"));
    _grabServiceList.add(new GrabService(
        image: Icons.apps, color: Color(0xffa6a6a6), title: "More"));
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                  color: Colors.blueAccent,
                  height: 115,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 25, left: 12, right: 12, bottom: 40),
                    height: 30,
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Offers and places to go',
                        prefixIcon: Icon(Icons.search),
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  )),
              Container(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: Expanded(
                        child: ListTile(
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                          ),
                          leading: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.green,
                          ),
                          title: Text('saldo'),
                          subtitle: Text('25000'),
                        ),
                      )),
                      VerticalDivider(thickness: 2.0),
                      Container(
                          child: Expanded(
                        child: ListTile(
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                          ),
                          leading: Icon(
                            Icons.monetization_on,
                            color: Colors.green,
                          ),
                          title: Text(
                            'Point',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          subtitle: Text('35'),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 8.0),
              Divider(thickness: 2,),
              Container(
                width: 150.0,
                padding: EdgeInsets.only(left: 100, right: 100),
                child: RaisedButton.icon(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  label: Text(
                    'Top Up. Walet',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.account_balance_wallet,
                    color: Colors.black,
                  ),
                  textColor: Colors.black,
                  splashColor: Colors.red,
                  color: Colors.white,
                ),
              ),
              // Container(
              //   child: SizedBox(
              //       width: double.infinity,
              //       height: 220.0,
              //       child: new Container(
              //           margin:
              //               EdgeInsets.only(top: 8.0, bottom: 8.0, left: 12.0),
              //           child: GridView.builder(
              //               physics: ClampingScrollPhysics(),
              //               itemCount: 8,
              //               gridDelegate:
              //               new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              //               itemBuilder: (context, position) {
              //                 return _rowGrabService(
              //                     _grabServiceList[position]);
              //               })
              //             )
              //           ),
              // ),
              Divider(thickness: 3,),
              autoPlayImage,
              SizedBox(height: 8,),
               Container(
                height: 160.0,
                width: 120.0,
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/promo.jpg'),
                fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
                ),
             ),
              Padding(
              padding: EdgeInsets.only(left:8.0, top: 8,right: 8),
              child: Text(
                'Season Baru streaming 30 Oktober!!',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2,left: 8),
              child: Text(
                'Sponsored by Disney+ Hotstar',
                style: TextStyle(fontSize: 14.0, color: Colors.black),
              ),
            ),
            SizedBox(height: 8,),
            Container(
              child: Container(
                height: 185.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0,left: 8,right: 8),
                  child: Row(
                    children: <Widget>[
                        Expanded(
                        child: Container(
                          height: 185.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/promo1.jpg'),
                          fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      Container(
                    width: 15.0,
                  ),
                      Container(
                          child: Expanded(
                        child: Container(
                          height: 185.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/promo2.jpg',),
                          fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Container(
                height: 85.0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                        Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 2,left: 8),
                          child: Text(
                          'Selasa Diskon Pulsa',
                            style: TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                    width: 15.0,
                  ), 
                      Container(
                          child: Expanded(
                        child: Container(
                         padding: EdgeInsets.only(left: 8),
                        child: Text(
                        'Lebih Untung Pake Grab',
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
  );
}

//   Widget _rowGrabService(GrabService grabService) {
//    return new Container(
//       child: new Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTap: () {
//               Navigator.push(context,MaterialPageRoute(builder: (context) =>Express()));
//             },
//             child: new Container(
//               decoration: new BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 1.0),
//                   borderRadius:
//                       new BorderRadius.all(new Radius.circular(20.0))),
//               padding: EdgeInsets.all(12.0),
//               child: new Icon(
//                 grabService.image,
//                 color: grabService.color,
//                 size: 32.0,
//               ),
//             ),
//           ),
//           new Padding(
//             padding: EdgeInsets.only(top: 6.0),
//           ),
//           new Text(grabService.title, style: new TextStyle(fontSize: 10.0))
//         ],
//       ),
//     );
//   }
}
