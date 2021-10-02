import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rmutl_navigator/components/building.dart';
import 'package:rmutl_navigator/components/contect.dart';
import 'package:rmutl_navigator/components/detailevens.dart';
import 'package:rmutl_navigator/model/dataEvens.dart';
import 'package:rmutl_navigator/service/config.dart';
import 'package:rmutl_navigator/service/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<String> imageList = [
  "https://api.rmutlfarm.tk/images/index1.jpg",
  "https://api.rmutlfarm.tk/images/index2.jpg",
  "https://api.rmutlfarm.tk/images/index3.jpeg",
  "https://api.rmutlfarm.tk/images/index4.jpg",
];

class _MyHomePageState extends State<MyHomePage> {
  connect _connect = connect();
  List<dynamic> rowevens = [];
  List<DataEvens> _dataEven = [];
  Future<void> getdataevens() async {
    var res = await connect().get('api/v2/evens/evens');
    setState(() {
      rowevens = jsonDecode(res.body);
      print(rowevens);
      for (var j in rowevens) {
        _dataEven.add(DataEvens.fromJson(j));
      }
    });
  }

  void routeToConTact() {
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => ConTect(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    getdataevens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _current = 0;
    final CarouselController _controller = CarouselController();

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.blue.shade900)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => {
                  print('กดระบบนำทางภายในมหาวิทยาลัย'),
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Building(),
                    ),
                  ),
                },
                child: Container(
                  height: 90,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(1, 3))
                    ],
                    image: DecorationImage(
                        scale: 7,
                        alignment: Alignment.centerRight,
                        image: AssetImage(
                          'assets/icons/smartphone.png',
                        ),
                        fit: BoxFit.scaleDown),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Center(
                      child: Text(
                        'ข้อมูลอาคารและระบบนำทาง',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(rowevens.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: kDefaultPadding,
                          top: kDefaultPadding / 4,
                          bottom: kDefaultPadding * 2.5),
                      width: size.width * 0.5,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.network(
                              connect().urlimage +
                                  "images/" +
                                  _dataEven[index].image,
                              height: 150,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("id :" + _dataEven[index].id);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetialEvens(
                                        image: _dataEven[index].image,
                                        name: _dataEven[index].name,
                                        buildingevens:
                                            _dataEven[index].buildingevens,
                                        detailevens:
                                            _dataEven[index].detailevens,
                                        urlgooglemap:
                                            _dataEven[index].urlgooglemap,
                                        updatedAt: _dataEven[index].updatedAt,
                                      )));
                            },
                            child: Container(
                              padding: EdgeInsets.all(kDefaultPadding / 1),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(1, 3))
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    rowevens[index]["name"].toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'กดเพื่อดูรายละเอืยดเพิ่มเติม',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('Onclick');
          routeToConTact();
        },
        label: Text('ติดต่อAdmin'),
        icon: Icon(Icons.message),
        focusColor: lPrimaryColor,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

final List<Widget> imageSliders = imageList
    .map((index) => Container(
          child: GestureDetector(
            onTap: () => {launch('https://www.rmutl.ac.th/')},
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(index, fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 71, 191, 255),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 20.0),
                          child: Text(
                            'www.rmutl.ac.th',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ))
    .toList();
