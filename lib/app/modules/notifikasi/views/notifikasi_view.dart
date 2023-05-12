import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  final global = Get.put(GlobalController());
  var a = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isDark.value ? Color(0xff111315) : Colors.white,
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? null : whitey,
        title: Text(
          'Notifikasi',
          style: TextStyle(
              fontFamily: 'pop',
              fontSize: global.fontSet.value + 3,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Terbaru",
                  style: TextStyle(
                      color: global.isDark.value ? Colors.white : Colors.black,
                      fontFamily: "popM",
                      fontWeight: FontWeight.w500,
                      fontSize: global.fontSet.value + 1),
                ),
              ),
              SizedBox(
                height: Get.width * 0.02,
              ),
              Wrap(
                  // runSpacing: 7,
                  children: a
                      .map((e) => Column(
                            children: [
                              Card(
                                elevation: 0,
                                color: Colors.transparent,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  width: Get.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Pengajuan Diterima',
                                            style: TextStyle(
                                              fontSize:
                                                  global.fontSet.value - 0.5,
                                              fontFamily: "popM",
                                              color: global.isDark.value
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '2022 - 04 - 01',
                                            style: TextStyle(
                                              fontSize: global.fontSmall.value,
                                              fontFamily: "popM",
                                              color: global.isDark.value
                                                  ? Colors.grey[600]
                                                  : Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.width * 0.03,
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.2,
                                        child: Text(
                                          'Pengajuan izin 03282028908 telah diterima oleh kecamatan',
                                          style: TextStyle(
                                            fontSize:
                                                global.fontSmall.value + 1,
                                            fontFamily: "pop",
                                            color: global.isDark.value
                                                ? Colors.grey[600]
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: global.isDark.value
                                    ? Colors.grey[800]
                                    : Colors.grey.shade200,
                              )
                            ],
                          ))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
