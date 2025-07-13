
import 'dart:convert';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/products.dart';
import 'package:http/http.dart' as http;


 class FavoriteProductsApiController with ApiHelper{

   Future <List<Products>> readFavProducts() async {
     Uri uri = Uri.parse(ApiSettings.favoriteProducts);
     var response = await http.get(uri, headers: headers);
     if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       var jsonArray = jsonResponse['list'] as List;
       print(jsonArray);
       return jsonArray.map((jsonObject) => Products.fromJson(jsonObject)).toList();
     }
     return [];
   }

   Future<ApiResponse> addFav({required int id}) async{
     Uri uri = Uri.parse(ApiSettings.favoriteProducts.replaceFirst('{id}', id.toString()));
     var response = await http.post(uri, body: {
       'product_id' : id,
     });
     if(response.statusCode == 200 || response.statusCode == 400){
       var jsonResponse = jsonDecode(response.body);
       return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
     }
     return failedResponse;
   }
 // Future<ApiResponse> deleteFav({required String productId}) async{
 //   Uri uri = Uri.parse(ApiSettings.products);
 //   var response = await http.post(uri, body: {
 //     'product_id' : productId,
 //   });
 //   if(response.statusCode == 200 || response.statusCode == 400){
 //     var jsonResponse = jsonDecode(response.body);
 //     return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
 //   }
 //   return failedResponse;
 // }

  //Future<ApiResponse> readFavProducts() async{
  //  Uri uri = Uri.parse(ApiSettings.favoriteProducts);
  //  var response = await http.get(uri);
  //  if(response.statusCode == 200 || response.statusCode == 400){
  //    var jsonResponse = jsonDecode(response.body);
  //    return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
  //  }
  //  return failedResponse;
  //}
 }