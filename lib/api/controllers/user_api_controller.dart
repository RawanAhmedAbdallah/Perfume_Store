import 'dart:convert';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/user.dart';
import 'package:http/http.dart' as http;




  class UserApiController {
    Future<List<User>> read() async {
      Uri uri = Uri.parse(ApiSettings.users);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var jsonArray = jsonResponse['data'] as List;
        return jsonArray
            .map((jsonObject) => User.fromJson(jsonObject))
            .toList();
      }
      return [];
    }
 //  Future<List<City>> readCity() async {
 //    Uri uri = Uri.parse(ApiSettings.users);
 //    var response = await http.get(uri);

 //    if (response.statusCode == 200) {
 //      var jsonResponse = jsonDecode(response.body);
 //      var jsonArray = jsonResponse['data'] as List;
 //      return jsonArray
 //          .map((jsonObject) => City.fromJson(jsonObject))
 //          .toList();
 //    }
 //    return [];
 //  }
 //  Future<List<Store>> readStore() async {
 //    Uri uri = Uri.parse(ApiSettings.users);
 //    var response = await http.get(uri);

 //    if (response.statusCode == 200) {
 //      var jsonResponse = jsonDecode(response.body);
 //      var jsonArray = jsonResponse['data'] as List;
 //      return jsonArray
 //          .map((jsonObject) => Store.fromJson(jsonObject)).toList();
 //    }
 //    return [];
 //  }

  }
