import 'package:get/get.dart';

import '../controllers/pinjam_controller.dart';

class PinjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinjamController>(
      () => PinjamController(),
    );
  }
}
