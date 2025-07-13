import 'dart:io';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';




mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message: 'Something went wrong', success: false);

  Map<String, String> get headers {
    return {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',

    };
  }
}
