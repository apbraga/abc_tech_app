import 'package:get/get.dart';
import '../controller/order_controller.dart';
import '../provider/order_provider.dart';
import '../service/geolocation_service.dart';
import '../service/order_service.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController(GeolocationService(), OrderService(OrderProvider())));

  }
}