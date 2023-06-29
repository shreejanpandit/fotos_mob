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
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (description != null) {
      this._description = description;
    }
    if (imagePath != null) {
      this._imagePath = imagePath;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (isFavourite != null) {
      this._isFavourite = isFavourite;
    }
    if (mediaList != null) {
      this._mediaList = mediaList;
    }
    if (user != null) {
      this._user = user;
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
        ? new MediaList.fromJson(json['media_list'])
        : null;
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['slug'] = this._slug;
    data['description'] = this._description;
    data['image_path'] = this._imagePath;
    data['created_at'] = this._createdAt;
    data['is_favourite'] = this._isFavourite;
    if (this._mediaList != null) {
      data['media_list'] = this._mediaList!.toJson();
    }
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class MediaList {
  int? _id;
  String? _name;
  String? _slug;
  String? _type;
  Null? _description;
  Null? _path;

  MediaList(
      {int? id,
      String? name,
      String? slug,
      String? type,
      Null? description,
      Null? path}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (type != null) {
      this._type = type;
    }
    if (description != null) {
      this._description = description;
    }
    if (path != null) {
      this._path = path;
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
  Null? get description => _description;
  set description(Null? description) => _description = description;
  Null? get path => _path;
  set path(Null? path) => _path = path;

  MediaList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _type = json['type'];
    _description = json['description'];
    _path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['type'] = this._type;
    data['description'] = this._description;
    data['path'] = this._path;
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  String? _email;
  Null? _profession;
  Null? _country;
  Null? _city;
  Null? _state;
  Null? _zipcode;
  Null? _address;
  Null? _contact;
  String? _emailVerifiedAt;
  Null? _imagePath;
  String? _createdAt;
  String? _updatedAt;

  User(
      {int? id,
      String? name,
      String? email,
      Null? profession,
      Null? country,
      Null? city,
      Null? state,
      Null? zipcode,
      Null? address,
      Null? contact,
      String? emailVerifiedAt,
      Null? imagePath,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (profession != null) {
      this._profession = profession;
    }
    if (country != null) {
      this._country = country;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
    if (zipcode != null) {
      this._zipcode = zipcode;
    }
    if (address != null) {
      this._address = address;
    }
    if (contact != null) {
      this._contact = contact;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (imagePath != null) {
      this._imagePath = imagePath;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  Null? get profession => _profession;
  set profession(Null? profession) => _profession = profession;
  Null? get country => _country;
  set country(Null? country) => _country = country;
  Null? get city => _city;
  set city(Null? city) => _city = city;
  Null? get state => _state;
  set state(Null? state) => _state = state;
  Null? get zipcode => _zipcode;
  set zipcode(Null? zipcode) => _zipcode = zipcode;
  Null? get address => _address;
  set address(Null? address) => _address = address;
  Null? get contact => _contact;
  set contact(Null? contact) => _contact = contact;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  Null? get imagePath => _imagePath;
  set imagePath(Null? imagePath) => _imagePath = imagePath;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['profession'] = this._profession;
    data['country'] = this._country;
    data['city'] = this._city;
    data['state'] = this._state;
    data['zipcode'] = this._zipcode;
    data['address'] = this._address;
    data['contact'] = this._contact;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['image_path'] = this._imagePath;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
