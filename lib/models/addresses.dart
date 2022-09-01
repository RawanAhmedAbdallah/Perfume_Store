class Address {
  late int id;
  late String name;
  late String info;
  late String contactNumber;
  late String lat;
  late String lang;
  late int cityId;
  late City city;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    //city = (json['city'] != null ? City.fromJson(json['city']) : null)!;
  }
}

class City {
  late int id;
  late String nameEn;
  late String nameAr;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }
}