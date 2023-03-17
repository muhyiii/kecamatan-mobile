import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/config/style.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: Get.width,
                            height: Get.width,
                            child: CachedNetworkImage(
                              key: UniqueKey(),
                              imageUrl: data.thumbnail,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.white,
                                child: Container(
                                  height: Get.width / 3,
                                  width: Get.width / 2.7,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: Get.width / 2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.transparent,
                                  blacky.withOpacity(0.8)
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 35),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              data.judul,
                              style: TextStyle(
                                  color: whitey,
                                  fontFamily: 'Helvetica Neue Bold',
                                  fontSize: global.fontSize.toDouble()),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: Get.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? null : whitey,
                        ),
                        child: Text(
                          _parseHtmlString(data.konten.toString()),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            PreferredSize(
              child: SafeArea(
                top: false,
                child: Container(
                  width: Get.width,
                  color: Get.isDarkMode
                      ? Colors.grey.withOpacity(
                          (scrollOffset / 100).clamp(0, 1).toDouble())
                      : Colors.white.withOpacity(
                          (scrollOffset / 100).clamp(0, 1).toDouble()),
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Get.isDarkMode ? null : blacky.withOpacity(0.7),
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
              ),
              preferredSize: Size(Get.width, 40),
            )
          ],
        ),
      ),
    );
  }
}
