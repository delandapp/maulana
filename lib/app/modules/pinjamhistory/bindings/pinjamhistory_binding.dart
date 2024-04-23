import 'package:get/get.dart';

import '../controllers/pinjamhistory_controller.dart';

class PinjamhistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinjamhistoryController>(
      () => PinjamhistoryController(),
    );
  }
}
