class ImageOpenModel {
  int? _id;
  String? _title;
  String? _slug;
  String? _description;
  String? _imagePath;
  String? _createdAt;
  bool? _isFavourite;
  MediaList? _mediaList;
  User? _user;

  ImageOpenModel(
      {int? id,
      String? title,
      String? slug,
      String? description,
      String? imagePath,
      String? createdAt,
      bool? isFavourite,
      MediaList? mediaList,
      User? user}) {
    if (id != null) {
      _id = id;
    }
    if (title != null) {
      _title = title;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (description != null) {
      _description = description;
    }
    if (imagePath != null) {
      _imagePath = imagePath;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (isFavourite != null) {
      _isFavourite = isFavourite;
    }
    if (mediaList != null) {
      _mediaList = mediaList;
    }
    if (user != null) {
      _user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get imagePath => _imagePath;
  set imagePath(String? imagePath) => _imagePath = imagePath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  bool? get isFavourite => _isFavourite;
  set isFavourite(bool? isFavourite) => _isFavourite = isFavourite;
  MediaList? get mediaList => _mediaList;
  set mediaList(MediaList? mediaList) => _mediaList = mediaList;
  User? get user => _user;
  set user(User? user) => _user = user;

  ImageOpenModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _imagePath = json['image_path'];
    _createdAt = json['created_at'];
    _isFavourite = json['is_favourite'];
    _mediaList = json['media_list'] != null
        ? MediaList.fromJson(json['media_list'])
        : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['title'] = _title;
    data['slug'] = _slug;
    data['description'] = _description;
    data['image_path'] = _imagePath;
    data['created_at'] = _createdAt;
    data['is_favourite'] = _isFavourite;
    if (_mediaList != null) {
      data['media_list'] = _mediaList!.toJson();
    }
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    return data;
  }
}

class MediaList {
  int? _id;
  String? _name;
  String? _slug;
  String? _type;
  String? _description;
  String? _path;

  MediaList(
      {int? id,
      String? name,
      String? slug,
      String? type,
      String? description,
      String? path}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (type != null) {
      _type = type;
    }
    if (description != null) {
      _description = description;
    }
    if (path != null) {
      _path = path;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get path => _path;
  set path(String? path) => _path = path;

  MediaList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _type = json['type'];
    _description = json['description'];
    _path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['slug'] = _slug;
    data['type'] = _type;
    data['description'] = _description;
    data['path'] = _path;
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  String? _email;
  String? _profession;
  String? _country;
  String? _city;
  String? _state;
  String? _zipcode;
  String? _address;
  String? _contact;
  String? _emailVerifiedAt;
  String? _imagePath;
  String? _createdAt;
  String? _updatedAt;

  User(
      {int? id,
      String? name,
      String? email,
      String? profession,
      String? country,
      String? city,
      String? state,
      String? zipcode,
      String? address,
      String? contact,
      String? emailVerifiedAt,
      String? imagePath,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (email != null) {
      _email = email;
    }
    if (profession != null) {
      _profession = profession;
    }
    if (country != null) {
      _country = country;
    }
    if (city != null) {
      _city = city;
    }
    if (state != null) {
      _state = state;
    }
    if (zipcode != null) {
      _zipcode = zipcode;
    }
    if (address != null) {
      _address = address;
    }
    if (contact != null) {
      _contact = contact;
    }
    if (emailVerifiedAt != null) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (imagePath != null) {
      _imagePath = imagePath;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get profession => _profession;
  set profession(String? profession) => _profession = profession;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get zipcode => _zipcode;
  set zipcode(String? zipcode) => _zipcode = zipcode;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get contact => _contact;
  set contact(String? contact) => _contact = contact;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get imagePath => _imagePath;
  set imagePath(String? imagePath) => _imagePath = imagePath;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _profession = json['profession'];
    _country = json['country'];
    _city = json['city'];
    _state = json['state'];
    _zipcode = json['zipcode'];
    _address = json['address'];
    _contact = json['contact'];
    _emailVerifiedAt = json['email_verified_at'];
    _imagePath = json['image_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['profession'] = _profession;
    data['country'] = _country;
    data['city'] = _city;
    data['state'] = _state;
    data['zipcode'] = _zipcode;
    data['address'] = _address;
    data['contact'] = _contact;
    data['email_verified_at'] = _emailVerifiedAt;
    data['image_path'] = _imagePath;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
