import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/modules/profile/controllers/profile_controller.dart';
import 'package:sitforsa/app/views/views/input_text_field_profile.dart';
import 'package:sitforsa/config/style.dart';

class ProfileFormView extends GetView<ProfileController> {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? null : whitey,
            foregroundColor: Get.isDarkMode ? null : greenny,
            elevation: 0,
            title: Text(
              'Data Anda',
              style: TextStyle(fontFamily: 'Helvetica Neue Bold'),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () => controller.editProfile(),
                  child: Text('Simpan',
                      style: TextStyle(color: greeny)))
            ],
          ),
          body: Obx(() => controller.isLoading.value
              ? Container(
                  color: whitey,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: greeny,
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nama',
                        controller: controller.nama,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'NIK',
                        controller: controller.nik,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Alamat',
                        controller: controller.alamat,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'RT',
                        controller: controller.rt,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'RW',
                        controller: controller.rw,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nomor KK',
                        controller: controller.nomor_kk,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Jenis Kelamin',
                        controller: controller.jenis_kelamin,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Tempat Lahir',
                        controller: controller.tempat_lahir,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Tanggal Lahir',
                        controller: controller.tanggal_lahir,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Agama',
                        controller: controller.agama,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Pendidikan Dalam KK',
                        controller: controller.pendidikan_dalam_kk,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Pendidikan Yang Sedang Ditempuh',
                        controller: controller.pendidikan_sedang_ditempuh,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Pekerjaan',
                        controller: controller.pekerjaan,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Kawin',
                        controller: controller.kawin,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Hubungan Keluarga',
                        controller: controller.hubungan_keluarga,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Kewarganegaraan',
                        controller: controller.kewarganegaraan,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nama Ayah',
                        controller: controller.nama_ayah,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'NIK Ayah',
                        controller: controller.nik_ayah,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nama Ibu',
                        controller: controller.nama_ibu,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'NIK Ibu',
                        controller: controller.nik_ibu,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Golongan Darah',
                        controller: controller.golongan_darah,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Akta Lahir',
                        controller: controller.akta_lahir,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nomor Dokumen Paspor',
                        controller: controller.nomor_dokumen_paspor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Tanggal Akhir Passport',
                        controller: controller.tanggal_akhir_passport,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nomor Dokumen KITAS',
                        controller: controller.nomor_dokumen_KITAS,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nomor Akta Perkawinan',
                        controller: controller.nomor_akta_perkawinan,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Tanggal Perkawinan',
                        controller: controller.tanggal_perkawinan,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Nomor Akta Cerai',
                        controller: controller.nomor_akta_cerai,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Tanggal Perceraian',
                        controller: controller.tanggal_perceraian,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Cacat',
                        controller: controller.cacat,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Cara KB',
                        controller: controller.cara_kb,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InputTextFieldProfile(
                        input: 'Hamil',
                        controller: controller.hamil,
                      ),
                    ],
                  ),
                )),
        ));
  }
}
