import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/pengajuan_controller.dart';

class PengajuanView extends GetView<PengajuanController> {
  final tab = Get.put(PengajuanController());
  var global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          foregroundColor: Get.isDarkMode ? null : greenny,
          backgroundColor: Get.isDarkMode ? null : whitey,
          elevation: 0,
          title: Text(
            'PengajuanView',
            style: TextStyle(
              fontFamily: 'popSM',
              fontSize: global.fontSet.value + 3,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: greenny,
            unselectedLabelColor: Colors.black,
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
