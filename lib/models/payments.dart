class Payments {
  late int id;
  late String type;
  late String holderName;
  late String cardNumber;
  late String expDate;
  late String cvv;
  late String userId;
  late String createdAt;
  late String updatedAt;

  Payments();

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    holderName = json['holder_name'];
    cardNumber = json['card_number'];
    expDate = json['exp_date'];
    cvv = json['cvv'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

