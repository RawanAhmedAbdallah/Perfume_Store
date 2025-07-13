class OrderDetails {
  late int id;
  late String total;
  late String date;
  late String paymentType;
  late String status;
  late String storeId;
  late String userId;
  late String addressId;
  late String paymentCardId;
  late String productsCount;
  late List<Products> products;
  late Address address;

  OrderDetails();

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    productsCount = json['products_count'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    address =
    (json['address'] != null ? Address.fromJson(json['address']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = total;
    data['date'] = date;
    data['payment_type'] = paymentType;
    data['status'] = status;
    data['store_id'] = storeId;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['payment_card_id'] = paymentCardId;
    data['products_count'] = productsCount;
    data['products'] = products.map((v) => v.toJson()).toList();
    data['address'] = address.toJson();
    return data;
  }
}

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
  late String orderQuantity;
  late dynamic productRate;
  late String? offerPrice;
  late bool isFavorite;
  late String imageUrl;
  late Pivot pivot;

  Products();

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
    orderQuantity = json['order_quantity'];
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
    data['order_quantity'] = orderQuantity;
    data['product_rate'] = productRate;
    data['offer_price'] = offerPrice;
    data['is_favorite'] = isFavorite;
    data['image_url'] = imageUrl;
    data['pivot'] = pivot.toJson();
    return data;
  }
}

class Pivot {
  late String orderId;
  late String productId;

  Pivot();

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['product_id'] = productId;
    return data;
  }
}

class Address {
  late int id;
  late String name;
  late String info;
  late String contactNumber;
  late String lat;
  late String lang;
  late int cityId;
  late City city;

  Address();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['info'] = info;
    data['contact_number'] = contactNumber;
    data['lat'] = lat;
    data['lang'] = lang;
    data['city_id'] = cityId;
    data['city'] = city.toJson();
    return data;
  }
}

class City {
 late int id;
 late String nameEn;
 late String nameAr;

  City();

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    return data;
  }
}