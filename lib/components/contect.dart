import 'package:flutter/material.dart';
import 'package:rmutl_navigator/service/constants.dart';

class ConTect extends StatefulWidget {
  @override
  State<ConTect> createState() => _ConTectState();
}

class _ConTectState extends State<ConTect> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: lPrimaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ติดต่อแอดมินขอเพิ่มข้อมูลหรือแก้ไขข้อมูล',
                  style: TextStyle(fontSize: 18, color: kPrimaryColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset(
                  "assets/images/Qr_admin.jpg",
                  height: size.width * 0.5,
                  width: size.height * 0.5,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  '*หมายเหตุ*',
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Text(
                  'หากต้องการขอเพิ่มหรือแก้ไขข้อมูล กิจกรรม,สถานที่,ห้องเรียน, อื่นๆ กรุณากรอกข้อมูลที่ท่านต้องการเพิ่มลงในช่องแชทใน Application Line (สแกน QrCode)',
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
