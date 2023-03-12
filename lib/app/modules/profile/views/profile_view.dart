import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/loginPage/controllers/login_page_controller.dart';
import 'package:sitforsa/app/modules/loginPage/views/login_page_view.dart';
import 'package:sitforsa/app/views/views/input_text_field_view.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  var controller = Get.put(ProfileController());
  var global = Get.put(GlobalController());
  var controllerAccount = Get.put(LoginPageController());
  var a = [1, 1, 3];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: Get.isDarkMode ? null : whitey,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? null : greny,
            foregroundColor: Get.isDarkMode ? null : blacky,
            elevation: 0,
            toolbarHeight: 130,
            title: Column(
              children: [
                GestureDetector(
                  onTap: () => print(controller.dataPengguna),
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(fontFamily: 'Helvetica Neue Bold'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.dataPengguna['nama'] ?? 'Memuat Nama..',
                      // 'asd',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Helvetica Neue Medium',
                          fontSize: global.fontSize.value + 10),
                    ),
                    Text(
                      controller.dataPengguna['nik'] ?? 'Memuat NIK',
                      // 'asd',
                      style: TextStyle(
                          fontFamily: 'Helvetica Neue Medium',
                          fontSize: global.fontSet.value - 2),
                    )
                  ],
                )
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? null : whitey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pengajuan Saya'),
                      Divider(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(children: [
                          cardPengaduan(
                              icon: Icons.message_rounded,
                              text: 'Menunggu Respon'),
                          cardPengaduan(
                              icon: Icons.download_for_offline_rounded,
                              text: 'Diproses'),
                          cardPengaduan(
                              icon: Icons.done_all_rounded, text: 'Selesai')
                        ]),
                      ),
                      Divider(),
                      // Text(global.token.value)
                    ],
                  ),
                ),
              ),
              Material(
                elevation: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? null : whitey,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pengaduan Saya'),
                      Divider(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            cardPengaduan(
                                icon: Icons.message_rounded,
                                text: 'Menunggu Respon'),
                            cardPengaduan(
                                icon: Icons.download_for_offline_rounded,
                                text: 'Diproses'),
                            cardPengaduan(
                                icon: Icons.done_all_rounded, text: 'Selesai')
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    Get.defaultDialog(
                        buttonColor: greeny,
                        barrierDismissible: true,
                        title: 'Kamu yakin?',
                        titleStyle: TextStyle(fontFamily: 'Helvetica Neue'),
                        content: Text(
                          'Kamu akan logout dari akunmu.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Helvetica Neue'),
                        ),
                        textConfirm: 'Yakin',
                        onConfirm: () async => await controllerAccount.logout(),
                        confirmTextColor: whitey,
                        textCancel: 'Tidak',
                        onCancel: () => Get.back(),
                        cancelTextColor: greeny);
                  },
                ),
              )
            ],
          ));
    });
  }

  Widget cardPengaduan({IconData? icon, String? text}) {
    return Expanded(
        child: Card(
      elevation: 0,
      color: greny,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            SizedBox(
              height: 10,
            ),
            Text(
              text.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Helvetica Neue Medium',
                  fontSize: global.fontSmall.value),
            )
          ],
        ),
      ),
    ));
  }
}
