import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/detail_pelayanan_controller.dart';

class DetailPelayananView extends GetView<DetailPelayananController> {
  DetailPelayananView({Key? key}) : super(key: key);
  final global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print(data.syarat);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? null : whitey,
      ),
      backgroundColor: Get.isDarkMode ? null : whitey,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 8.5 / 10,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: Get.width / 15),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      data.nama,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: global.fontSize.value,
                          color: greenny,
                          fontFamily: 'Helvetica Neue Bold'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(8),
                    width: Get.width,
                    decoration: BoxDecoration(color: greny),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Center(
                                child: Text(
                              'Persyaratan',
                              style: TextStyle(
                                  fontSize: global.fontSize.value, fontWeight: FontWeight.bold),
                            ))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(data.syarat.length, (index) {
                            // return Text(data.syarat[index]);
                            return ListTile(
                              title: Text(data.syarat[index]),
                              leading: Icon(Icons.chevron_right),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                widthFactor: Get.width,
                child: GestureDetector(
                    child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 1,
                  child: Container(
                    height: Get.width / 10,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: greeny,
                    ),
                    child: Text(
                      'Daftar Layanan',
                      style: TextStyle(
                          color: whitey, fontFamily: 'Helvetica Neue Medium'),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
