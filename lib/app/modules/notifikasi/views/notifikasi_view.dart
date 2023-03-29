import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/notifikasi_controller.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  final global = Get.put(GlobalController());
  var a = [
    11,
    1,
    1,
    1,
    3,
    3,
    3,
    3,
    3,
    3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? null : whitey,
        title: Text(
          'Notifikasi',
          style: TextStyle(fontFamily: 'Helvetica Neue Bold'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
            children: a
                .map((e) => Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pengajuan Diterima',
                              style: TextStyle(),
                            ),
                            SizedBox(
                              height: Get.width / 18,
                            ),
                            Text(
                              'Pengajuan izin 03282028908 telah diterima oleh kecamatan',
                              style:
                                  TextStyle(fontSize: global.fontSmall.value),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '2022 - 04 - 01',
                              style:
                                  TextStyle(fontSize: global.fontSmall.value),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
