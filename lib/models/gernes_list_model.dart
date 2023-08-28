class GernesListModel {
  int? _id;
  String? _name;
  String? _slug;

  GernesListModel({int? id, String? name, String? slug}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (slug != null) {
      _slug = slug;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;

  GernesListModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['slug'] = _slug;
    return data;
  }
}
