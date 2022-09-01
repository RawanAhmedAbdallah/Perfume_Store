// import 'package:smart_store/models/images.dart';

class Product {
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
  // List<Images> images = [];

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // print(id);
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
    // print('===== ${isFavorite}');
    imageUrl = json['image_url'];
    // if (json['images'] != null) {
    //   for (var img in (json['images'] as List)) {
    //     images.add(Images.fromJson(img));
    //   }
    // }
  }
}
