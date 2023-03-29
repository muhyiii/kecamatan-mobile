import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:sitforsa/app/modules/dashboard/views/widget_berita_view.dart';
import 'package:sitforsa/app/modules/dashboard/views/widget_pelayanan_view.dart';
import 'package:sitforsa/app/modules/dashboard/views/widget_potensi_desa_view.dart';

import 'package:sitforsa/config/style.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final controller = Get.put(DashboardController());
  
  final global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Get.isDarkMode ? null : greny,
          foregroundColor: Get.isDarkMode ? null : blacky,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => BeritaController().getBerita(),
                child: Text('Selamat Pagi')),
              Text(
                controller.formattedDate.toString(),
                style: TextStyle(fontSize: global.fontSet.value - 2),
              ),
            ],
          ),
          actions: [
            FlutterSwitch(
                activeColor: Color.fromARGB(255, 132, 125, 91),
                inactiveColor: Color.fromARGB(255, 113, 111, 111),
                activeText: "Terang",
                inactiveText: "Gelap",
                toggleSize: 20,
                activeIcon: Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFF8E3A1),
                ),
                inactiveIcon: Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFFFDF5D),
                ),
                activeToggleColor: Color.fromARGB(255, 153, 167, 170),
                inactiveToggleColor: Color.fromARGB(255, 0, 0, 0),
                valueFontSize: 8.0,
                width: 70,
                borderRadius: 30.0,
                showOnOff: true,
                value: !global.isDark.value,
                onToggle: (val) => global.change()),
            SizedBox(
              width: 5,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                WidgetPotensiDesaView(),
                WidgetPelayananView(),
                WidgetBeritaView()
              ],
            ),
          ),
        ),
      );
    });
  }
}
