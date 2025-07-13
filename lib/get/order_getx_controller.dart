//
// import 'package:forget_me_not/api/controllers/order_api_controller.dart';
// import 'package:forget_me_not/models/api_response.dart';
// import 'package:forget_me_not/models/order.dart';
// import 'package:get/get.dart';
//
// class OrderGetxController extends GetxController {
//   RxBool loading = false.obs;
//   RxList<Order> orders = <Order>[].obs;
//   final OrderApiController _apiController = OrderApiController();
//
//   static OrderGetxController get to => Get.find<OrderGetxController>();
//
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     read();
//     super.onInit();
//   }
//
//   void read() async {
//     loading.value = true;
//     orders.value = await _apiController.read();
//     loading.value = false;
//   }
//
//   Future<ApiResponse> createOrder({ required String cart,
//     required String paymentType,
//     required int addressId}) async {
//     ApiResponse<Order> apiResponse =
//     await _apiController.createOrder(cart: cart,paymentType: paymentType,addressId: addressId);
//     if (apiResponse.success && apiResponse.object != null) {
//       orders.add(apiResponse.object!);
//     }
//     return apiResponse;
//   }
//
//   Future<ApiResponse> orderDet({required int index}) async {
//     ApiResponse apiResponse =
//     await _apiController.orderDet(id: orders[index].id);
//     if (apiResponse.success) {
//       orders.indexWhere;
//     }
//     return apiResponse;
//   }
// }