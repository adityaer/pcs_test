import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.city,
    required this.country,
    required this.county,
    required this.addressNo,
    required this.street,
    required this.zipCode,
    required this.id,
  });

  final String createdAt;
  final String name;
  final String avatar;
  final String city;
  final String country;
  final String county;
  final String addressNo;
  final String street;
  final String zipCode;
  final String id;

  @override
  List<Object> get props => [
    id,
    createdAt,
    name,
    avatar,
    city,
    country,
    county,
    addressNo,
    street,
    zipCode,
    id,
  ];
}
