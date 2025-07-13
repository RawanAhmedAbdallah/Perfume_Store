import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/user.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;


class AuthApiController with ApiHelper {
  Future<ApiResponse> register({
   //required String name,
   //required String mobile,
   //required String password,
   //required String gender,
   //required String city,
   required User user,
  }) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri, body: {
      'name': user.name,
      'mobile': user.mobile,
      'password': user.password,
      'gender': user.gender,
      'city_id': user.cityId,
      'STORE_API_KEY':'7185490b-b030-4fd7-84ee-b4d8137a63fc',

    });

    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> login(
      {required String mobile, required String password,required String fcm}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'mobile': mobile,
      'password': password,
      'fcm':'fcm'
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

  Future<List<City>> getCity() async {
    Uri uri = Uri.parse(ApiSettings.cities);
    var response = await http.get(uri,
        headers: {HttpHeaders.acceptHeader: 'application/json'});
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray.map((jsonObject) => City.fromJson(jsonObject)).toList();
    }
    return [];
  }

// Future<ApiResponse> refreshFcmToken({
//   required User user,
// }) async {
//   Uri uri = Uri.parse(ApiSettings.refreshFcmToken);
//   var response = await http.post(uri, body: {
//    'fcm_token':'NEW_FCM_TOKEN'
//   });

//   if (response.statusCode == 201 || response.statusCode == 400) {
//     var jsonResponse = jsonDecode(response.body);
//     return ApiResponse(
//         message: jsonResponse['message'], success: jsonResponse['status']);
//   }
//   return failedResponse;
// }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().clear();
      //  if(response.statusCode == 200){
      //  var jsonResponse = jsonDecode(response.body);
      //  return ApiResponse(message: 'Logged out successfully', success: jsonResponse['status']);
      //}else{
      //    return const ApiResponse(message: 'Logged out successfully', success: true);
      //  }
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: response.statusCode == 200
              ? jsonResponse['message']
              : 'Logged out successfully',
          success: true,
      );
    }
    return failedResponse;
  }
  //Forget Password - Reset Password
Future<ApiResponse> forgetPassword({required String mobile})async {
    Uri uri = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(uri, body: {
      'mobile': mobile
    });
    if(response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      print('Code: ${jsonResponse['code']}');
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
}

Future<ApiResponse> activateCode({required String mobile, required String code}) async{
    Uri uri = Uri.parse(ApiSettings.activateCode);
    var response = await http.post(uri, body: {
      'mobile' : mobile,
      'code' : code,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> resetPassword({required String password,required String code, required String mobile}) async{
    Uri uri = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(uri, body: {
      'password' : password,
      'password_confirmation' : password,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> changePassword({required String password}) async{
    Uri uri = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(uri, body: {
      'current_password' : password,
      'new_password' : password,
      'new_password_confirmation' : password,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }

  Future<ApiResponse> updateProfile({required User user}) async{
    Uri uri = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(uri, body: {
      'city_id': user.cityId,
      'name' : user.name,
      'gender' : user.gender,
    });
    if(response.statusCode == 200 || response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }
}