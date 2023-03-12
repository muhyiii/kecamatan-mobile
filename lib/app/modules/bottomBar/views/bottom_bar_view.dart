import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sitforsa/app/modules/berita/views/berita_view.dart';
import 'package:sitforsa/app/modules/dashboard/views/dashboard_view.dart';
import 'package:sitforsa/app/modules/notifikasi/views/notifikasi_view.dart';
import 'package:sitforsa/app/modules/pelayanan/views/pelayanan_view.dart';
import 'package:sitforsa/app/modules/profile/views/profile_view.dart';
import 'package:sitforsa/config/style.dart';

import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends StatelessWidget {
  final controller = Get.put(BottomBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (control) {
        return Scaffold(
          body: Obx(() => SafeArea(
                  child: AnimatedSwitcher(
                transitionBuilder: AnimatedSwitcher.defaultTransitionBuilder,
                duration: Duration(seconds: 1),
                child: IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    DashboardView(),
                    BeritaView(),
                    PelayananView(),
                    NotifikasiView(),
                    ProfileView(),
                  ],
                ),
              ))),
          bottomNavigationBar: BottomNavigationBar(
            selectedIconTheme: IconThemeData(size: 30),
            iconSize: 20,
            unselectedItemColor: grayNav,
            selectedItemColor: Get.isDarkMode ? whitey : greenNav,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Get.isDarkMode ? null : greny,
            elevation: Get.isDarkMode ? 2 : 0,
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
