// class UserModel {
//   String? token;
//   int? userId;

//   UserModel({this.token, this.userId});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     userId = json['userId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['token'] = token;
//     data['userId'] = userId;
//     return data;
//   }
// }

class UserModel {
  User? user;
  String? accessToken;

  UserModel({this.user, this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? profession;
  String? country;
  String? city;
  String? state;
  String? zipcode;
  String? address;
  String? contact;
  String? dob;
  String? emailVerifiedAt;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.profession,
      this.country,
      this.city,
      this.state,
      this.zipcode,
      this.address,
      this.contact,
      this.dob,
      this.emailVerifiedAt,
      this.imagePath,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profession = json['profession'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    address = json['address'];
    contact = json['contact'];
    dob = json['dob'];
    emailVerifiedAt = json['email_verified_at'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profession'] = this.profession;
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['dob'] = this.dob;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
