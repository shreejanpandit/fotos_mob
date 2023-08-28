// class MediaModel {
//   List<MediaData>? _data;
//   Pagination? _pagination;

//   MediaModel({List<MediaData>? data, Pagination? pagination}) {
//     if (data != null) {
//       _data = data;
//     }
//     if (pagination != null) {
//       _pagination = pagination;
//     }
//   }

//   List<MediaData>? get data => _data;
//   set data(List<MediaData>? data) => _data = data;
//   Pagination? get pagination => _pagination;
//   set pagination(Pagination? pagination) => _pagination = pagination;

//   MediaModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       _data = <MediaData>[];
//       json['data'].forEach((v) {
//         _data!.add(MediaData.fromJson(v));
//       });
//     }
//     _pagination = json['pagination'] != null
//         ? Pagination.fromJson(json['pagination'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (_data != null) {
//       data['data'] = _data!.map((v) => v.toJson()).toList();
//     }
//     if (_pagination != null) {
//       data['pagination'] = _pagination!.toJson();
//     }
//     return data;
//   }
// }

// class MediaData {
//   int? _id;
//   String? _title;
//   String? _slug;
//   String? _description;
//   String? _imagePath;
//   bool? _isFavourite;
//   String? _createdAt;
//   MediaList? _mediaList;
//   User? _user;

//   MediaData(
//       {int? id,
//       String? title,
//       String? slug,
//       String? description,
//       String? imagePath,
//       bool? isFavourite,
//       String? createdAt,
//       MediaList? mediaList,
//       User? user}) {
//     if (id != null) {
//       _id = id;
//     }
//     if (title != null) {
//       _title = title;
//     }
//     if (slug != null) {
//       _slug = slug;
//     }
//     if (description != null) {
//       _description = description;
//     }
//     if (imagePath != null) {
//       _imagePath = imagePath;
//     }
//     if (isFavourite != null) {
//       _isFavourite = isFavourite;
//     }
//     if (createdAt != null) {
//       _createdAt = createdAt;
//     }
//     if (mediaList != null) {
//       _mediaList = mediaList;
//     }
//     if (user != null) {
//       _user = user;
//     }
//   }

//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get title => _title;
//   set title(String? title) => _title = title;
//   String? get slug => _slug;
//   set slug(String? slug) => _slug = slug;
//   String? get description => _description;
//   set description(String? description) => _description = description;
//   String? get imagePath => _imagePath;
//   set imagePath(String? imagePath) => _imagePath = imagePath;
//   bool? get isFavourite => _isFavourite;
//   set isFavourite(bool? isFavourite) => _isFavourite = isFavourite;
//   String? get createdAt => _createdAt;
//   set createdAt(String? createdAt) => _createdAt = createdAt;
//   MediaList? get mediaList => _mediaList;
//   set mediaList(MediaList? mediaList) => _mediaList = mediaList;
//   User? get user => _user;
//   set user(User? user) => _user = user;

//   MediaData.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _title = json['title'];
//     _slug = json['slug'];
//     _description = json['description'];
//     _imagePath = json['image_path'];
//     _isFavourite = json['is_favourite'];
//     _createdAt = json['created_at'];
//     _mediaList = json['media_list'] != null
//         ? MediaList.fromJson(json['media_list'])
//         : null;
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = _id;
//     data['title'] = _title;
//     data['slug'] = _slug;
//     data['description'] = _description;
//     data['image_path'] = _imagePath;
//     data['is_favourite'] = _isFavourite;
//     data['created_at'] = _createdAt;
//     if (_mediaList != null) {
//       data['media_list'] = _mediaList!.toJson();
//     }
//     if (_user != null) {
//       data['user'] = _user!.toJson();
//     }
//     return data;
//   }
// }

// class MediaList {
//   int? _id;
//   String? _name;
//   String? _slug;
//   String? _type;
//   String? _description;
//   String? _path;

//   MediaList(
//       {int? id,
//       String? name,
//       String? slug,
//       String? type,
//       String? description,
//       String? path}) {
//     if (id != null) {
//       _id = id;
//     }
//     if (name != null) {
//       _name = name;
//     }
//     if (slug != null) {
//       _slug = slug;
//     }
//     if (type != null) {
//       _type = type;
//     }
//     if (description != null) {
//       _description = description;
//     }
//     if (path != null) {
//       _path = path;
//     }
//   }

//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get name => _name;
//   set name(String? name) => _name = name;
//   String? get slug => _slug;
//   set slug(String? slug) => _slug = slug;
//   String? get type => _type;
//   set type(String? type) => _type = type;
//   String? get description => _description;
//   set description(String? description) => _description = description;
//   String? get path => _path;
//   set path(String? path) => _path = path;

//   MediaList.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _name = json['name'];
//     _slug = json['slug'];
//     _type = json['type'];
//     _description = json['description'];
//     _path = json['path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = _id;
//     data['name'] = _name;
//     data['slug'] = _slug;
//     data['type'] = _type;
//     data['description'] = _description;
//     data['path'] = _path;
//     return data;
//   }
// }

// class User {
//   int? _id;
//   String? _name;
//   String? _email;
//   String? _profession;
//   String? _country;
//   String? _city;
//   String? _state;
//   String? _zipcode;
//   String? _address;
//   String? _contact;
//   String? _imagePath;

//   User(
//       {int? id,
//       String? name,
//       String? email,
//       String? profession,
//       String? country,
//       String? city,
//       String? state,
//       String? zipcode,
//       String? address,
//       String? contact,
//       String? imagePath}) {
//     if (id != null) {
//       _id = id;
//     }
//     if (name != null) {
//       _name = name;
//     }
//     if (email != null) {
//       _email = email;
//     }
//     if (profession != null) {
//       _profession = profession;
//     }
//     if (country != null) {
//       _country = country;
//     }
//     if (city != null) {
//       _city = city;
//     }
//     if (state != null) {
//       _state = state;
//     }
//     if (zipcode != null) {
//       _zipcode = zipcode;
//     }
//     if (address != null) {
//       _address = address;
//     }
//     if (contact != null) {
//       _contact = contact;
//     }
//     if (imagePath != null) {
//       _imagePath = imagePath;
//     }
//   }

//   int? get id => _id;
//   set id(int? id) => _id = id;
//   String? get name => _name;
//   set name(String? name) => _name = name;
//   String? get email => _email;
//   set email(String? email) => _email = email;
//   String? get profession => _profession;
//   set profession(String? profession) => _profession = profession;
//   String? get country => _country;
//   set country(String? country) => _country = country;
//   String? get city => _city;
//   set city(String? city) => _city = city;
//   String? get state => _state;
//   set state(String? state) => _state = state;
//   String? get zipcode => _zipcode;
//   set zipcode(String? zipcode) => _zipcode = zipcode;
//   String? get address => _address;
//   set address(String? address) => _address = address;
//   String? get contact => _contact;
//   set contact(String? contact) => _contact = contact;
//   String? get imagePath => _imagePath;
//   set imagePath(String? imagePath) => _imagePath = imagePath;

//   User.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _name = json['name'];
//     _email = json['email'];
//     _profession = json['profession'];
//     _country = json['country'];
//     _city = json['city'];
//     _state = json['state'];
//     _zipcode = json['zipcode'];
//     _address = json['address'];
//     _contact = json['contact'];
//     _imagePath = json['image_path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = _id;
//     data['name'] = _name;
//     data['email'] = _email;
//     data['profession'] = _profession;
//     data['country'] = _country;
//     data['city'] = _city;
//     data['state'] = _state;
//     data['zipcode'] = _zipcode;
//     data['address'] = _address;
//     data['contact'] = _contact;
//     data['image_path'] = _imagePath;
//     return data;
//   }
// }

// class Pagination {
//   int? _total;
//   int? _count;
//   int? _perPage;
//   int? _currentPage;
//   int? _totalPages;

//   Pagination(
//       {int? total,
//       int? count,
//       int? perPage,
//       int? currentPage,
//       int? totalPages}) {
//     if (total != null) {
//       _total = total;
//     }
//     if (count != null) {
//       _count = count;
//     }
//     if (perPage != null) {
//       _perPage = perPage;
//     }
//     if (currentPage != null) {
//       _currentPage = currentPage;
//     }
//     if (totalPages != null) {
//       _totalPages = totalPages;
//     }
//   }

//   int? get total => _total;
//   set total(int? total) => _total = total;
//   int? get count => _count;
//   set count(int? count) => _count = count;
//   int? get perPage => _perPage;
//   set perPage(int? perPage) => _perPage = perPage;
//   int? get currentPage => _currentPage;
//   set currentPage(int? currentPage) => _currentPage = currentPage;
//   int? get totalPages => _totalPages;
//   set totalPages(int? totalPages) => _totalPages = totalPages;

//   Pagination.fromJson(Map<String, dynamic> json) {
//     _total = json['total'];
//     _count = json['count'];
//     _perPage = json['per_page'];
//     _currentPage = json['current_page'];
//     _totalPages = json['total_pages'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['total'] = _total;
//     data['count'] = _count;
//     data['per_page'] = _perPage;
//     data['current_page'] = _currentPage;
//     data['total_pages'] = _totalPages;
//     return data;
//   }
// }

class MediaModel {
  List<MediaData>? data;
  Links? links;
  Meta? meta;
  String? message;

  MediaModel({this.data, this.links, this.meta, this.message});

  MediaModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MediaData>[];
      json['data'].forEach((v) {
        data!.add(new MediaData.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class MediaData {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? imagePath;
  String? createdAt;
  bool? isFavourite;

  MediaData(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.imagePath,
      this.createdAt,
      this.isFavourite});

  MediaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['is_favourite'] = this.isFavourite;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
