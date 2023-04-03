import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/kontakPenting/views/kontak_penting_view.dart';
import 'package:sitforsa/app/modules/pengaduan/views/pengaduan_view.dart';
import 'package:sitforsa/app/modules/potensiDesa/views/potensi_desa_view.dart';
import 'package:sitforsa/app/modules/sipahadesi/views/sipahadesi_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sitforsa/config/style.dart';

class WidgetPelayananView extends GetView {
  var global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: global.fontSet.value,
        ),
        width: Get.width,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          children: [
            itemWidget(Iconsax.call, "Kontak Penting", KontakPentingView()),
            itemWidget(
                Iconsax.calendar_1, "Jadwal SIPAHADESI", SipahadesiView()),
            itemWidget(Iconsax.volume_high, "SIAPMASJO", PengaduanView()),
            itemWidget(Iconsax.building_4, "TENDES", PotensiDesaView()),
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: global.fontSet.value + 1,
                horizontal: global.fontSet.value + 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? null : Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //       blurStyle: BlurStyle.solid,
              //       offset: Offset(1.5, 2.5),
              //       color: Colors.grey.shade200)
              // ],
            ),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Get.isDarkMode ? null : greenny,
                  size: global.fontSize.value + 2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: Get.width / 5.5,
            child: Text(
              text,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'pop',
                  fontSize: global.fontSet.value - 2.5,
                  height: 1.4,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
