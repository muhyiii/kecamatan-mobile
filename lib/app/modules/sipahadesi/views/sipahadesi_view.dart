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
            'Jadwal SIPAHADESI',
            style: TextStyle(
              fontFamily: 'Product Sans',
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              height: Get.width / 5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Center(child: Text('Semua Jadwal')),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Selasa'),
                      Divider(),
                      Text('Maret 21, 2023')
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: 1)),
                    child: Text('2'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
