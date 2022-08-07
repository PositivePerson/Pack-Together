import 'package:get/get.dart';
import 'package:pack_together/controllers/store_controller.dart';
import 'package:pack_together/services/provider.dart';
import 'package:pack_together/services/repository.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ReviewRepository(storeProvider: StoreProvider())));
  }
}
