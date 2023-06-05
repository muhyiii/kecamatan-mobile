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
          foregroundColor: Get.isDarkMode ? null : blacky,
          backgroundColor: Get.isDarkMode ? null : whitey,
          iconTheme: IconThemeData(size: global.fontHeading.value - 5),
          elevation: 0,
          title: Text(
            'Pengaduan',
            style: TextStyle(
              fontFamily: 'popSM',
              fontSize: global.fontSet.value + 2,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: greenny,
            unselectedLabelStyle: TextStyle(fontFamily: "popM", fontSize: 13),
            unselectedLabelColor:
                global.isDark.value ? Colors.white : Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontFamily: "popSM", fontSize: 13),
            indicatorColor: greenny,
            isScrollable: Get.width > 720 ? false : true,
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
