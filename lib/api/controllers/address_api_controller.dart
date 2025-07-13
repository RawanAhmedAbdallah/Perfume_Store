import 'dart:convert';

import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/addresses.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:http/http.dart' as http;

class AddressApiController with ApiHelper {
  Future<List<Address>> readAddress() async {
    Uri uri = Uri.parse(ApiSettings.addresses);
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray
          .map((jsonObject) => Address.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

  Future<ApiResponse<Address>> createAddress({
    required String name,
    required String info,
    required String contactNumber,
    required int cityId}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', ''));
    var response = await http.post(uri,
        body: {
          'name': name,
          'info': info,
          'contact_number': contactNumber,
          'city_id': cityId.toString(),
        },
        headers: headers);
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['object'];
      Address address = Address.fromJson(jsonObject);

      return ApiResponse<Address>(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
        object: address,
      );
    }
    return ApiResponse(message: 'Something went wrong', success: false);
  }

  Future<ApiResponse> updateAddress({required int id}) async {
    Uri uri =
    Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', id.toString()));
    var response = await http.put(uri, headers: headers);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> delete({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('{id}', id.toString()));
    var response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: true);
    }
    return failedResponse;
  }
}