import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/views/detail_berita_view.dart';

import 'package:sitforsa/config/style.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../controllers/berita_controller.dart';

class BeritaView extends StatefulWidget {
  @override
  State<BeritaView> createState() => _BeritaViewState();
}

class _BeritaViewState extends State<BeritaView> {
  final controller = Get.put(BeritaController());

  var global = Get.put(GlobalController());

  void refreshAll() {
    controller.getBerita();
    controller.isSearch.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            backgroundColor: whitey,
            appBar: AppBar(
              foregroundColor: Get.isDarkMode ? null : greenny,
              elevation: 0,
              backgroundColor: Get.isDarkMode ? null : whitey,
              title: controller.isSearch.value
                  ? TextField(
                      style: TextStyle(
                        color: greeny,
                        fontFamily: 'Product Sans',
                      ),
                      decoration: InputDecoration(
                          prefixIconColor: greenny,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search_rounded)),
                          suffixIconColor: greenny,
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  controller.isSearch.value = false,
                              icon: Icon(Icons.cancel_rounded)),
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(color: greeny),
                          contentPadding: EdgeInsets.all(10),
                          focusColor: greeny,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greenny, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: greeny, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: greenny, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Cari Berita'))
                  : Text(
                      'Berita',
                      style: TextStyle(
                        fontFamily: 'pop',
                        fontSize: global.fontSet.value + 3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              centerTitle: true,
              actions: [
                if (controller.isSearch.value == false)
                  IconButton(
                      onPressed: () {
                        controller.isSearch.value = !controller.isSearch.value;
                      },
                      icon: Icon(
                        Icons.search_rounded,
                        size: 27,
                      ))
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async => refreshAll(),
              color: greeny,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: controller.dataBerita.length == 0
                        ? Center(
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
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: controller.dataBerita.length,
                            itemBuilder: (context, index) {
                              if (controller.isLoading.value)
                                return Card(
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
                                                      BorderRadius.circular(8),
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
                                                      decoration: BoxDecoration(
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
                                                      CrossAxisAlignment.start,
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
                                );
                              else
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => DetailBeritaView(),
                                        arguments: controller.dataBerita[index],
                                        transition: Transition.native,
                                        duration: Duration(milliseconds: 700));
                                    controller.isSearch.value = false;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Hero(
                                              tag: controller
                                                  .dataBerita[index].thumbnail,
                                              child: Container(
                                                height: Get.width / 4.2,
                                                // width: Get.width / 2.7,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    image: DecorationImage(
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          controller
                                                              .dataBerita[index]
                                                              .thumbnail,
                                                        ),
                                                        fit: BoxFit.cover,
                                                        alignment: Alignment
                                                            .topCenter)),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    controller.dataBerita[index]
                                                        .judul,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: global
                                                            .fontSet.value,
                                                        fontFamily: 'pop',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller
                                                          .dataBerita[index]
                                                          .author
                                                          .username,
                                                      style: TextStyle(
                                                          fontSize: global
                                                                  .fontSmall
                                                                  .value -
                                                              1,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey,
                                                          fontFamily: "pop"),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Text(
                                                        "•",
                                                        style: TextStyle(
                                                            fontSize: global
                                                                .fontSmall
                                                                .value,
                                                            color: Colors.grey,
                                                            fontFamily: 'pop'),
                                                      ),
                                                    ),
                                                    Text(
                                                      timeago.format(
                                                        controller
                                                            .dataBerita[index]
                                                            .createdAt,
                                                        locale: 'id',
                                                      ),
                                                      style: TextStyle(
                                                          fontSize: global
                                                                  .fontSmall
                                                                  .value -
                                                              1,
                                                          color: Colors.grey,
                                                          fontFamily: 'pop',
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                );
                            },
                          ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              onTap: () {
                                // global.reqPermissionNotification();
                                if (controller.page > 1) {
                                  controller.page--;
                                  controller.getBerita();
                                }
                                return;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                decoration: BoxDecoration(
                                    // color: tkLightGreen,
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                )),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: greenny,
                                      size: global.fontSmall.value,
                                    ),
                                    Text(
                                      'Prev',
                                      style: TextStyle(
                                          color: greenny,
                                          fontSize: global.fontSmall.value),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Text(
                              controller.page.value.toString(),
                              style: TextStyle(
                                  fontSize: global.fontSize.value,
                                  color: greenny),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              onTap: () {
                                if (controller.page != controller.total_page) {
                                  controller.page++;
                                  controller.getBerita();
                                }
                                return;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 9),
                                decoration: BoxDecoration(
                                    // color: tkLightGreen,
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                                child: Row(
                                  children: [
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                          color: greenny,
                                          fontSize: global.fontSmall.value),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: greenny,
                                      size: global.fontSmall.value,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
