import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/sipahadesi_controller.dart';

class SipahadesiView extends GetView<SipahadesiController> {
  final global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Get.isDarkMode ? null : greenny,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? null : whitey,
          title: Text(
            'SIPAHADESI',
            style: TextStyle(
              fontFamily: 'Product Sans',
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Kategori Jadwal',
                  style: TextStyle(color: grayy),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: Get.width / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: greeny),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Center(child: Text('Semua Jadwal')),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selasa',
                            style:
                                TextStyle(fontSize: global.fontHeading.value),
                          ),
                          Divider(color: greny, height: 10),
                          Text(
                            'Maret 21, 2023',
                            style: TextStyle(fontSize: global.fontSize.value),
                          )
                        ],
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)),
                          child: Text('2'),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
