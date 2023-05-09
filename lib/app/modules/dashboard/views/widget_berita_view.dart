import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:sitforsa/app/modules/potensiDesa/controllers/potensi_desa_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../berita/views/detail_berita_view.dart';

class WidgetBeritaView extends StatefulWidget {
  const WidgetBeritaView({super.key});

  @override
  State<WidgetBeritaView> createState() => _WidgetBeritaViewState();
}

class _WidgetBeritaViewState extends State<WidgetBeritaView> {
  var controller = Get.put(BeritaController());
  final loading = Get.put(PotensiDesaController());
  var global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berita Terkini',
                    style: TextStyle(fontFamily: "popM"),
                  ),
                  Text(
                    "Lihat lebih banyak",
                    style: TextStyle(
                      fontFamily: "pop",
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            ),
            Container(
              // height: Get.height,
              child: controller.dataBerita.length == 0
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.cent,
                        children: [
                          LottieBuilder.network(
                            'https://assets1.lottiefiles.com/private_files/lf30_cgfdhxgx.json',
                            height: Get.width / 2,
                          ),
                          Text('Tidak Ada Berita Yang Bisa Ditampilkan')
                        ],
                      ),
                    )
                  : loading.isLoading.value
                      ? Column(
                          children: controller.dataBerita
                              .getRange(0, 2)
                              .map((element) => Card(
                                    elevation: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.grey[200]!,
                                                highlightColor: Colors.white,
                                                child: Container(
                                                  height: Get.width / 4.2,
                                                  // width: Get.width / 2.7,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blueGrey
                                                        .withOpacity(0.6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              height: Get.width / 3.7,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.s,
                                                children: [
                                                  Expanded(
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[200]!,
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                        child: Text(
                                                          'Jelang tahun baru orang - orang pada shoalat',
                                                          style: TextStyle(
                                                              fontSize: global
                                                                      .fontSize
                                                                      .value -
                                                                  5,
                                                              color: Colors
                                                                  .transparent,
                                                              fontFamily:
                                                                  'Helvetica Neue'),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.blueGrey
                                                              .withOpacity(0.6),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[200]!,
                                                        highlightColor:
                                                            Colors.white,
                                                        child: Container(
                                                            child: Text(
                                                              '40 menit yang lalu',
                                                              style: TextStyle(
                                                                  fontSize: global
                                                                          .fontSmall
                                                                          .value +
                                                                      1,
                                                                  color: Colors
                                                                      .transparent,
                                                                  fontFamily:
                                                                      'Helvetica Neue Medium'),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .withOpacity(
                                                                      0.6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[200]!,
                                                        highlightColor:
                                                            Colors.white,
                                                        child: Container(
                                                            child: Text(
                                                              'by Farah Sadika',
                                                              style: TextStyle(
                                                                  fontSize: global
                                                                          .fontSmall
                                                                          .value +
                                                                      1,
                                                                  color: Colors
                                                                      .transparent,
                                                                  fontFamily:
                                                                      'Helvetica Neue Medium'),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey
                                                                  .withOpacity(
                                                                      0.6),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            )),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        )
                      : Column(
                          children: controller.dataBerita
                              .map((index) => GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailBeritaView(),
                                          arguments: index,
                                          transition: Transition.native,
                                          duration:
                                              Duration(milliseconds: 700));
                                      controller.isSearch.value = false;
                                    },
                                    child: Container(
                                      // elevation: 0,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Material(
                                              // borderRadius:
                                              //     BorderRadius.circular(20),
                                              // elevation: 5,
                                              child: Container(
                                                height: Get.width / 4.5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          index.thumbnail,
                                                        ),
                                                        fit: BoxFit.cover,
                                                        alignment: Alignment
                                                            .topCenter)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              height: Get.width / 3.7,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 8,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      index.judul,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontSize: global
                                                            .fontSet.value,
                                                        fontFamily: 'popSM',
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        index.author.username,
                                                        style: TextStyle(
                                                            fontSize: global
                                                                    .fontSet
                                                                    .value -
                                                                2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.grey,
                                                            fontFamily: "pop"),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                          "•",
                                                          style: TextStyle(
                                                              fontSize: global
                                                                  .fontSmall
                                                                  .value,
                                                              color:
                                                                  Colors.grey,
                                                              fontFamily:
                                                                  'pop'),
                                                        ),
                                                      ),
                                                      Text(
                                                        timeago.format(
                                                          index.createdAt,
                                                          locale: 'id',
                                                        ),
                                                        style: TextStyle(
                                                            fontSize: global
                                                                    .fontSet
                                                                    .value -
                                                                2,
                                                            color: Colors.grey,
                                                            fontFamily: 'pop'),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
            ),
          ],
        ),
      );
    });
  }
}
