import 'package:get/get.dart';
import 'package:forget_me_not/api/controllers/products_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/products.dart';


class FavoriteGetxController extends GetxController {

  RxBool loading = false.obs;
  RxList<Products> products = <Products>[].obs;
  final ProductsApiController _apiController = ProductsApiController();

  static ProductsApiController get to => Get.find<ProductsApiController>();

  @override
  void onInit() {
    // TODO: implement onInit
    readFavProducts();
    super.onInit();
  }
  
  void readFavProducts() async {
    loading.value = true;
    products.value = (await _apiController.readFavProducts());
    loading.value = false;
  }

 Future<ApiResponse> deleteFav({required int index}) async {
   ApiResponse apiResponse =
   await _apiController.deleteFav(productId: products[index].imageUrl);
   if (apiResponse.success) {
     products.removeAt(index);
   }
   return apiResponse;
 }
  Future<ApiResponse> addFav({required int index}) async {
    ApiResponse apiResponse = await _apiController.addFav(productId: products[index].imageUrl);
    if (apiResponse.success ){
      products.indexWhere((element) => true);
    }
    return apiResponse;
  }
}
