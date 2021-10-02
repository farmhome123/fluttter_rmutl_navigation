import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:rmutl_navigator/components/detialclass.dart';
import 'package:rmutl_navigator/service/config.dart';
import 'package:rmutl_navigator/service/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildingClass extends StatefulWidget {
  final dynamic id, name, image;
  final double buildinglatitude, buildinglogitude;

  const BuildingClass({
    this.id,
    this.name,
    required this.buildinglatitude,
    required this.buildinglogitude,
    this.image,
  });
  @override
  _BuildingClassState createState() => _BuildingClassState();
}

class _BuildingClassState extends State<BuildingClass> {
  List<dynamic> rowclassbuilding = [];

  Future<void> getdataclassbuilding() async {
    var res =
        await connect().get('api/v2/class/classroom/building/${widget.id}');
    setState(() {
      rowclassbuilding = jsonDecode(res.body);
      print(rowclassbuilding);
      print('id building  =  ${widget.id}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getdataclassbuilding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    // _openOnGoogleMapApp(double latitude, double longitude) async {
    //   String googleUrl =
    //       'https://www.google.com/maps/search/?api=1&query=${widget.buildinglatitude},${widget.buildinglogitude}';
    //   if (await canLaunch(googleUrl)) {
    //     await launch(googleUrl);
    //   } else {
    //     // Could not open the map.
    //   }
    // }

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('ชื่อ อาคาร : ${widget.name}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),

                        // Text('Latitude : ${widget.buildinglatitude}',
                        //     style: TextStyle(
                        //         color: Colors.brown[300],
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 16)),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text('Longitude : ${widget.buildinglogitude}',
                        //     style: TextStyle(
                        //         color: Colors.brown[300],
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'กดเพื่อนำทางไปยังอาคาร',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 16),
                                  ),
                                  IconButton(
                                      icon: new Image.asset(
                                          'assets/icons/maps.png'),
                                      tooltip: 'กดเพื่อนำทางไปยังอาคาร',
                                      onPressed: () => {
                                            print('กดระบบนำทาง'),
                                            // launch(
                                            //     "https://maps.apple.com/?q=${widget.buildinglatitude},${widget.buildinglogitude}")
                                            // launch(
                                            //     "https://www.google.com/maps/search/?api=1&query=${widget.buildinglatitude},${widget.buildinglogitude}")
                                            MapsLauncher.launchCoordinates(
                                                widget.buildinglatitude,
                                                widget.buildinglogitude,
                                                '${widget.name}'),
                                          }),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: sidePadding,
                child: Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 3,
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ห้องภายในอาคาร',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ),
                    Icon(Icons.class__outlined),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: rowclassbuilding.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          print("click class id :" +
                              rowclassbuilding[index]["id"].toString()),
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetialClass(
                                id: rowclassbuilding[index]["id"],
                                name: rowclassbuilding[index]["name"],
                                image: rowclassbuilding[index]["image"],
                                floot: rowclassbuilding[index]["floot"],
                                phone: rowclassbuilding[index]["phone"],
                                gotoclass: rowclassbuilding[index]["gotoclass"],
                                detailclass: rowclassbuilding[index]
                                    ["detailclass"],
                              ),
                            ),
                          ),
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: Hero(
                                        tag: rowclassbuilding[index]["name"],
                                        child: Image.network(
                                          connect().urlimage +
                                              "images/" +
                                              rowclassbuilding[index]["image"],
                                          height: size.height * 0.3,
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "ชื่อห้อง:" + rowclassbuilding[index]["name"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "กดเพื่อดูข้อมูลห้อง",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 13),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: sidePadding,
                                child: Divider(
                                    height: 5,
                                    color: kPrimaryColor,
                                    thickness: 1,
                                    indent: 0.0,
                                    endIndent: 0.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
