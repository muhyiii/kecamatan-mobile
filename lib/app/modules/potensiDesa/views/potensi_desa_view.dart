import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/detailPotensi/views/detail_potensi_view.dart';
import 'package:sitforsa/config/style.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import '../controllers/potensi_desa_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
        titleSpacing: 10,
        title: Container(
          height: 42,
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.025),
                offset: Offset(0, 2),
              )
            ],
          ),
          child: TextField(
            cursorColor: blacky,
            textAlignVertical: TextAlignVertical.bottom,
            cursorWidth: 1,
            style: TextStyle(fontFamily: "pop", color: blacky, fontSize: 14),
            decoration: InputDecoration(
              filled: true,
              fillColor: global.isDark.value ? Color(0xff202427) : Colors.white,
              prefixIcon: Icon(
                Iconsax.search_normal_1,
                size: global.fontSize.value - 2,
                color: global.isDark.value ? Colors.grey : blacky,
              ),
              hintText: "Cari Wisata...",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding:
                  EdgeInsets.symmetric(vertical: global.fontSmall.value + 1.5),
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
        leading: InkWell(
          onTap: () => Get.back(),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                // set the overlay color when the InkWell is pressed
                return Colors.transparent;
              }
              // set the default overlay color
              return Colors.transparent;
            },
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 4, bottom: 7, top: 11),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.025),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: global.isDark.value ? Color(0xff202427) : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.arrow_left_2,
                    size: global.fontSize.value,
                    color: global.isDark.value ? Colors.grey : Colors.black,
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 7),
            //   child: Container(
            //     height: 45,
            //     child: TextField(
            //       cursorColor: blacky,
            //       textAlignVertical: TextAlignVertical.bottom,
            //       cursorWidth: 1,
            //       style:
            //           TextStyle(fontFamily: "pop", color: blacky, fontSize: 14),
            //       decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Colors.white,
            //         prefixIcon: Icon(
            //           Iconsax.search_normal_1,
            //           size: global.fontSize.value - 1,
            //           color: blacky,
            //         ),
            //         hintText: "Cari Wisata...",
            //         hintStyle: TextStyle(color: Colors.grey),
            //         contentPadding: EdgeInsets.symmetric(
            //             vertical: global.fontSmall.value + 2),
            //         // labelStyle: TextStyle(
            //         //     fontFamily: "pop",
            //         //     color: Colors.grey,
            //         //     fontSize: global.fontSet.value + 1),
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide.none,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide.none,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         // border: UnderlineInputBorder(borderSide: BorderSide.none),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15),
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
    return StaggeredGrid.count(
        // verticalDirection: VerticalDirection.down,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
        // spacing: 10,
        // runSpacing: 8,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Iconsax.blur,
                  color: global.isDark.value ? greenny : Colors.black,
                ),
                Container(
                  width: Get.width / 3.5,
                  child: Text(
                    "Potensi Desa",
                    style: TextStyle(
                        color: global.isDark.value ? greenny : Colors.black,
                        fontFamily: "popSM",
                        fontSize: global.fontHeading.value - 2,
                        height: 1.2),
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(
            potensiController.dataPotensi.length,
            (index) {
              var e = potensiController.dataPotensi.value;
              return GestureDetector(
                onTap: () => Get.to(() => DetailPotensiView(),
                    arguments: e[index],
                    transition: Transition.native,
                    duration: Duration(milliseconds: 700)),
                child: Container(
                  width: Get.width / 2.25,
                  height: Get.width / 2,
                  padding: EdgeInsets.all(3),
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
                    color: Get.isDarkMode
                        ? Colors.black.withOpacity(0.35)
                        : Colors.black.withOpacity(0.5),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e[index].namaPotensi,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
        ]);
  }
}
