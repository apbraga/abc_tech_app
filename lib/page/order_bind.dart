import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../service/geolocation_service.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController(GeolocationService()));

  }
}