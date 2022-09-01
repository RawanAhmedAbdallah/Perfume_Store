import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/category.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class CategoryApiController with ApiHelper {

 Future<List<Category?>>getCat() async {
   print('read');
   Uri uri = Uri.parse(ApiSettings.categories);
   var response = await http.get(uri, headers: {
     HttpHeaders.acceptHeader: 'application/json',
     HttpHeaders.authorizationHeader: SharedPrefController().token,
   });
   if (response.statusCode == 200) {
     var jsonResponse = jsonDecode(response.body);
     var jsonArray = jsonResponse['list'] as List ;
     return jsonArray.map((jsonObject) => Category.fromJson(jsonObject)).toList();
   }
   return [];
 }


}