import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/potensiDesa/controllers/potensi_desa_controller.dart';
import 'package:sitforsa/config/style.dart';
// import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shimmer/shimmer.dart';

class WidgetJadwalView extends StatefulWidget {
  const WidgetJadwalView({super.key});

  @override
  State<WidgetJadwalView> createState() => Widget_JadwalStateView();
}

class Widget_JadwalStateView extends State<WidgetJadwalView> {
  final global = Get.put(GlobalController());
  final controller = Get.put(PotensiDesaController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jadwal Kecamatan",
                    style: TextStyle(
                      fontFamily: "pop",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Wrap(
                          spacing: 8,
                          children: List.generate(
                              3,
                              (index) => Container(
                                    width: Get.width / 2.1,
                                    height: Get.width / 3,
                                    padding:
                                        EdgeInsets.all(global.fontSmall.value),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[200]!,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey.shade100,
                                            ),
                                            child: Icon(
                                              Iconsax.calendar_2,
                                              color: greenny,
                                              size: global.fontSize.value + 4,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey[200]!,
                                              highlightColor: Colors.white,
                                              child: Container(
                                                width: Get.width,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Shimmer.fromColors(
                                              baseColor: Colors.grey[200]!,
                                              highlightColor: Colors.white,
                                              child: Container(
                                                width: Get.width / 3,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jadwal Kecamatan",
                    style: TextStyle(
                      fontFamily: "popM",
                      // fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Wrap(
                          spacing: 8,
                          children: List.generate(
                              3,
                              (index) => Container(
                                    width: Get.width / 2,
                                    height: Get.width / 3,
                                    padding:
                                        EdgeInsets.all(global.fontSmall.value),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.grey.shade100,
                                          ),
                                          child: Icon(
                                            Iconsax.calendar_2,
                                            color: greenny,
                                            size: global.fontSize.value + 4,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Get.width,
                                              child: AutoSizeText(
                                                "Pembinaan Desa",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontFamily: "popM",
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "17 Maret 2023 10:02",
                                              style: TextStyle(
                                                fontFamily: 'pop',
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
    });
  }
}
