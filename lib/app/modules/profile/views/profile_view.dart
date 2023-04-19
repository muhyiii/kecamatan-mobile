import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/loginPage/controllers/login_page_controller.dart';
import 'package:sitforsa/app/modules/profile/views/profile_form_view.dart';
import 'package:sitforsa/config/style.dart';
import 'package:iconsax/iconsax.dart';
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
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(fontFamily: 'Helvetica Neue Bold'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.nama.value.text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: global.fontSize.value),
                    ),
                    Text(
                      controller.nik.value.text,
                      style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: global.fontSet.value - 2),
                    )
                  ],
                )
              ],
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => Get.to(() => ProfileFormView()),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.black,
                          size: 22,
                        ),
                        title: Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontFamily: "pop",
                              fontSize: global.fontSet.value,
                              fontWeight: FontWeight.w500),
                        ),
                        minLeadingWidth: 0,
                      ),
                      Material(
                        // elevation: 2,
                        child: Container(
                          // margin: EdgeInsets.only(top: 10),
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode ? null : whitey,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pengajuan Saya'),
                              Divider(thickness: 0.5),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Row(children: [
                                  cardPengaduan(
                                      icon: Iconsax.timer_1,
                                      text: 'Menunggu Respon'),
                                  cardPengaduan(
                                      icon: Iconsax.sms_tracking,
                                      text: 'Diproses'),
                                  cardPengaduan(
                                      icon: Iconsax.tick_circle,
                                      text: 'Selesai'),
                                  cardPengaduan(
                                      icon: Iconsax.close_circle,
                                      text: 'Ditolak')
                                ]),
                              ),
                              Divider(),
                              // Text(global.token.value)
                            ],
                          ),
                        ),
                      ),
                      Material(
                        // elevation: 2,
                        child: Container(
                          // margin: EdgeInsets.only(top: 15),
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
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
                                        icon: Iconsax.timer_1,
                                        text: 'Menunggu Respon'),
                                    cardPengaduan(
                                        icon: Iconsax.sms_tracking,
                                        text: 'Diproses'),
                                    cardPengaduan(
                                        icon: Iconsax.tick_circle,
                                        text: 'Selesai'),
                                    cardPengaduan(
                                        icon: Iconsax.close_circle,
                                        text: 'Ditolak')
                                  ],
                                ),
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.black,
                          size: 22,
                        ),
                        minLeadingWidth: 0,
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontFamily: "pop",
                              fontSize: global.fontSet.value,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Get.dialog(
                            barrierDismissible: true,
                            transitionCurve: Curves.fastLinearToSlowEaseIn,
                            AlertDialog(
                              title: Text('Kamu yakin?'),
                              content: Text(
                                  'Kamu Harus Login Kembali Untuk Menggunakan Aplikasi.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    'Tidak',
                                    style: TextStyle(color: greeny),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async =>
                                      await controllerAccount.logout(),
                                  child: Text(
                                    'Yakin',
                                    style: TextStyle(color: greeny),
                                  ),
                                ),
                              ],
                            ),
                          );
                          // Get.defaultDialog(
                          //     buttonColor: greeny,
                          //     barrierDismissible: true,
                          //     title: 'Kamu yakin?',
                          //     titleStyle:
                          //         TextStyle(fontFamily: 'Helvetica Neue'),
                          //     content: Text(
                          //       'Kamu akan logout dari akunmu.',
                          //       textAlign: TextAlign.center,
                          //       style: TextStyle(fontFamily: 'Helvetica Neue'),
                          //     ),
                          //     textConfirm: 'Yakin',
                          //     onConfirm: () async =>
                          //         await controllerAccount.logout(),
                          //     confirmTextColor: whitey,
                          //     textCancel: 'Tidak',
                          //     onCancel: () => Get.back(),
                          //     cancelTextColor: greeny);
                        },
                      ),
                    ],
                  ),
                  // if (
                  // // controller.nama.value.text == "" &&
                  // //   controller.nik.value.text == "" &&
                  // // controller.alamat.value.text == "" &&
                  // //     controller.rt.value.text == "" &&
                  // //     controller.rw.value.text == "" &&
                  // //     controller.nomor_kk.value.text == "" &&
                  // //     controller.jenis_kelamin.value.text == "" &&
                  // //     controller.tempat_lahir.value.text == "" &&
                  // //     controller.tanggal_lahir.value.text == "" &&
                  // //     controller.agama.value.text == "" &&
                  // //     controller.pendidikan_dalam_kk.value.text == "" &&
                  // //     controller.pendidikan_sedang_ditempuh.value.text == "" &&
                  // //     controller.pekerjaan.value.text == "" &&
                  // //     controller.kawin.value.text == "" &&
                  // //     controller.hubungan_keluarga.value.text == "" &&
                  // //     controller.kewarganegaraan.value.text == "" &&
                  // //     controller.nama_ayah.value.text == "" &&
                  // //     controller.nik_ayah.value.text == "" &&
                  // //     controller.nama_ibu.value.text == "" &&
                  // //     controller.nik_ibu.value.text == "" &&
                  // //     controller.golongan_darah.value.text == "" &&
                  // //     controller.akta_lahir.value.text == "" &&
                  // //     controller.nomor_dokumen_paspor.value.text == "" &&
                  // //     controller.tanggal_akhir_passport.value.text == "" &&
                  // //     controller.nomor_dokumen_KITAS.value.text == "" &&
                  // //     controller.nomor_akta_perkawinan.value.text == "" &&
                  // //     controller.tanggal_perkawinan.value.text == "" &&
                  // //     controller.nomor_akta_cerai.value.text == "" &&
                  // //     controller.tanggal_perceraian.value.text == "" &&
                  // //     controller.cacat.value.text == "" &&
                  // //     controller.cara_kb.value.text == "" &&
                  // //     controller.hamil.value.text == "" &&
                  // //     controller.alamat_sekarang.value.text == ""

                  //     )
                  if (!controller.tes.value)
                    GestureDetector(
                      onTap: () => controller.tes.value = true,
                      child: Container(
                        height: Get.height * 7 / 10,
                        color: Colors.white70,
                        child: Align(
                          child: Material(
                            elevation: 2,
                            color: whitey,
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              // width: Get.width,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: whitey,
                              ),
                              padding: EdgeInsets.all(15),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Anda Belum Bisa Mengakses Layanan. Mohon Lengkapi Data Anda Terlebih Dahulu.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Helvetica Neue Bold'),
                                    ),
                                    SizedBox(
                                      height: Get.width / 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Get.to(() => ProfileFormView());
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => greeny)),
                                        child: Text('Lengkapi'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ));
    });
  }

  Widget cardPengaduan({IconData? icon, String? text}) {
    return Expanded(
        child: Card(
      elevation: 0,
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: greenny,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text.toString(),
              maxLines: 1,
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
