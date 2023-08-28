class FavouriteModel {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? imagePath;
  String? createdAt;
  bool? isFavourite;

  FavouriteModel(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.imagePath,
      this.createdAt,
      this.isFavourite});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['image_path'] = imagePath;
    data['created_at'] = createdAt;
    data['is_favourite'] = isFavourite;
    return data;
  }
}
