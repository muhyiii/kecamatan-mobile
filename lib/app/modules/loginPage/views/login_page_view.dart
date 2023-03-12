import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';

import 'package:sitforsa/app/views/views/input_text_field_view.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  final global = Get.put(GlobalController());
  var controller = Get.put(LoginPageController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? desa;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              resizeToAvoidBottomInset: true,
              backgroundColor: greeny,
              body: Obx(() => controller.isLoading.value
                  ? Container(
                      color: whitey,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: greeny,
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: Get.width / 5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'SIPAOJOL',
                              style: TextStyle(
                                  fontSize: Get.width / 15,
                                  fontFamily: 'Prompt',
                                  color: whitey),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () => _showBottomSheet(''),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    overlayColor:
                                        MaterialStateProperty.all(greeny),
                                    fixedSize: MaterialStateProperty.all(
                                        Size(250, 50)),
                                    backgroundColor:
                                        MaterialStateProperty.all(whitey)),
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                      color: greeny,
                                      fontFamily: 'Prompt',
                                      fontSize: 20),
                                )),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Belum punya akun?",
                                    style: TextStyle(
                                        color: whitey,
                                        fontFamily: 'Prompt Light',
                                        fontSize: 15),
                                  ),
                                  TextButton(
                                      onPressed: () =>
                                          _showBottomSheet('Daftar'),
                                      child: Text(
                                        'Daftar',
                                        style: TextStyle(
                                            color: whitey,
                                            fontFamily: 'Prompt',
                                            fontSize: 15),
                                      ))
                                ])
                          ],
                        )
                      ],
                    )),
            )));
  }

  void _showBottomSheet(String? type) {
    scaffoldKey.currentState?.showBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        (context) {
      var desa;
      return AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            color: Colors.white,
          ),
          child: StatefulBuilder(builder: (context, setState) {
            return Obx(
              () => controller.isLoading.value
                  ? Container(
                      color: whitey,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: greeny,
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        padding:
                            EdgeInsets.only(right: 30, left: 30, bottom: 50),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                // onTap: () => Get.back(),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Image.asset(
                                      'assets/images/logoGreen.png',
                                      height: Get.width / 4,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      type == 'Daftar'
                                          ? 'Selamat Datang'
                                          : 'Selamat datang kembali!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Helvetica Neue',
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: greenny),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              InputTextFieldView(
                                input: 'NIK',
                                controller: controller.nik,
                              ),
                              if (type == 'Daftar')
                                SizedBox(
                                  height: 15,
                                ),
                              if (type == 'Daftar')
                                InputTextFieldView(
                                  input: 'Nama',
                                  controller: controller.nama,
                                ),
                              SizedBox(
                                height: 15,
                              ),
                              InputTextFieldView(
                                input: 'Password',
                                controller: controller.password,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              if (type == 'Daftar')
                                Container(
                                  width: Get.width,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: greenny, width: 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: DropdownButton(
                                    hint: Text(
                                      'Pilih Desa',
                                      style: TextStyle(color: greeny),
                                    ),
                                    enableFeedback: true,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    menuMaxHeight: Get.width,
                                    value: desa,
                                    style: TextStyle(
                                        color: greeny,
                                        fontFamily: 'Product Sans',
                                        fontSize: global.fontSize.value - 1),
                                    elevation: 1,
                                    items: global.dataDesa.map((value) {
                                      return DropdownMenuItem(
                                        child: Text(value.namaDesa),
                                        value: value.namaDesa,
                                        onTap: () {
                                          controller.id_desa = value.id;
                                        },
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() => desa = value);
                                    },
                                  ),
                                ),
                              if (type == 'Daftar')
                                SizedBox(
                                  height: 20,
                                ),
                              ElevatedButton(
                                  onPressed: () {
                                    // if (type == 'daftar') {
                                    //   if (controller.password.value.text.length <
                                    //           1 &&
                                    //       controller.nik.value.text.length <
                                    //           1 &&
                                    //       controller.nama.value.text.length <
                                    //           1 &&
                                    //       controller.id_desa == null)
                                    //     return;
                                    //   else {
                                        controller.register();
                                    //   }
                                    // } else {
                                    //   if (controller
                                    //               .password.value.text.length <
                                    //           1 &&
                                    //       controller.nik.value.text.length <
                                    //           1) {
                                    //     return;
                                    //   } else {
                                    //     controller.login();
                                    //   }
                                    // }
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      overlayColor:
                                          MaterialStateProperty.all(whitey),
                                      fixedSize: MaterialStateProperty.all(
                                          Size(Get.width, 50)),
                                      backgroundColor:
                                          MaterialStateProperty.all(greeny)),
                                  child: Text(
                                    type == 'Daftar'
                                        ? type.toString()
                                        : 'Masuk',
                                    style: TextStyle(
                                        color: whitey,
                                        fontFamily: 'Prompt',
                                        fontSize: 25),
                                  )),
                              if (type == 'Daftar')
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Sudah punya akun?",
                                        style: TextStyle(
                                            color: greenny,
                                            fontFamily: 'Prompt Light',
                                            fontSize: 15),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                            Timer(Duration(milliseconds: 500),
                                                () {
                                              _showBottomSheet('');
                                            });
                                          },
                                          child: Text(
                                            'Masuk',
                                            style: TextStyle(
                                                color: greenny,
                                                fontFamily: 'Prompt',
                                                fontSize: 15),
                                          ))
                                    ]),
                              SizedBox(
                                height: Get.width / 5,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          }));
    });
  }
}
