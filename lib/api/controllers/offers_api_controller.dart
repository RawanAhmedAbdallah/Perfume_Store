import 'dart:convert';
import 'package:forget_me_not/api/api_helper.dart';
import 'package:forget_me_not/api/api_settings.dart';
import 'package:forget_me_not/models/offers.dart';
import 'package:http/http.dart' as http;




class OffersApiController with ApiHelper{
  Future <List<Offers>>readOffers() async {
    Uri uri = Uri.parse(ApiSettings.offers);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['list'];
      return jsonArray
          .map((jsonObject) => Offers.fromJson(jsonObject))
          .toList();
    }
    return [];
  }
}