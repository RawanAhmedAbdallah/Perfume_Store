class FavoriteProducts {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late String price;
  late String quantity;
  late String overalRate;
  late String subCategoryId;
  late String productRate;
  late String offerPrice;
  late bool isFavorite;
  late String imageUrl;
  late Pivot pivot;

  FavoriteProducts();

  FavoriteProducts.fromJson(Map<String, dynamic> json) {
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
    pivot = (json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null)!;
  }

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
    data['pivot'] = pivot.toJson();
    return data;
  }
}

class Pivot {
  String? userId;
  String? productId;

  Pivot();

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['product_id'] = productId;
    return data;
  }
}