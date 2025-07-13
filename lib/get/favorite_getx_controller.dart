import 'package:forget_me_not/models/product_details.dart';
import 'package:get/get.dart';
import 'package:forget_me_not/api/controllers/products_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/products.dart';


class FavoriteGetxController extends GetxController {

  RxBool loading = false.obs;
  RxBool isFavourite = false.obs;
  RxList<Products> products = <Products>[].obs;
  RxList<ProductDetails> productDetails = <ProductDetails>[].obs;
  RxList<ProductDetails> favoriteProducts = <ProductDetails>[].obs;

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
    favoriteProducts.value = _apiController.readFavProducts() as List<ProductDetails>;
    loading.value = false;
  }

 Future<ApiResponse> deleteFav({required int index}) async {
   ApiResponse apiResponse =
   await _apiController.deleteFav(productId:products[index].imageUrl);
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
 //Future<void> addFavoriteProducts({required ProductDetails product}) async {
 //  bool status = (await FavoriteProductsApiController().addFav(id:product.id)) as bool;
 //  if(status){
 //    int index = products.indexWhere((element) => element.id == product.id);
 //    products[index].isFavorite == false ? favoriteProducts.add(product) : favoriteProducts.removeWhere((element) => element.id == products[index].id);
 //    products[index].isFavorite = !products[index].isFavorite;
 //    productDetails.value = products[index].isFavorite as List<ProductDetails> ;
 //  }
 //  productDetails.refresh();
 //  products.refresh();
 //  favoriteProducts.refresh();
 //  update();
 //}

}
