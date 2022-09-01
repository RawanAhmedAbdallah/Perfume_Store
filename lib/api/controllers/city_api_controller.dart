import 'dart:convert';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/city.dart';
import 'package:http/http.dart' as http;



class CityApiController{
  Future read() async {
    Uri uri = Uri.parse(ApiSettings.users);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['data'];
      return jsonArray
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}
