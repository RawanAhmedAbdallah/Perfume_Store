import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/home.dart';

class HomeApiController with ApiHelper {
  Future<Home?> read() async {
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(uri, headers: headers);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var data = jsonResponse['data'];
      return Home.fromJson(data);
    }
    return null;
  }
}
