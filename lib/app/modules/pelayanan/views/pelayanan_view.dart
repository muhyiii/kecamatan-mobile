import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/detailPelayanan/views/detail_pelayanan_view.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/pelayanan_controller.dart';

class PelayananView extends GetView<PelayananController> {
  var global = Get.put(GlobalController());
  final controller = Get.put(PelayananController());
  var perizinan = [
    "Izin Pemakaman",
    "Izin Spanduk dan Umbul-umbul di luar ruangan",
    "Izin Penyelenggaraan PAUD non formal"
  ];
  var nonPerizinan = [
    "Pernyataan Waris",
    "SKCK",
    "Pernyataan Haji",
    "Pengantar Bank",
    "SKKM",
    "Surat Pindah",
    "Proposal",
    "Dispensasi Nikah",
    "Legalisir",
    "Izin Keramaian",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        backgroundColor: Get.isDarkMode ? null : whitey,
        elevation: 0,
        title: Text(
          'Pelayanan',
          style: TextStyle(fontFamily: 'Helvetica Neue Bold'),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: Get.width / 10, vertical: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: controller.isLoading.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Card(
                          color: Get.isDarkMode ? null : greny,
                          child: ExpansionTile(
                              leading: Icon(
                                  Icons.system_security_update_warning_rounded),
                              initiallyExpanded: false,
                              textColor: Get.isDarkMode ? null : blacky,
                              backgroundColor:
                                  Get.isDarkMode ? Colors.grey : whitey,
                              iconColor: Get.isDarkMode ? null : blacky,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              title: Text(
                                'Perizinan',
                                style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: global.fontSize.value),
                              ),
                              children: perizinan
                                  .map((e) => Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey))),
                                        child: ListTile(
                                            trailing: Icon(
                                                Icons.chevron_right_rounded),
                                            enableFeedback: true,
                                            selectedColor: greeny,
                                            // onTap: () => Get.to(
                                            //     () => DetailPelayananView(),
                                            //     arguments: e),
                                            title: Text(
                                              e,
                                              style: TextStyle(
                                                  fontSize:
                                                      global.fontSet.value),
                                            )),
                                      ))
                                  .toList()),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Card(
                          color: Get.isDarkMode ? null : greny,
                          child: ExpansionTile(
                              leading: Icon(
                                  Icons.system_security_update_warning_rounded),
                              initiallyExpanded: false,
                              textColor: Get.isDarkMode ? null : blacky,
                              backgroundColor:
                                  Get.isDarkMode ? Colors.grey : whitey,
                              iconColor: Get.isDarkMode ? null : blacky,
                              title: Text(
                                'Non Perizinan',
                                style: TextStyle(fontFamily: 'Helvetica Neue'),
                              ),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: nonPerizinan
                                  .map((e) => Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey))),
                                        child: ListTile(
                                            trailing: Icon(
                                                Icons.chevron_right_rounded),
                                            enableFeedback: true,
                                            selectedColor: greeny,
                                            // onTap: () => Get.to(
                                            //     () => DetailPelayananView(),
                                            //     arguments: e),
                                            title: Text(
                                              e,
                                              style: TextStyle(
                                                  fontSize:
                                                      global.fontSet.value),
                                            )),
                                      ))
                                  .toList()),
                        ),
                      ),
                      // ListTile.divideTiles(tiles: tiles)
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Get.isDarkMode ? null : greny,
                        child: ExpansionTile(
                            leading: Icon(
                                Icons.system_security_update_warning_rounded),
                            initiallyExpanded: false,
                            textColor: Get.isDarkMode ? null : blacky,
                            backgroundColor:
                                Get.isDarkMode ? Colors.grey : whitey,
                            iconColor: Get.isDarkMode ? null : blacky,
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            title: Text(
                              'Perizinan',
                              style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: global.fontSize.value),
                            ),
                            children: perizinan
                                .map((e) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey))),
                                      child: ListTile(
                                          trailing:
                                              Icon(Icons.chevron_right_rounded),
                                          enableFeedback: true,
                                          selectedColor: greeny,
                                          onTap: () => Get.to(
                                              () => DetailPelayananView(),
                                              arguments:
                                                  controller.dataPelayanan[0]),
                                          title: Text(
                                            e,
                                            style: TextStyle(
                                                fontSize: global.fontSet.value),
                                          )),
                                    ))
                                .toList()),
                      ),
                      Card(
                        color: Get.isDarkMode ? null : greny,
                        child: ExpansionTile(
                            leading: Icon(
                                Icons.system_security_update_warning_rounded),
                            initiallyExpanded: false,
                            textColor: Get.isDarkMode ? null : blacky,
                            backgroundColor:
                                Get.isDarkMode ? Colors.grey : whitey,
                            iconColor: Get.isDarkMode ? null : blacky,
                            title: Text(
                              'Non Perizinan',
                              style: TextStyle(fontFamily: 'Helvetica Neue'),
                            ),
                            expandedCrossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: nonPerizinan
                                .map((e) => Container(
                                      margin: EdgeInsets.symmetric(vertical: 1),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey))),
                                      child: ListTile(
                                          trailing:
                                              Icon(Icons.chevron_right_rounded),
                                          enableFeedback: true,
                                          selectedColor: greeny,
                                          onTap: () => Get.to(
                                              () => DetailPelayananView(),
                                              arguments:
                                                  controller.dataPelayanan[0]),
                                          title: Text(
                                            e,
                                            style: TextStyle(
                                                fontSize: global.fontSet.value),
                                          )),
                                    ))
                                .toList()),
                      ),
                      // ListTile.divideTiles(tiles: tiles)
                    ],
                  ),
          )),
    );
  }
}
