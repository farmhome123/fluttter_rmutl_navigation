import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rmutl_navigator/components/buildingclass.dart';
import 'package:rmutl_navigator/components/contect.dart';
import 'package:rmutl_navigator/service/config.dart';
import 'package:rmutl_navigator/service/constants.dart';

class Building extends StatefulWidget {
  @override
  _BuildingState createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  List<dynamic> rowbuilding = [];
  TextEditingController keyword = TextEditingController();

  Future<void> getdatabuilding() async {
    var res = await connect().get('api/v2/building/building');
    setState(() {
      rowbuilding = jsonDecode(res.body);
      print(rowbuilding);
    });
  }

  Future<void> getdatabuilding_keyword() async {
    var res =
        await connect().get('api/v2/building/building/keyword/' + keyword.text);
    setState(() {
      rowbuilding = jsonDecode(res.body);
      print(rowbuilding);
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
    getdatabuilding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Container(
            height: size.height,
            color: Colors.blue[50],
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23),
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: keyword,
                          onChanged: (String value) {
                            if (value.length > 1) {
                              getdatabuilding_keyword();
                            } else {
                              getdatabuilding();
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "   ค้นหาอาคาร",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // suffixIcon: Icon(Icons.screen_search_desktop),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 25),
                    child: ListView.builder(
                        itemCount: rowbuilding.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print('คลิกอาคาร id = ' +
                                  rowbuilding[index]["id"].toString());
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BuildingClass(
                                        id: rowbuilding[index]["id"].toString(),
                                        name: rowbuilding[index]["name"]
                                            .toString(),
                                        buildinglatitude: rowbuilding[index]
                                            ["buildinglatitude"],
                                        buildinglogitude: rowbuilding[index]
                                            ["buildinglongitude"],
                                        image: rowbuilding[index]["image"]
                                            .toString(),
                                      )));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            child: Image.network(
                                              connect().urlimage +
                                                  "images/" +
                                                  rowbuilding[index]["image"],
                                              height: 280,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(rowbuilding[index]["name"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "กดเพื่อดูข้อมูลอาคาร",
                                      style: TextStyle(color: Colors.blue),
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
                            ),
                          );
                        }),
                  ),
                )
              ],
            )),
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

//   void routeToConTact() {
//     MaterialPageRoute materialPageRoute = MaterialPageRoute(
//       builder: (context) => ConTect(),
//     );
//     Navigator.push(context, materialPageRoute);
//   }
// }
}
