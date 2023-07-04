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
