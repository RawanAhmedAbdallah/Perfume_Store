import 'dart:convert';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/payments.dart';
import 'package:forget_me_not/models/user.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;


class PaymentsApiController with ApiHelper{

  Future <List<Payments>>  payments() async {
    Uri uri = Uri.parse(ApiSettings.paymentCards.replaceFirst('{id}', ''));
    var response = await http.get(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      print(jsonArray);
      return jsonArray.map((jsonObject) => Payments.fromJson(jsonObject)).toList();
    }
    return [];
  }


  Future<ApiResponse<Payments>> createPayments({
    required String holderName,required String cardNumber, required String expDate,
    required String cvv,required String type
  }) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards);
    print(uri);
    var response = await http.post(uri,body: {
    'holder_name': holderName,
    'card_number': cardNumber,
    'exp_date': expDate,
    'cvv': cvv,
    'type': type,
    });
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['object'];
      Payments payments = Payments.fromJson(jsonObject);

      return ApiResponse<Payments>(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
        object: payments,
      );
    }
    return ApiResponse(message: 'Something went wrong', success: false);
  }


  Future<ApiResponse> updatePayment({required int id,required String holderName,required String cardNumber, required String expDate, required String cvv,required String type}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards);
    var response = await http.put(uri, body: {
      'holder_name': holderName,
      'card_number': cardNumber,
      'exp_date': expDate,
      'cvv': cvv,
      'type': type,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['data'];
        User user = User.fromJson(jsonObject);
        SharedPrefController().save(user: user);
      }
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']
      );
    }
    return failedResponse;
  }


  Future<ApiResponse> deletePayment({required int id,required String holderName,required String cardNumber, required String expDate, required String cvv,required String type}) async {
    Uri uri = Uri.parse(ApiSettings.paymentCards);
    var response = await http.delete(uri, body: {
      'holder_name': holderName,
      'card_number': cardNumber,
      'exp_date': expDate,
      'cvv': cvv,
      'type': type,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['data'];
        User user = User.fromJson(jsonObject);
        SharedPrefController().save(user: user);
      }
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']
      );
    }
    return failedResponse;
  }
}