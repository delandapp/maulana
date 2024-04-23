import 'package:maulanaperpustakaan/app/modules/bookmark/controllers/bookmark_controller.dart';
import 'package:maulanaperpustakaan/app/modules/history/controllers/history_controller.dart';
import 'package:maulanaperpustakaan/app/modules/home/controllers/home_controller.dart';
import 'package:maulanaperpustakaan/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
