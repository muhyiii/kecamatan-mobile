import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:sitforsa/app/modules/berita/views/detail_berita_view.dart';
import 'package:sitforsa/config/style.dart';
import 'package:timeago/timeago.dart' as timeago;

class WidgetBeritaView extends GetView {
  var global = Get.put(GlobalController());
  final beritaController = Get.put(BeritaController());
  var tes = [1, 2, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: CarouselController(),
      options: CarouselOptions(
          height: Get.width / 2.25,
          scrollPhysics: BouncingScrollPhysics(),
          autoPlayCurve: Curves.easeIn,
          viewportFraction: 0.8,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true),
      items: beritaController.dataBerita.map((e) {
        return Builder(
          builder: (BuildContext context) {
            if (beritaController.isLoading.value)
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Card(
                  color: greny,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          height: Get.width,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    e.thumbnail,
                                  ),
                                  fit: BoxFit.cover)),
                          padding: const EdgeInsets.all(8.0),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: Get.width / 4,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  blacky.withOpacity(0.8)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: Text(
                                timeago.format(
                                  e.createdAt,
                                  locale: 'id',
                                ),
                                style: TextStyle(
                                    fontSize: global.fontSmall.value,
                                    color: whitey,
                                    fontFamily: 'Helvetica Neue'),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: Text(
                                e.judul,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: global.fontSize.value - 2,
                                    color: whitey,
                                    fontFamily: 'Helvetica Neue'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            return GestureDetector(
              onTap: () => Get.to(() => DetailBeritaView(),
                  arguments: e,
                  transition: Transition.fadeIn,
                  duration: Duration(milliseconds: 1000)),
              child: Card(
                color: greny,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: Get.width,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                e.thumbnail,
                              ),
                              fit: BoxFit.cover)),
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Container(
                      width: Get.width,
                      height: Get.width / 4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                blacky.withOpacity(0.8)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            timeago.format(
                              e.createdAt,
                              locale: 'id',
                            ),
                            style: TextStyle(
                                fontSize: global.fontSmall.value,
                                color: whitey,
                                fontFamily: 'Helvetica Neue'),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            e.judul,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: global.fontSize.value - 2,
                                color: whitey,
                                fontFamily: 'Helvetica Neue'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

            // return Container(
            //     width: Get.width,
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //         color: greny, borderRadius: BorderRadius.circular(10)),
            //     child: Column(
            //       children: [
            //         Flexible(
            //           child: Container(
            //             width: Get.width,
            //             decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage(
            //                         'assets/images/img-article.jpeg'))),
            //           ),
            //         ),
            //         Text(
            //           'Bolehkah tidak sholat dimasjid karena takut Covid 19.',
            //           style: TextStyle(),
            //         ),
            //       ],
            //     ));
          },
        );
      }).toList(),
    );
  }
}




//  Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 'Bolehkah tidak sholat dimasjid karena takut Covid 19.',
//                                 style: TextStyle(),
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'Pencegahan Covid-19 dapat dilakukan dengan melakukan beberapa cara. Salah satunya adalah dengan melakukan vaksinasi Covid-19.',
//                                 style: TextStyle(),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                           child: Image.asset('assets/images/img-article.jpeg'))
//                     ],
//                   )