import 'package:forget_me_not/database/controllers/cart_db_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/cart.dart';
import 'package:get/get.dart';

class CartGetxController extends GetxController {

  RxBool loading = false.obs;
  RxDouble total = 0.0.obs;
  RxInt count = 0.obs;
  RxList<Cart> cartItems = <Cart>[].obs;

  final CartDbController _apiController = CartDbController();

  static CartGetxController get to => Get.find<CartGetxController>();

  @override
  void onInit() {
    // TODO: implement onInit
    readCart();
    super.onInit();
  }

 void readCart() async {
   loading.value = true;
   cartItems.value = await _apiController.read();
   loading.value = false;
 }

  Future<ApiResponse> create(Cart cart) async {
    int index =
    cartItems.indexWhere((element) => element.productId == cart.productId);
    if (index == -1) {
      int newRowId = await _apiController.create(cart);
      if (newRowId != 0) {
        total.value = total.value;
        count.value += 1;
        cart.id = newRowId;
        cartItems.add(cart);

      }
      return getResponse(newRowId != 0);
    } else {
     // int quantity = await _apiController.getQuantity(cart.productId);
      int newCount = cartItems[index].count + 1;
      return changeCount(index, newCount);
    }
  }

  Future<ApiResponse> changeCount(int index, int count2) async {
    bool isDelete = count2 == 0;
    Cart cart = cartItems[index];
    bool result = isDelete
        ? await _apiController.delete(cart.id)
        : await _apiController.update(cart);

    if (result) {
      if (isDelete) {
        total.value -= cart.total;
        count.value -= 1;
        cartItems.removeAt(index);
      } else {
        cart.count = count2;
        cart.total = (cart.price * cart.count) ;

        total.value += cart.total;
        count.value += 1;
        cartItems[index] = cart;
      }
      update();
    }

    return getResponse(result);
  }

  Future<ApiResponse> clear() async {
    bool cleared = await _apiController.clear();
    if (cleared) {
      total.value = 0;
      count.value = 0;
      cartItems.clear();
      update();
    }
    return getResponse(cleared);
  }

  ApiResponse getResponse(bool success) {
    return ApiResponse(
      message:
      success ? 'Operation completed successfully' : 'Operation failed!',
      success: success,
    );
  }
}