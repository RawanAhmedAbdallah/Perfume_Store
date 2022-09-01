import 'dart:convert';

import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/addresses.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:http/http.dart' as http;

 class AddressApiController with ApiHelper {

   Future <List<Address>> readAddress() async {
     Uri uri = Uri.parse(ApiSettings.addresses);
     var response = await http.get(uri, headers: headers);
     if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       var jsonArray = jsonResponse['list'] as List;
       return jsonArray.map((jsonObject) => Address.fromJson(jsonObject))
           .toList();
     }
     return [];
   }

   Future <ApiResponse> createAddress(
       {required String name, required String info, required String contactNumber, required int cityId }) async {
     Uri uri = Uri.parse(ApiSettings.addresses);
     var response = await http.post(uri, body: {
       'name': name,
       'info': info,
       'contact_number': contactNumber,
       'city_id': cityId,
     });
     if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       var jsonArray = jsonResponse['object'];
       print(jsonArray);

     }
     return failedResponse;
   }


   Future<ApiResponse> updateAddress({required int id}) async {
     Uri uri = Uri.parse(
         ApiSettings.addresses.replaceFirst('{id}', id.toString()));
     var response = await http.put(uri, headers: headers);
     if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       return ApiResponse(
           message: jsonResponse['message'], success: jsonResponse['status']);
     }
     return failedResponse;
   }

  // Future <ApiResponse<Address>> upload({required String path}) async {
  //   //FORM DATA - MULTI PART REQUEST
  //   Uri uri = Uri.parse(ApiSettings.addresses.replaceFirst('/{id}', ''));
  //   var request = http.MultipartRequest('PUT', uri);
  //   var file = await http.MultipartFile.fromPath('address', path);
  //   request.files.add(file);
  //   // request.fields['KEY'] = 'VALUE';
  //   request.headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
  //   request.headers[HttpHeaders.acceptHeader] = 'application/json';
  //   var response = await request.send();
  //   if (response.statusCode == 201 || response.statusCode == 400) {
  //     var body = await response.stream.transform(utf8.decoder).first;
  //   var jsonResponse = jsonDecode(body);
  //   var apiResponse = ApiResponse<Address>(
  //   message: jsonResponse['message'],
  //   success: jsonResponse['status'],
  //   );
  //   if (response.statusCode == 201) {
  //   var address = Address.fromJson(jsonResponse['object']);
  //   apiResponse.message = address as String;
  //   }
  //   return apiResponse;
  //   }
  //   return const ApiResponse<Address>(
  //   message: 'Something went wrong',
  //   success: false,
  //   );
  // }


   Future<ApiResponse> deleteAddress({required int id}) async {
     Uri uri = Uri.parse(
         ApiSettings.addresses.replaceFirst('{id}', id.toString()));
     var response = await http.delete(uri, headers: headers);
     if (response.statusCode == 200) {
       var jsonResponse = jsonDecode(response.body);
       return ApiResponse(
           message: jsonResponse['message'], success: jsonResponse['status']);
     }
     return failedResponse;
   }

 }
