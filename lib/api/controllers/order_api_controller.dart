import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/order.dart';
import 'package:forget_me_not/models/order_details.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class OrderApiController with ApiHelper {
  Future<List<Order?>> read() async {
    Uri uri = Uri.parse(ApiSettings.orders);
    var response = await http.get(uri, headers: headers);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['list'] as List ;
      return jsonObject
          .map((jsonObject) => Order.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

 //Future<List<OrderDetails?>> orderDet() async {
 //  Uri uri = Uri.parse(ApiSettings.orders);
 //  var response = await http.get(uri, headers: headers);
 //  print(response.statusCode);
 //  if (response.statusCode == 200) {
 //    var jsonResponse = jsonDecode(response.body);
 //    var jsonObject = jsonResponse['data'] as List;
 //    return jsonObject
 //        .map((jsonObject) => OrderDetails.fromJson(jsonObject))
 //        .toList();
 //  }
 //  return [];
 //}
  Future<List<OrderDetails?>> orderDet() async {
    Uri uri = Uri.parse(ApiSettings.orders);
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200 ) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['data'];
      return jsonObject
            .map((jsonObject) => OrderDetails.fromJson(jsonObject))
            .toList();
      }
    return [];
  }


  Future<ApiResponse<Order>> createOrder({
    required String cart,
    required String paymentType,
    required int addressId
  }) async {
    Uri uri = Uri.parse(ApiSettings.orders);
    var response = await http.post(uri, body: {
      'cart': cart,
      'payment_type': paymentType,
      'address_id': addressId,
    },
        headers: headers);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['object'];
      Order order = Order.fromJson(jsonObject);

      return ApiResponse<Order>(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
        object: order,
      );
    }
    return ApiResponse(message: 'Something went wrong', success: false);
  }
}
