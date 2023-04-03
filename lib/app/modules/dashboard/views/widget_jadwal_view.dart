import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';
// import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WidgetJadwalView extends StatefulWidget {
  const WidgetJadwalView({super.key});

  @override
  State<WidgetJadwalView> createState() => Widget_JadwalStateView();
}

class Widget_JadwalStateView extends State<WidgetJadwalView> {
  final global = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            padding: EdgeInsets.all(global.fontSmall.value),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Icon(
                                    Iconsax.calendar_2,
                                    color: greenny,
                                    size: global.fontSize.value + 4,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width,
                                      child: AutoSizeText(
                                        "Pembinaan Desa",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: "pop",
                                            fontSize:
                                                global.fontSet.value + 0.5,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "17 Maret 2023 10:02",
                                      style: TextStyle(
                                        fontFamily: 'pop',
                                        fontSize: global.fontSet.value - 2,
                                        color: Colors.grey,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      //  Container(
                      //   padding: EdgeInsets.all(global.fontSmall.value),
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(16),
                      //       color: Colors.white),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Container(
                      //             padding: EdgeInsets.all(8),
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(100),
                      //               color: Colors.grey.shade100,
                      //             ),
                      //             child: Icon(
                      //               Iconsax.calendar_1,
                      //               color: greenny,
                      //               // size: 24,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: global.fontSet.value - 1,
                      //           ),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 "Pembinaan Desa",
                      //                 style: TextStyle(
                      //                     fontFamily: "pop",
                      //                     fontSize: global.fontSet.value + 1,
                      //                     fontWeight: FontWeight.w500),
                      //               ),
                      //               SizedBox(
                      //                 height: global.fontSmall.value - 7,
                      //               ),
                      //               Text(
                      //                 "17 Maret 2023 10:02",
                      //                 style: TextStyle(
                      //                   fontFamily: 'pop',
                      //                   fontSize: global.fontSet.value - 2,
                      //                   color: Colors.grey,
                      //                   fontWeight: FontWeight.w500,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //       Icon(
                      //         Icons.chevron_right_rounded,
                      //         color: Colors.black,
                      //         size: 20,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
