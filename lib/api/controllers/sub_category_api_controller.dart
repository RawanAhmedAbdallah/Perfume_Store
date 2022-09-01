import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/sub_category.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;


class SubCategoryApiController with ApiHelper{
  Future <List<SubCategory?>>  getSubCategory({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.subcategories.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'] as List;
      return jsonArray.map((jsonObject) => SubCategory.fromJson(jsonObject)).toList();
    }
    return [];
  }

//Future <SubCategory?>  getSubCat() async {
//  Uri uri = Uri.parse(ApiSettings.subcategories.replaceFirst('/{id}', ''));
//  var response = await http.get(uri);
//  if (response.statusCode == 200) {
//    var jsonResponse = jsonDecode(response.body);
//    var jsonObject = jsonResponse['list'];
//    return SubCategory.fromJson(jsonObject);
//  }
//  return null;
//}

}