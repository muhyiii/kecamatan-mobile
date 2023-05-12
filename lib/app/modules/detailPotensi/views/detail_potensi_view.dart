// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';
import '../controllers/detail_potensi_controller.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class DetailPotensiView extends GetView<DetailPotensiController> {
  final e = Get.arguments;
  String previousRoute = Get.previousRoute;
  @override
  Widget build(BuildContext context) {
    final global = Get.put(GlobalController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Obx(() => Column(
                children: [
                  Container(
                    height: Get.width / 1.5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(e.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Get.back(),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Iconsax.arrow_left_2,
                                    size: global.fontSize.value,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // SliverToBoxAdapter(
                  //   child: Padding(
                  //       padding: EdgeInsets.all(15),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             padding:
                  //                 EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(20), color: abu),
                  //             child: Text(
                  //               e.kategori,
                  //               style: TextStyle(
                  //                 fontSize: global.fontSmall.value + 1,
                  //                 color: Colors.grey.shade700,
                  //                 fontFamily: 'Helvetica Neue',
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       )),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width / 1.5,
                          child: Text(
                            e.namaPotensi,
                            style: TextStyle(
                              fontSize: global.fontSize.value,
                              fontFamily: "popSM",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.width * 0.015,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.location,
                                    color: Colors.grey.shade500,
                                    size: global.fontSize.value - 2,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    e.desa.namaDesa,
                                    style: TextStyle(
                                      fontSize: global.fontSet.value - 1,
                                      color: Colors.grey.shade500,
                                      fontFamily: 'pop',
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () async {
                                  // MapsLauncher.launchCoordinates(
                                  //     e.dasa.latitude, e.desa.longtitude);
                                  await LaunchApp.openApp(
                                    androidPackageName:
                                        'com.google.android.apps.maps',
                                    iosUrlScheme: 'comgooglemaps://',
                                    // iosUrlScheme:
                                    //     'comgooglemaps://geo:${e.desa.latitude},${e.desa.longtitude}',
                                    appStoreLink:
                                        "https://apps.apple.com/us/app/example-app/id1234567890",
                                    openStore: true,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Iconsax.map_1,
                                      color: Color(0xff20B08D),
                                      size: global.fontSize.value - 2,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Arah Peta",
                                      style: TextStyle(
                                        fontSize: global.fontSet.value - 1,
                                        color: Color(0xff20B08D),
                                        fontFamily: 'popM',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: Get.width * 0.02,
                        ),
                        Container(
                          child: Divider(color: abu),
                        ),
                        SizedBox(
                          height: Get.width * 0.02,
                        ),
                        Text(
                          "Keterangan",
                          style: TextStyle(
                              fontSize: global.fontSize.value - 2,
                              fontFamily: "popM"),
                        ),
                        SizedBox(
                          height: Get.width * 0.02,
                        ),
                        Text(
                          e.deskripsi,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: "pop",
                            color: Color(0xff8E8E8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
          // Add more slivers here...
          ),
    )

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Container(
        //         width: size.width,
        //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        //         height: 300,
        //         alignment: Alignment.topLeft,
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: CachedNetworkImageProvider(
        //                   e.thumbnail,
        //                 ),
        //                 fit: BoxFit.cover)),
        //         child: InkWell(
        //           onTap: () => Get.back(),
        //           child: Container(
        //             width: 100,
        //             height: 35,
        //             alignment: Alignment.center,
        //             padding: EdgeInsets.symmetric(horizontal: 12),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(30),
        //               color: Colors.white.withOpacity(0.7),
        //             ),
        //             child: Row(
        //               children: [
        //                 Icon(
        //                   Iconsax.arrow_left,
        //                   size: 17,
        //                 ),
        //                 SizedBox(
        //                   width: 5,
        //                 ),
        //                 Container(
        //                     width: 50,
        //                     child: Text(
        //                       e.namaPotensi,
        //                       overflow: TextOverflow.ellipsis,
        //                       style: TextStyle(
        //                         fontSize: 12,
        //                         fontFamily: "pop",
        //                         fontWeight: FontWeight.w600,
        //                       ),
        //                     )),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: size.width,
        //         height: size.height,
        //         decoration: BoxDecoration(
        //           color: Colors.black,
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.black.withOpacity(0.05),
        //               offset: Offset(-2, 0),
        //             )
        //           ],
        //           borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(12),
        //             topRight: Radius.circular(12),
        //           ),
        //         ),
        //         child: Column(
        //           children: [],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        );
  }
}
