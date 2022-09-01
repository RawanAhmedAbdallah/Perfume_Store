import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/api_response.dart';

class ContactApiController with ApiHelper{
  Future<ApiResponse> contactRequest({
    required String subject,
    required String message,
  }) async {
    Uri uri = Uri.parse(ApiSettings.contactRequests);
    var response = await http.post(uri, body: {
      'subject': subject,
      'message': message,
    });
    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return failedResponse;
  }
}