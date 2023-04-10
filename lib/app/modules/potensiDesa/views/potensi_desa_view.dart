import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import '../controllers/potensi_desa_controller.dart';
import 'package:iconsax/iconsax.dart';

class PotensiDesaView extends GetView<PotensiDesaController> {
  final potensiController = Get.put(PotensiDesaController());
  final global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Berita',
          style: TextStyle(
            color: greenny,
            fontFamily: 'pop',
            fontSize: global.fontSet.value + 3,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 6, top: 10),
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: global.fontSize.value + 4,
                    color: Colors.black,
                  ),
                  // Text(previousRoute)
                ],
              ),
            ),
          ),
        ),
      ),
      // extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: 50,
                child: TextField(
                  cursorColor: blacky,
                  cursorWidth: 1,
                  style: TextStyle(
                    fontFamily: "pop",
                    color: blacky,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Iconsax.search_normal_1,
                      size: global.fontSize.value + 2,
                      color: blacky,
                    ),
                    // contentPadding: EdgeInsets.symmetric(vertical: 30),
                    // labelStyle: TextStyle(
                    //     fontFamily: "pop",
                    //     color: Colors.grey,
                    //     fontSize: global.fontSet.value + 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Grid(potensiController: potensiController, global: global),
            ),
          ],
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {
  const Grid({
    super.key,
    required this.potensiController,
    required this.global,
  });

  final PotensiDesaController potensiController;
  final GlobalController global;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        potensiController.dataPotensi.length,
        (index) {
          var e = potensiController.dataPotensi.value;
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: Get.width / 2.25,
              height: Get.width / 2,
              padding: EdgeInsets.all(5),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    e[index].thumbnail,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: GlassContainer(
                width: Get.width,
                height: Get.width / 6.5,
                blur: 1.5,
                border: Border.fromBorderSide(BorderSide.none),
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e[index].namaPotensi,
                        maxLines: 1,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: global.fontSet.value,
                            color: whitey,
                            fontFamily: 'Helvetica Neue'),
                      ),
                      SizedBox(
                        height: global.fontSmall.value - 5,
                      ),
                      Text(
                        e[index].desa.namaDesa,
                        style: TextStyle(
                            fontSize: global.fontSmall.value,
                            color: Colors.grey.shade400,
                            fontFamily: 'Helvetica Neue'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
//   Row(
//                   children: [
//                     InkWell(
//                       onTap: () => Get.back(),
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.chevron_left,
//                               size: 22,
//                               color: Colors.black,
//                             ),
//                             // Text(previousRoute)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),