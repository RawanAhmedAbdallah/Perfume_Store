import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/faqs.dart';
import 'package:http/http.dart' as http;



class FaqsApiController with ApiHelper{
  Future<Faqs?> read() async {
    Uri uri = Uri.parse(ApiSettings.faqs);
    var response = await http.get(uri, headers: headers);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var data = jsonResponse['list'];
      return Faqs.fromJson(data);
    }
    return null;
  }
}
