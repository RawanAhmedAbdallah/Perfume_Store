//class Products {
//  bool? status;
//  String? message;
//  List<List>? list;
//
//  Products({this.status, this.message, this.list});
//
//  Products.fromJson(Map<String, dynamic> json) {
//    status = json['status'];
//    message = json['message'];
//    if (json['list'] != null) {
//      list = <List>[];
//      json['list'].forEach((v) {
//        list!.add(new List.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['status'] = this.status;
//    data['message'] = this.message;
//    if (this.list != null) {
//      data['list'] = this.list!.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class List {
//  late int id;
//  late String nameEn;
//  late String nameAr;
//  late String infoEn;
//  late String infoAr;
//  late String price;
//  late String quantity;
//  late String overalRate;
//  late String subCategoryId;
//  late int productRate;
//  late String offerPrice;
//  late bool isFavorite;
//  late String imageUrl;
//
//  List();
//
//  List.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    nameEn = json['name_en'];
//    nameAr = json['name_ar'];
//    infoEn = json['info_en'];
//    infoAr = json['info_ar'];
//    price = json['price'];
//    quantity = json['quantity'];
//    overalRate = json['overal_rate'];
//    subCategoryId = json['sub_category_id'];
//    productRate = json['product_rate'];
//    offerPrice = json['offer_price'];
//    isFavorite = json['is_favorite'];
//    imageUrl = json['image_url'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = <String, dynamic>{};
//    data['id'] = id;
//    data['name_en'] = nameEn;
//    data['name_ar'] = nameAr;
//    data['info_en'] = infoEn;
//    data['info_ar'] = infoAr;
//    data['price'] = price;
//    data['quantity'] = quantity;
//    data['overal_rate'] = overalRate;
//    data['sub_category_id'] = subCategoryId;
//    data['product_rate'] = productRate;
//    data['offer_price'] = offerPrice;
//    data['is_favorite'] = isFavorite;
//    data['image_url'] = imageUrl;
//    return data;
//  }
//}
//class Products {
//  late bool status;
//  late String message;
//  late List<List>? list;
//
//  Products();
//
//  Products.fromJson(Map<String, dynamic> json) {
//    status = json['status'];
//    message = json['message'];
//    if (json['list'] != null) {
//      list = <List>[] as List;
//      json['list'].forEach((v) {
//        list.add(List.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = Map<String, dynamic>();
//    data['status'] = status;
//    data['message'] = message;
//    if (list != null) {
//      data['list'] = list!.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
import 'package:forget_me_not/pref/shared_pref_controller.dart';

class Products {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String price;
  late String quantity;
  late String overalRate;
  late String subCategoryId;
  late dynamic productRate;
  late String? offerPrice;
  late bool isFavorite;
  late String imageUrl;

  Products();
  static const String tableName = 'products';

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }

  //String get name => if SharedPrefController.t re ?:;

 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
   data['id'] = id;
   data['name_en'] = nameEn;
   data['name_ar'] = nameAr;
   data['info_en'] = infoEn;
   data['info_ar'] = infoAr;
   data['price'] = price;
   data['quantity'] = quantity;
   data['overal_rate'] = overalRate;
   data['sub_category_id'] = subCategoryId;
   data['product_rate'] = productRate;
   data['offer_price'] = offerPrice;
   data['is_favorite'] = isFavorite;
   data['image_url'] = imageUrl;
   return data;
 }
}

