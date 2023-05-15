import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/pengaduan_controller.dart';

class PengaduanView extends GetView<PengaduanController> {
  final tab = Get.put(PengaduanController());
  var global = Get.put(GlobalController());
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          foregroundColor: Get.isDarkMode ? null : greenny,
          backgroundColor: Get.isDarkMode ? null : whitey,
          title: Text(
            'PengaduanView',
            style: TextStyle(
              fontFamily: 'popSM',
              fontSize: global.fontSet.value + 3,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            labelColor: greenny,
            unselectedLabelStyle: TextStyle(fontFamily: "popM", fontSize: 13),
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontFamily: "popSM", fontSize: 13),
            indicatorColor: greenny,
            isScrollable: true,
            controller: tab.controller,
            tabs: tab.myTabs,
          ),
        ),
        body: TabBarView(
          controller: tab.controller,
          children: tab.myTabs.map((Tab tab) {
            final String label = tab.text!;
            return Center(
              child: Text(
                'This is the $label tab',
                style: const TextStyle(fontSize: 14),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
