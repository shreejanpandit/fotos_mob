class UserModel {
  Data? data;
  String? message;

  UserModel({this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;

  Data({this.user, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profession;
  String? dob;
  String? country;
  String? city;
  String? state;
  String? zipcode;
  String? address;
  String? contact;
  String? profile_photo_path;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profession,
    this.dob,
    this.country,
    this.city,
    this.state,
    this.zipcode,
    this.address,
    this.contact,
    this.profile_photo_path,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profession: json['profession'],
      dob: json['dob'],
      country: json['country'],
      city: json['city'],
      state: json['state'],
      zipcode: json['zipcode'],
      address: json['address'],
      contact: json['contact'],
      profile_photo_path: json['image_path'], // Map the JSON field to property
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profession'] = profession;
    data['dob'] = dob;
    data['country'] = country;
    data['city'] = city;
    data['state'] = state;
    data['zipcode'] = zipcode;
    data['address'] = address;
    data['contact'] = contact;
    data['image_path'] = profile_photo_path; // Use the model's property name
    return data;
  }
}
