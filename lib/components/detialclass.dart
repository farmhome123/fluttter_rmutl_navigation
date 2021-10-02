import 'package:flutter/material.dart';
import 'package:rmutl_navigator/service/config.dart';
import 'package:rmutl_navigator/service/constants.dart';

class DetialClass extends StatelessWidget {
  final id, name, image, detailclass, floot, gotoclass, phone;

  const DetialClass(
      {this.id,
      this.name,
      this.image,
      this.detailclass,
      this.floot,
      this.gotoclass,
      this.phone});

  @override
  Widget build(BuildContext context) {
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Hero(
                            tag: name,
                            child: Image.network(
                              connect().urlimage + "images/" + '${image}',
                              height: 250,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ชื่อห้อง : ${name}',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            SizedBox(
                              height: 5,
                            ),
                            Text('ชั้น : ${floot}',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                            SizedBox(
                              height: 5,
                            ),
                            Text('เบอร์โทรศัทพ์ติดต่อ : ${phone}',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 5),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           IconButton(
                    //               icon: new Image.asset('assets/icons/door.png'),
                    //               tooltip: 'รายละเอียดการเดินทางไปยังห้องเรียน',
                    //               onPressed: () => {
                    //                     print('กดระบบนำทาง'),
                    //                   }),
                    //           Text(
                    //             'รายละเอียดการเดินทางไปยังห้องเรียน',
                    //             style: TextStyle(color: Colors.blue),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                )),
                Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: 25,
                    color: Colors.grey,
                    thickness: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('รายละเอียดห้องเรียน',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('${detailclass}',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('รายละเอียดเดินทางไปยังห้อง',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('${gotoclass}',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
