import 'dart:convert';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/faqs.dart';
import 'package:http/http.dart' as http;



class FaqsApiController with ApiHelper {
  Future<List<Faqs?>> read() async {
    print('read');
    Uri uri = Uri.parse(ApiSettings.faqs);
    var response = await http.get(uri, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray.map((jsonObject) => Faqs.fromJson(jsonObject)).toList();
    }
    return [];
  }
}
