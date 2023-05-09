import 'package:get/get.dart';

import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/bottomBar/bindings/bottom_bar_binding.dart';
import '../modules/bottomBar/views/bottom_bar_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detailPelayanan/bindings/detail_pelayanan_binding.dart';
import '../modules/detailPelayanan/views/detail_pelayanan_view.dart';
import '../modules/detailPotensi/bindings/detail_potensi_binding.dart';
import '../modules/detailPotensi/views/detail_potensi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kontakPenting/bindings/kontak_penting_binding.dart';
import '../modules/kontakPenting/views/kontak_penting_view.dart';
import '../modules/loginPage/bindings/login_page_binding.dart';
import '../modules/loginPage/views/login_page_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pelayanan/bindings/pelayanan_binding.dart';
import '../modules/pelayanan/views/pelayanan_view.dart';
import '../modules/pengaduan/bindings/pengaduan_binding.dart';
import '../modules/pengaduan/views/pengaduan_view.dart';
import '../modules/pengajuan/bindings/pengajuan_binding.dart';
import '../modules/pengajuan/views/pengajuan_view.dart';
import '../modules/potensiDesa/bindings/potensi_desa_binding.dart';
import '../modules/potensiDesa/views/potensi_desa_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/sipahadesi/bindings/sipahadesi_binding.dart';
import '../modules/sipahadesi/views/sipahadesi_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.PELAYANAN,
      page: () => PelayananView(),
      binding: PelayananBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK_PENTING,
      page: () => KontakPentingView(),
      binding: KontakPentingBinding(),
    ),
    GetPage(
      name: _Paths.PENGADUAN,
      page: () => PengaduanView(),
      binding: PengaduanBinding(),
    ),
    GetPage(
      name: _Paths.POTENSI_DESA,
      page: () => PotensiDesaView(),
      binding: PotensiDesaBinding(),
    ),
    GetPage(
      name: _Paths.SIPAHADESI,
      page: () => SipahadesiView(),
      binding: SipahadesiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PELAYANAN,
      page: () => DetailPelayananView(),
      binding: DetailPelayananBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POTENSI,
      page: () => DetailPotensiView(),
      binding: DetailPotensiBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN,
      page: () => PengajuanView(),
      binding: PengajuanBinding(),
    ),
  ];
}
