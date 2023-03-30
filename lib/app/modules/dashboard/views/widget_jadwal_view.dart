import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:iconly/iconly.dart';
import 'package:sitforsa/config/style.dart';

class WidgetJadwalView extends StatefulWidget {
  const WidgetJadwalView({super.key});

  @override
  State<WidgetJadwalView> createState() => Widget_JadwalStateView();
}

class Widget_JadwalStateView extends State<WidgetJadwalView> {
  final global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Jadwal Kecamatan"),
          SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 0.8, color: Colors.grey.shade400),
              ),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: greny,
                  ),
                  child: Icon(
                    IconlyBold.calendar,
                    color: greenny,
                  ),
                ),
                title: Text(
                  "Pembinaan Desa",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue Bold",
                    fontSize: global.fontSet.value + 1,
                  ),
                ),
                subtitle: Text(
                  "17 Maret 2023 10:02",
                  style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: global.fontSet.value - 1),
                ),
                trailing: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: greny, borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Selengkapnya",
                    style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: global.fontSet.value - 2,
                        color: greenny),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
