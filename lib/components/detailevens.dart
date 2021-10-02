import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rmutl_navigator/service/config.dart';
import 'package:url_launcher/url_launcher.dart';

class DetialEvens extends StatelessWidget {
  final id,
      name,
      image,
      buildingevens,
      detailevens,
      evenlatitude,
      evenlogitude,
      updatedAt,
      urlgooglemap;

  const DetialEvens(
      {this.id,
      this.name,
      this.image,
      this.buildingevens,
      this.detailevens,
      this.evenlatitude,
      this.evenlogitude,
      this.updatedAt,
      this.urlgooglemap});

  @override
  Widget build(BuildContext context) {
    Future launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        print("Can't Lanch ${url}");
      }
    }

    //const url = '${urlgooglemap}'.toString();
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          connect().urlimage + "images/" + '${image}',
                          height: 250,
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
                          Text('${name}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          SizedBox(
                            height: 5,
                          ),
                          // Text('อาคารจัดกิจกรรม : ${buildingevens}',
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16)),
                          // Text('latitude : ${evenlatitude}',
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16)),
                          // Text('logitude : ${evenlogitude}',
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 16)),
                          Text(
                              DateFormat('อัพเดทล่าสุดเมื่อ : วันที่ ' +
                                      'dd-MM-yyyy' +
                                      ' เวลา ' 'kk:mm:ss' +
                                      ' น.')
                                  .format(updatedAt),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: new Image.asset('assets/icons/maps.png'),
                                tooltip: 'อัพเดทภายหลัง',
                                onPressed: () {
                                  launchURL('${urlgooglemap}');
                                  print('${urlgooglemap}');
                                }),
                            Text(
                              'ที่อยู่กิจกรรม',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
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
                      Text('รายละเอียดกิจกรรม',
                          style: TextStyle(
                              color: Colors.black,
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
                      Text('${detailevens}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //         icon: new Image.asset('assets/icons/global.png'),
                      //         tooltip: 'อัพเดทภายหลัง',
                      //         onPressed: () => {
                      //               print('กดเว็ป'),
                      //               launch("https://www.rmutl.ac.th/")
                      //             }),
                      //     Text(
                      //       'อ้างอิง',
                      //       style: TextStyle(color: Colors.blue),
                      //     ),
                      //   ],
                      // )
                    ],
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
