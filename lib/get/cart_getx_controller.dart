import 'package:get/get.dart';
import 'package:forget_me_not/models/products.dart';


class CartGetxController extends GetxController {

  final cartItems = [];
  RxBool loading = false.obs;
  final Total = 0.0.obs;
  RxList<Products> cart = <Products>[].obs;

  //final CartDbController _apiController = CartDbController();

  static CartGetxController get to => Get.find<CartGetxController>();

  @override
  void onInit() {
    // TODO: implement onInit
    read();
    super.onInit();
  }

  void read() async {
    loading.value = true;
    //cart.value = await _apiController.read();
    loading.value = false;
  }

//CartGetxController() {
//  loadCart();
//}
//loadCart() async {
//  loading(true);
// var cartItems = await cartDbController.read();

//  @override
//  void onInit() {
//    // TODO: implement onInit
//    cartDbController.read()
//    super.onInit();
//  }

//   for (var i = 0; i < cartItems.length; i++) {
//     Cart cart  =
//     ( cartDbController.update(cartItems[i]['productId'])) as Cart;
//     Total(Total.value + cartItems[i]['price'] * cartItems[i]['quantity']);
//     cartItems.add({'product': cartItems[i]['products'], 'quantity': cartItems[i]['quantity']});
//   }
//   loading(false);
// }


//class CartController extends GetxController {
// Products products = {}.obs;

// void addProductToCart(Products products) {
//   if (productsMap.containsKey(products)) {
//     productsMap[products] += 1;
//   } else {
//     productsMap[products] = 1;
//   }
// }

// void removeProductsFarmCart(Products products) {
//   if (productsMap.containsKey(products) &&
//       productsMap[products] == 1) {
//     productsMap.removeWhere((key, value) => key == products);
//   } else {
//     productsMap[products] -= 1;
//   }


// }

// void removeOneProduct(Products products) {
//   productsMap.removeWhere((key, value) => key == products);
// }

// void clearAllProducts() {
//   Get.defaultDialog(
//     title: "Clean Products",
//     titleStyle: const TextStyle(
//       fontSize: 18,
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//     ),
//     middleText: 'Are you sure you need clear products',
//     middleTextStyle: const TextStyle(
//       fontSize: 18,
//       color: Colors.black,
//       fontWeight: FontWeight.bold,
//     ),
//     backgroundColor: Colors.grey,
//     radius: 10,
//     textCancel: " No ",
//     cancelTextColor: Colors.white,
//     textConfirm: " YES ",
//     confirmTextColor: Colors.white,
//   // onCancel: () {
//   //   Get.toNamed(Get.cartScreen);
//   // },
//     onConfirm: () {
//       products.clear();
//       Get.back();
//     },

//   );
// }

// get productTotal =>
//     products.entries.map((e) => e.key.price * e.value).toList();

// get total => productsMap.entries
//     .map((e) => e.key.price * e.value)
//     .toList()
//     .reduce((value, element) => value + element)
//     .toStringAsFixed(2);

// int quantity() {
//   if (products.isEmpty) {
//     return 0;
//   } else {
//     return productsMap.entries
//         .map((e) => e.value)
//         .toList()
//         .reduce((value, element) => value + element);
//   }
//}

}