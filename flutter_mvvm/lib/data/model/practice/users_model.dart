class UsersModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  UsersModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['adress'] as Map<String, dynamic>),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );
  }
}

//------------------------------------------------------
class Address {
  final String street;
  final String suit;
  final String city;
  final String zipcode;
  final Geo geo;
  Address({
    required this.street,
    required this.suit,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suit: json['suit'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'],
    );
  }
}

class Geo {
  final String lat;
  final String lng;
  Geo({required this.lat, required this.lng});
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;
  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPharase'],
      bs: json['bs'],
    );
  }
}
