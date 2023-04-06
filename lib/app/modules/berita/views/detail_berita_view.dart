import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailBeritaView extends StatefulWidget {
  const DetailBeritaView({super.key});

  @override
  State<DetailBeritaView> createState() => _DetailBeritaViewState();
}

class _DetailBeritaViewState extends State<DetailBeritaView> {
  final global = Get.put(GlobalController());
  late ScrollController _scrollController;
  double scrollOffset = 0.0;

  scrollListener() {
    setState(() {
      scrollOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    // TODO: implement initState  _scrollController.addListener(scrollListener);
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    print(data);
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chevron_left,
                            size: 22,
                            color: Colors.black,
                          ),
                          // Text(previousRoute)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: global.fontSmall.value,
              ),
              Container(
                // width: Get.width / 1.5,
                padding: EdgeInsets.only(
                  left: 3,
                ),
                child: Text(
                  data.judul,
                  style: TextStyle(
                      fontFamily: "pop",
                      fontWeight: FontWeight.w600,
                      fontSize: global.fontSize.value - 2.5),
                ),
              ),
              SizedBox(
                height: global.fontSet.value + 2,
              ),
              Container(
                width: Get.width,
                height: Get.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(data.thumbnail),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: global.fontSet.value - 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.author.username,
                          style: TextStyle(
                            fontFamily: "pop",
                            fontSize: global.fontSet.value,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          timeago.format(data.createdAt, locale: "id"),
                          style: TextStyle(
                              fontFamily: "pop",
                              color: Colors.grey.shade600,
                              fontSize: global.fontSet.value - 1.5),
                        )
                      ],
                    ),
                    SizedBox(
                      height: global.fontSet.value - 8,
                    ),
                    Divider(indent: 1),
                    SizedBox(
                      height: global.fontSet.value - 3,
                    ),
                    Text(
                      _parseHtmlString(data.konten),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: global.fontSet.value - 0.5,
                          fontFamily: "pop"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        // Stack(
        //   children: [
        //     CustomScrollView(
        //       controller: _scrollController,
        //       physics: BouncingScrollPhysics(
        //           parent: AlwaysScrollableScrollPhysics()),
        //       slivers: [
        //         SliverToBoxAdapter(
        //           child: Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //             child: Column(
        //               children: [
        //                 Container(
        //                   width: Get.width,
        //                   height: Get.width / 2,
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(12)),
        //                   child: CachedNetworkImage(
        //                     key: UniqueKey(),
        //                     imageUrl: data.thumbnail,
        //                     fit: BoxFit.cover,
        //                     alignment: Alignment.topCenter,
        //                     placeholder: (context, url) => Shimmer.fromColors(
        //                       baseColor: Colors.grey[300]!,
        //                       highlightColor: Colors.white,
        //                       child: Container(
        //                         height: Get.width / 3,
        //                         width: Get.width / 2.7,
        //                         decoration: BoxDecoration(
        //                           color: Colors.blueGrey.withOpacity(0.6),
        //                           borderRadius: BorderRadius.circular(15),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //                 Container(
        //                   width: Get.width,
        //                   height: Get.width * 0.000,
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(12),
        //                       gradient: LinearGradient(
        //                           colors: [
        //                             Colors.transparent,
        //                             blacky.withOpacity(0.8)
        //                           ],
        //                           begin: Alignment.topCenter,
        //                           end: Alignment.bottomCenter)),
        //                   padding: EdgeInsets.symmetric(
        //                       horizontal: 25, vertical: 35),
        //                   alignment: Alignment.bottomLeft,
        //                   child: Text(
        //                     data.judul,
        //                     style: TextStyle(
        //                         color: whitey,
        //                         fontFamily: 'Helvetica Neue Bold',
        //                         fontSize: global.fontSize.toDouble()),
        //                   ),
        //                 ),
        //                 Container(
        //                   width: Get.width,
        //                   padding: EdgeInsets.symmetric(
        //                       horizontal: 25, vertical: 35),
        //                   decoration: BoxDecoration(
        //                     color: Get.isDarkMode ? null : whitey,
        //                   ),
        //                   child: Text(
        //                     _parseHtmlString(data.konten.toString()),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     PreferredSize(
        //       child: SafeArea(
        //         top: false,
        //         child: Container(
        //           width: Get.width,
        //           color: Get.isDarkMode
        //               ? Colors.grey.withOpacity(
        //                   (scrollOffset / 100).clamp(0, 1).toDouble())
        //               : Colors.white.withOpacity(
        //                   (scrollOffset / 100).clamp(0, 1).toDouble()),
        //           child: ListTile(
        //             leading: IconButton(
        //               icon: Icon(
        //                 Icons.arrow_back,
        //                 color: Get.isDarkMode ? null : blacky.withOpacity(0.7),
        //               ),
        //               onPressed: () => Get.back(),
        //             ),
        //           ),
        //         ),
        //       ),
        //       preferredSize: Size(Get.width, 40),
        //     )
        //   ],
        // ),
        );
  }
}
