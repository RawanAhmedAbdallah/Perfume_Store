import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/product_details.dart';
import 'package:forget_me_not/models/products.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ProductsApiController with ApiHelper{

  Future <List<Products>>  products({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.products.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      print(jsonArray);
      return jsonArray.map((jsonObject) => Products.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future <ProductDetails?> productsDetails({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.productsDet.replaceFirst('{id}', id.toString()));
    print(uri);
    var response = await http.get(uri,headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['object'];
      print(jsonArray);
      return ProductDetails.fromJson(jsonArray);

    }
    return null;
  }


  Future<ApiResponse> addRate({required String productId, required int rate }) async{
    Uri uri = Uri.parse(ApiSettings.rate);
    var response = await http.post(uri, body: {
      'product_id' : productId,
      'rate' : rate,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> deleteRate({required String productId, required int rate }) async{
    Uri uri = Uri.parse(ApiSettings.rate);
    var response = await http.post(uri, body: {
      'product_id' : productId,
      'rate' : rate,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<List<Products>> readFavProducts() async {
    print('readImages');
    Uri uri = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'];
      return jsonArray
          .map((jsonObject) => Products.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<ApiResponse> deleteFav({required String productId}) async{
    Uri uri = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.post(uri, body: {
      'product_id' : productId,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> addFav({required String productId}) async{
    Uri uri = Uri.parse(ApiSettings.favoriteProducts);
    var response = await http.post(uri, body: {
      'product_id' : productId,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

}

