import 'dart:convert';
import 'dart:io';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/home.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:http/http.dart' as http;


class HomeApiController {
  Future<Home?> getHome() async {
    Uri uri = Uri.parse(ApiSettings.home);
    var response = await http.get(uri, headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonObject = jsonResponse['data'];
      return Home.fromJson(jsonObject);
    }
    return null;
  }
}
// Future<Slider?> getSlider() async {
//   Uri uri = Uri.parse(ApiSettings.home);
//   var response = await http.get(uri);
//
//   if (response.statusCode == 200) {
//     var jsonResponse = jsonDecode(response.body);
//     var jsonObject = jsonResponse['data'];
//     return Slider.fromJson(jsonObject);
//   }
//   return null;
// }
 // Future<Home?> read() async {
 //   Uri uri = Uri.parse(ApiSettings.home.replaceFirst('{id}', ''));
 //   var response = await http.get(uri, headers: {
 //     HttpHeaders.acceptHeader: 'application/json',
 //     HttpHeaders.authorizationHeader: SharedPrefController().token,
 //   });
//
 //   print( SharedPrefController().token);
 //   // print(response.body);
 //   if (response.statusCode == 200) {
 //     var jsonResponse = jsonDecode(response.body);
 //     var jsonObject = jsonResponse['data'];
 //     return Home.fromJson(jsonObject);
 //   }
 //   return null;
 // }

// Future<Slider?>getSlider() async {
//   print('read');
//   Uri uri = Uri.parse(ApiSettings.home);
//   var response = await http.get(uri, headers: {
//     HttpHeaders.acceptHeader: 'application/json',
//     HttpHeaders.authorizationHeader: SharedPrefController().token,
//   });
//   if (response.statusCode == 200) {
//     var jsonResponse = jsonDecode(response.body);
//     var jsonArray = jsonResponse['data'] ;
//     return jsonArray.map((jsonObject) => Slider.fromJson(jsonObject)).toList();
//   }
//   return null;
// }

//  Future<Category?> getCategory() async {
//    Uri uri = Uri.parse(ApiSettings.home);
//    var response = await http.get(uri);
//
//    if (response.statusCode == 200) {
//      var jsonResponse = jsonDecode(response.body);
//      var jsonObject = jsonResponse['data'];
//      return Category.fromJson(jsonObject);
//    }
//    return null;
//  }
//
//  Future<LatestProducts?> getLatestProducts() async {
//    Uri uri = Uri.parse(ApiSettings.home);
//    var response = await http.get(uri);
//
//    if (response.statusCode == 200) {
//      var jsonResponse = jsonDecode(response.body);
//      var jsonObject = jsonResponse['data'];
//      return LatestProducts.fromJson(jsonObject);
//    }
//    return null;
//  }
