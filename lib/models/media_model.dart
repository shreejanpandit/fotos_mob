// ignore_for_file: unnecessary_getters_setters, prefer_void_to_null, dead_code

class MediaModel {
  List<Data>? _data;
  Pagination? _pagination;

  MediaModel(
      {List<Data>? data, Pagination? pagination, required int currentPage}) {
    if (data != null) {
      _data = data;
    }
    if (pagination != null) {
      _pagination = pagination;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  Pagination? get pagination => _pagination;
  set pagination(Pagination? pagination) => _pagination = pagination;

  MediaModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      data['pagination'] = _pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _title;
  String? _slug;
  String? _description;
  String? _imagePath;
  MediaList? _mediaList;
  User? _user;

  Data(
      {int? id,
      String? title,
      String? slug,
      String? description,
      String? imagePath,
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
  MediaList? get mediaList => _mediaList;
  set mediaList(MediaList? mediaList) => _mediaList = mediaList;
  User? get user => _user;
  set user(User? user) => _user = user;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _imagePath = json['image_path'];
    _mediaList = json['media_list'] != null
        ? new MediaList.fromJson(json['media_list'])
        : null;
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['title'] = _title;
    data['slug'] = _slug;
    data['description'] = _description;
    data['image_path'] = _imagePath;
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

  MediaList({int? id, String? name, String? slug, String? type}) {
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
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get type => _type;
  set type(String? type) => _type = type;

  MediaList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    data['slug'] = _slug;
    data['type'] = _type;
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  String? _email;
  Null _profession;
  Null _country;
  Null _city;
  Null _state;
  Null _zipcode;
  Null _address;
  Null _contact;
  String? _emailVerifiedAt;
  Null _imagePath;
  String? _createdAt;
  String? _updatedAt;

  User(
      {int? id,
      String? name,
      String? email,
      Null profession,
      Null country,
      Null city,
      Null state,
      Null zipcode,
      Null address,
      Null contact,
      String? emailVerifiedAt,
      Null imagePath,
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
    if (city != null) {}
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
  Null get profession => _profession;
  set profession(Null profession) => _profession = profession;
  Null get country => _country;
  set country(Null country) => _country = country;
  Null get city => _city;
  set city(Null city) => _city = city;
  Null get state => _state;
  set state(Null state) => _state = state;
  Null get zipcode => _zipcode;
  set zipcode(Null zipcode) => _zipcode = zipcode;
  Null get address => _address;
  set address(Null address) => _address = address;
  Null get contact => _contact;
  set contact(Null contact) => _contact = contact;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  Null get imagePath => _imagePath;
  set imagePath(Null imagePath) => _imagePath = imagePath;
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

class Pagination {
  int? _total;
  int? _count;
  int? _perPage;
  int? _currentPage;
  int? _totalPages;

  Pagination(
      {int? total,
      int? count,
      int? perPage,
      int? currentPage,
      int? totalPages}) {
    if (total != null) {
      _total = total;
    }
    if (count != null) {
      _count = count;
    }
    if (perPage != null) {
      _perPage = perPage;
    }
    if (currentPage != null) {
      _currentPage = currentPage;
    }
    if (totalPages != null) {
      _totalPages = totalPages;
    }
  }

  int? get total => _total;
  set total(int? total) => _total = total;
  int? get count => _count;
  set count(int? count) => _count = count;
  int? get perPage => _perPage;
  set perPage(int? perPage) => _perPage = perPage;
  int? get currentPage => _currentPage;
  set currentPage(int? currentPage) => _currentPage = currentPage;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;

  Pagination.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
    _count = json['count'];
    _perPage = json['per_page'];
    _currentPage = json['current_page'];
    _totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = _total;
    data['count'] = _count;
    data['per_page'] = _perPage;
    data['current_page'] = _currentPage;
    data['total_pages'] = _totalPages;
    return data;
  }
}
