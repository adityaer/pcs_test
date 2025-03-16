import 'package:pcs_test/domain/entity/user.dart';

class UserModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? city;
  String? country;
  String? county;
  String? addressNo;
  String? street;
  String? zipCode;
  String? id;

  UserModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.city,
    this.country,
    this.county,
    this.addressNo,
    this.street,
    this.zipCode,
    this.id,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    city = json['city'];
    country = json['country'];
    county = json['county'];
    addressNo = json['address_no'];
    street = json['street'];
    zipCode = json['zip_code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['city'] = city;
    data['country'] = country;
    data['county'] = county;
    data['address_no'] = addressNo;
    data['street'] = street;
    data['zip_code'] = zipCode;
    data['id'] = id;
    return data;
  }

  User toEntity() {
    return User(createdAt: createdAt ?? '',
        name: name ?? '',
        avatar: avatar ?? '',
        city: city ?? '',
        country: country ?? '',
        county: county ?? '',
        addressNo: addressNo ?? '',
        street: street ?? '',
        zipCode: zipCode ?? '',
        id: id ?? '',
    );
  }
}
