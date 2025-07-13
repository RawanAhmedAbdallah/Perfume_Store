class Order {
  late int id;
  late String total;
  late String date;
  late String paymentType;
  late String status;
  late String storeId;
  late String userId;
  late String addressId;
  late String? paymentCardId;
  late String orderProductsCount;

  Order();

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    paymentType = json['payment_type'];
    status = json['status'];
    storeId = json['store_id'];
    userId = json['user_id'];
    addressId = json['address_id'];
    paymentCardId = json['payment_card_id'];
    orderProductsCount = json['order_products_count'];
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
    data['order_products_count'] = orderProductsCount;
    return data;
  }
}