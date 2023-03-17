import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/kontak_penting_controller.dart';

class KontakPentingView extends GetView<KontakPentingController> {
  final global = Get.put(GlobalController());
  final controller = Get.put(KontakPentingController());
  void refreshAll() {
    controller.getKontak();
  }

  @override
  Widget build(BuildContext context) {
    log(controller.dataKontak.toString());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Get.isDarkMode ? null : greenny,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? null : whitey,
        title: Text(
          'Kontak Penting',
          style: TextStyle(
            fontFamily: 'Product Sans',
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async => refreshAll(),
        color: greeny,
        child: Container(
          child: controller.dataKontak.length == 0
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.cent,
                    children: [
                      LottieBuilder.network(
                        'https://assets1.lottiefiles.com/private_files/lf30_cgfdhxgx.json',
                        height: Get.width / 2,
                      ),
                      Text('Tidak Ada Kontak Yang Bisa Ditampilkan')
                    ],
                  ),
                )
              : ListView.separated(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.dataKontak.length,
                  itemBuilder: (context, index) {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Card(
                          child: ListTile(
                            title: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: Text(
                                controller.dataKontak[index].nama,
                                style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: global.fontSize.value),
                              ),
                            ),
                            subtitle: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.white,
                                child: Text(controller.dataKontak[index].noHp)),
                          ),
                        ),
                      );
                    }
                    return Card(
                      child: ListTile(
                        title: Text(
                          controller.dataKontak[index].nama,
                          style: TextStyle(
                              fontFamily: 'Helvetica Neue',
                              fontSize: global.fontSize.value),
                        ),
                        subtitle: Text(controller.dataKontak[index].noHp),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
