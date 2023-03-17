import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/controllers/global_controller.dart';
import 'package:sitforsa/app/modules/berita/views/berita_view.dart';
import 'package:sitforsa/app/modules/dashboard/views/dashboard_view.dart';
import 'package:sitforsa/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:sitforsa/app/modules/pelayanan/views/pelayanan_view.dart';
import 'package:sitforsa/app/modules/profile/views/profile_view.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends StatefulWidget {
  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final controller = Get.put(BottomBarController());

  // ConnectivityResult? _connectivityResult;
  // late StreamSubscription _connectivitySubscription;
  // bool? _isConnectionSuccessful;

  // @override
  // initState() {
  //   super.initState();

  //   _connectivitySubscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     print('Current connectivity status: $result');
  //     setState(() {
  //       _connectivityResult = result;
  //     });
  //   });
  // }

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
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(size: 30),
            iconSize: 20,
            unselectedItemColor: grayNav,
            selectedItemColor: global.isDark.value ? null : greenny,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: global.isDark.value ? null : greny,
            elevation: global.isDark.value ? 0 : 1,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icons.newspaper_rounded,
                label: 'Berita',
              ),
              _bottomNavigationBarItem(
                icon: Icons.task_rounded,
                label: 'Pelayanan',
              ),
              _bottomNavigationBarItem(
                icon: Icons.notifications,
                label: 'Notifikasi',
              ),
              _bottomNavigationBarItem(
                icon: Icons.person,
                label: 'Akun',
              ),
            ],
          ),
        );
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
