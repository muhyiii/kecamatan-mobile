import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/controllers/berita_controller.dart';
import 'package:sitforsa/app/modules/berita/views/berita_view.dart';
import 'package:sitforsa/app/modules/berita/views/detail_berita_view.dart';
import 'package:sitforsa/app/modules/dashboard/views/dashboard_view.dart';
import 'package:sitforsa/app/modules/kontakPenting/views/kontak_penting_view.dart';
import 'package:sitforsa/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:sitforsa/app/modules/pelayanan/views/pelayanan_view.dart';
import 'package:sitforsa/app/modules/profile/views/profile_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sitforsa/config/style.dart';
import '../controllers/bottom_bar_controller.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconly/iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarView extends StatefulWidget {
  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final controller = Get.put(BottomBarController());
  final beritaController = Get.put(BeritaController());

// ConnectivityResult? _connectivityResult;
// late StreamSubscription _connectivitySubscription;
// bool? _isConnectionSuccessful;

  @override
  initState() {
    super.initState();

    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notification Created on ${notification.channelKey}'),
        ),
      );
    });

    AwesomeNotifications().actionStream.listen((notification) {
      var news = beritaController.dataBerita.where((data) => data.judul == notification.body).first;
      log(news.toString());
      print(news.runtimeType);
      print(notification.body);
      Get.off(() => DetailBeritaView(),
          arguments: news,
          transition: Transition.native,
          duration: Duration(milliseconds: 700));
    });

    // _connectivitySubscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   print('Current connectivity status: $result');
    //   setState(() {
    //     _connectivityResult = result;
    //   });
    // });
  }

  // @override
  // dispose() {

  //   super.dispose();

  //   _connectivitySubscription.cancel();
  // }

// Future<void> _checkConnectivityState() async {
//   final ConnectivityResult result = await Connectivity().checkConnectivity();

//   if (result == ConnectivityResult.wifi) {
//     print('Connected to a Wi-Fi network');
//   } else if (result == ConnectivityResult.mobile) {
//     print('Connected to a mobile network');
//   } else {
//     print('Not connected to any network');
//   }

//   setState(() {
//     _connectivityResult = result;
//   });
// }

// Future<void> _tryConnection() async {
//   try {
//     final response = await InternetAddress.lookup('www.woolha.com');

//     setState(() {
//       _isConnectionSuccessful = response.isNotEmpty;
//     });
//   } on SocketException catch (e) {
//     print(e);
//     setState(() {
//       _isConnectionSuccessful = false;
//     });
//   }
// }

  @override
  Widget build(BuildContext context) {
    final global = Get.put(GlobalController());
    return GetBuilder<BottomBarController>(
      builder: (control) {
        return Scaffold(
            body: Obx(() => SafeArea(
                    child: IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    DashboardView(),
                    BeritaView(),
                    PelayananView(),
                    NotifikasiView(),
                    ProfileView(),
                  ],
                ))),
            bottomNavigationBar: Container(
              // margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 12),
              decoration: BoxDecoration(
                  color: global.isDark.value ? Color(0xff111315) : whitey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: global.isDark.value
                          ? Colors.black.withOpacity(0.3)
                          : Colors.black.withOpacity(0.03),
                      offset: Offset(0, -3),
                    )
                  ]),
              child: GNav(
                rippleColor: greeny,
                hoverColor: greny,
                gap: 10,
                tabBorderRadius: 8,
                activeColor: whitey,
                iconSize: 18,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                padding: EdgeInsets.all(9),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: greenny,
                color: global.isDark.value ? Colors.grey.shade600 : Colors.grey,
                textStyle: TextStyle(
                    fontSize: global.fontSet.value,
                    fontFamily: 'popSM',
                    color: whitey),
                tabs: [
                  GButton(
                    icon: controller.tabIndex.value == 0
                        ? IconlyBold.home
                        : IconlyLight.home,
                    text: 'Beranda',
                  ),
                  GButton(
                    icon: controller.tabIndex.value == 1
                        ? FontAwesomeIcons.book
                        : Iconsax.book,
                    text: 'Berita',
                  ),
                  GButton(
                    icon: controller.tabIndex.value == 2
                        ? Iconsax.clipboard_text5
                        : Iconsax.clipboard_text,
                    text: 'Layanan',
                  ),
                  GButton(
                    icon: controller.tabIndex.value == 3
                        ? Iconsax.notification5
                        : Iconsax.notification,
                    text: 'Notifikasi',
                  ),
                  GButton(
                    icon: controller.tabIndex.value == 4
                        ? IconlyBold.profile
                        : IconlyLight.profile,
                    text: 'Akun',
                  ),
                ],
                selectedIndex: controller.tabIndex.value,
                onTabChange: (index) {
                  print(index == 1);
                  if (index == 1) global.reqPermissionNotification();

                  setState(() {
                    controller.tabIndex.value = index;
                  });
                },
              ),
              // BottomNavigationBar(
              //   selectedIconTheme: IconThemeData(size: 30),
              //   iconSize: 20,
              //   unselectedItemColor: grayNav,
              //   selectedItemColor: global.isDark.value ? null : greenny,
              //   onTap: controller.changeTabIndex,
              //   currentIndex: controller.tabIndex.value,
              //   type: BottomNavigationBarType.fixed,
              //   backgroundColor: global.isDark.value ? null : greny,
              //   elevation: global.isDark.value ? 0 : 1,
              //   items: [
              //     _bottomNavigationBarItem(
              //       icon: Icons.home,
              //       label: 'Home',
              //     ),
              //     _bottomNavigationBarItem(
              //       icon: Icons.newspaper_rounded,
              //       label: 'Berita',
              //     ),
              //     _bottomNavigationBarItem(
              //       icon: Icons.task_rounded,
              //       label: 'Pelayanan',
              //     ),
              //     _bottomNavigationBarItem(
              //       icon: Icons.notifications,
              //       label: 'Notifikasi',
              //     ),
              //     _bottomNavigationBarItem(
              //       icon: Icons.person,
              //       label: 'Akun',
              //     ),
              //   ],
              // ),
            ));
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

// class BottomBarView extends GetView<BottomBarController> {
//   final global = Get.put(GlobalController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RoundedTabbarWidget(
//         tabIcons: [
//           Icons.home,
//           Icons.newspaper_rounded,
//           Icons.task_rounded,
//           Icons.notifications,
//           Icons.person,
//         ],
//         pages: [
//           DashboardView(),
//           BeritaView(),
//           PelayananView(),
//           NotifikasiView(),
//           ProfileView(),
//         ],
//         tabBarBackgroundColor: Colors.white,
//         itemNormalColor: grayNav,
//         itemSelectedColor: global.isDark.value ? null : greenny,
//         selectedIndex: 0,
//         onTabItemIndexChanged: (int index) {
//           print('Index: $index');
//         },
//       ),
//     );
//   }
// }
