import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/kontakPenting/views/kontak_penting_view.dart';
import 'package:sitforsa/app/modules/pelayanan/views/pelayanan_view.dart';
import 'package:sitforsa/app/modules/pengaduan/views/pengaduan_view.dart';
import 'package:sitforsa/app/modules/potensiDesa/views/potensi_desa_view.dart';
import 'package:sitforsa/app/modules/profile/views/profile_view.dart';
import 'package:sitforsa/app/modules/sipahadesi/views/sipahadesi_view.dart';
import 'package:sitforsa/config/style.dart';

class WidgetPelayananView extends GetView {
  var global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 5,
        ),
        width: Get.width * 90 / 100,
        child: Wrap(
          spacing: 1,
          runSpacing: 1,
          // alignment: WrapAlignment.spaceBetween,
          children: [
            itemWidget(Icons.contacts, "Kontak Penting", KontakPentingView()),
            itemWidget(
                Icons.schedule_rounded, "Jadwal SIPAHADESI", SipahadesiView()),
            itemWidget(Icons.receipt_rounded, "SIAPMASJO", PengaduanView()),
            itemWidget(
                Icons.device_unknown_rounded, "Unknown", PotensiDesaView()),
          ],
        ),
      ),
    );
  }

  Widget itemWidget(IconData icon, String text, Widget routeTo) {
    return GestureDetector(
      onTap: () {
        Get.to(() => routeTo);
      },
      child: Card(
        color: Get.isDarkMode ? null : greny,
        elevation: 3,
        child: Container(
          height: Get.width / 5,
          width: Get.width / 5,
          padding: EdgeInsets.symmetric(
              vertical: global.fontSmall.value + 2,
              horizontal: global.fontSmall.value - 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Icon(
                  icon,
                  color: Get.isDarkMode ? null : Colors.black.withOpacity(0.7),
                  size: global.fontHeading.value - 5,
                ),
              ),
              Flexible(
                child: Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: global.fontSet.value - 6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
