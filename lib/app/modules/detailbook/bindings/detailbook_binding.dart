import 'package:get/get.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailbookController>(
      () => DetailbookController(),
    );
  }
}
