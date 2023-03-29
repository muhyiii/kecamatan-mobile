import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../config/style.dart';
import '../../berita/views/detail_berita_view.dart';

class WidgetBeritaView extends StatefulWidget {
  const WidgetBeritaView({super.key});

  @override
  State<WidgetBeritaView> createState() => _WidgetBeritaViewState();
}

class _WidgetBeritaViewState extends State<WidgetBeritaView> {
  var controller = Get.put(BeritaController());
  var global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Text(
                'Berita Terkini',
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
                    : controller.isLoading.value
                        ? Column(
                            children: controller.dataBerita
                                .getRange(0, 2)
                                .map((element) => Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                elevation: 2,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor: Colors.white,
                                                  child: Container(
                                                    height: Get.width / 3,
                                                    width: Get.width / 2.7,
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
                                              flex: 3,
                                              child: Container(
                                                height: Get.width / 3,
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
                                                            Colors.grey[300]!,
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
                                                            color: Colors
                                                                .blueGrey
                                                                .withOpacity(
                                                                    0.6),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
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
                                                              Colors.grey[300]!,
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
                                                              Colors.grey[300]!,
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
                                            transition: Transition.fadeIn,
                                            duration:
                                                Duration(milliseconds: 1000));
                                        controller.isSearch.value = false;
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  elevation: 5,
                                                  child: Container(
                                                    height: Get.width / 3,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
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
                                                flex: 3,
                                                child: Container(
                                                  height: Get.width / 3,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          index.judul,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              fontSize: global
                                                                      .fontSize
                                                                      .value -
                                                                  5,
                                                              fontFamily:
                                                                  'Helvetica Neue'),
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            timeago.format(
                                                              index.createdAt,
                                                              locale: 'id',
                                                            ),
                                                            style: TextStyle(
                                                                fontSize: global
                                                                    .fontSmall
                                                                    .value,
                                                                color: grayNav,
                                                                fontFamily:
                                                                    'Helvetica Neue Medium'),
                                                          ),
                                                          Text(
                                                            index.author
                                                                .username,
                                                            style: TextStyle(
                                                                fontSize: global
                                                                        .fontSmall
                                                                        .value +
                                                                    1,
                                                                color: grayNav,
                                                                fontFamily:
                                                                    'Helvetica Neue Medium'),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )),
          ],
        ),
      );
    });
  }
}
