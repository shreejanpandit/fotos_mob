class MediaModel {
  List<MediaData>? _data;
  Pagination? _pagination;

  MediaModel({List<MediaData>? data, Pagination? pagination}) {
    if (data != null) {
      this._data = data;
    }
    if (pagination != null) {
      this._pagination = pagination;
    }
  }

  List<MediaData>? get data => _data;
  set data(List<MediaData>? data) => _data = data;
  Pagination? get pagination => _pagination;
  set pagination(Pagination? pagination) => _pagination = pagination;

  MediaModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <MediaData>[];
      json['data'].forEach((v) {
        _data!.add(new MediaData.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    if (this._pagination != null) {
      data['pagination'] = this._pagination!.toJson();
    }
    return data;
  }
}

class MediaData {
  int? _id;
  String? _title;
  String? _slug;
  String? _description;
  String? _imagePath;
  bool? _isFavourite;
  String? _createdAt;
  MediaList? _mediaList;
  User? _user;

  MediaData(
      {int? id,
      String? title,
      String? slug,
      String? description,
      String? imagePath,
      bool? isFavourite,
      String? createdAt,
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
    if (isFavourite != null) {
      this._isFavourite = isFavourite;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
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
  bool? get isFavourite => _isFavourite;
  set isFavourite(bool? isFavourite) => _isFavourite = isFavourite;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  MediaList? get mediaList => _mediaList;
  set mediaList(MediaList? mediaList) => _mediaList = mediaList;
  User? get user => _user;
  set user(User? user) => _user = user;

  MediaData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _description = json['description'];
    _imagePath = json['image_path'];
    _isFavourite = json['is_favourite'];
    _createdAt = json['created_at'];
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
    data['is_favourite'] = this._isFavourite;
    data['created_at'] = this._createdAt;
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
  String? _profession;
  String? _country;
  String? _city;
  String? _state;
  String? _zipcode;
  String? _address;
  String? _contact;
  String? _imagePath;

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
      String? imagePath}) {
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
    if (imagePath != null) {
      this._imagePath = imagePath;
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
  String? get imagePath => _imagePath;
  set imagePath(String? imagePath) => _imagePath = imagePath;

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
    _imagePath = json['image_path'];
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
    data['image_path'] = this._imagePath;
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
      this._total = total;
    }
    if (count != null) {
      this._count = count;
    }
    if (perPage != null) {
      this._perPage = perPage;
    }
    if (currentPage != null) {
      this._currentPage = currentPage;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
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
    data['total'] = this._total;
    data['count'] = this._count;
    data['per_page'] = this._perPage;
    data['current_page'] = this._currentPage;
    data['total_pages'] = this._totalPages;
    return data;
  }
}
