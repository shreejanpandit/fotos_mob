class UnsplashModel {
  String id;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String description;
  String altDescription;
  Urls urls;
  Links links;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  Sponsorship sponsorship;
  Map<String, dynamic> topicSubmissions;
  User user;

  UnsplashModel({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.user,
  });

  factory UnsplashModel.fromJson(Map<String, dynamic> json) {
    return UnsplashModel(
      id: json['id'],
      slug: json['slug'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      promotedAt: DateTime.parse(json['promoted_at']),
      width: json['width'],
      height: json['height'],
      color: json['color'],
      blurHash: json['blur_hash'],
      description: json['description'],
      altDescription: json['alt_description'],
      urls: Urls.fromJson(json['urls']),
      links: Links.fromJson(json['links']),
      likes: json['likes'],
      likedByUser: json['liked_by_user'],
      currentUserCollections:
          List<dynamic>.from(json['current_user_collections']),
      sponsorship: Sponsorship.fromJson(json['sponsorship']),
      topicSubmissions: Map<String, dynamic>.from(json['topic_submissions']),
      user: User.fromJson(json['user']),
    );
  }
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
      smallS3: json['small_s3'],
    );
  }
}

class Links {
  String self;
  String html;
  String download;
  String downloadLocation;

  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'],
      html: json['html'],
      download: json['download'],
      downloadLocation: json['download_location'],
    );
  }
}

class Sponsorship {
  List<String> impressionUrls;
  String tagline;
  String taglineUrl;
  Sponsor sponsor;

  Sponsorship({
    required this.impressionUrls,
    required this.tagline,
    required this.taglineUrl,
    required this.sponsor,
  });

  factory Sponsorship.fromJson(Map<String, dynamic> json) {
    return Sponsorship(
      impressionUrls: List<String>.from(json['impression_urls']),
      tagline: json['tagline'],
      taglineUrl: json['tagline_url'],
      sponsor: Sponsor.fromJson(json['sponsor']),
    );
  }
}

class Sponsor {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String bio;
  String location;
  Links links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  Sponsor({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'],
      updatedAt: DateTime.parse(json['updated_at']),
      username: json['username'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      twitterUsername: json['twitter_username'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      links: Links.fromJson(json['links']),
      profileImage: ProfileImage.fromJson(json['profile_image']),
      instagramUsername: json['instagram_username'],
      totalCollections: json['total_collections'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      acceptedTos: json['accepted_tos'],
      forHire: json['for_hire'],
      social: Social.fromJson(json['social']),
    );
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
    );
  }
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  String? paypalEmail;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    return Social(
      instagramUsername: json['instagram_username'],
      portfolioUrl: json['portfolio_url'],
      twitterUsername: json['twitter_username'],
      paypalEmail: json['paypal_email'],
    );
  }
}

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String bio;
  String location;
  Links links;
  ProfileImage profileImage;
  String? instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      updatedAt: DateTime.parse(json['updated_at']),
      username: json['username'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      twitterUsername: json['twitter_username'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      links: Links.fromJson(json['links']),
      profileImage: ProfileImage.fromJson(json['profile_image']),
      instagramUsername: json['instagram_username'],
      totalCollections: json['total_collections'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      acceptedTos: json['accepted_tos'],
      forHire: json['for_hire'],
      social: Social.fromJson(json['social']),
    );
  }
}

class Links1 {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  Links1({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory Links1.fromJson(Map<String, dynamic> json) {
    return Links1(
      self: json['self'],
      html: json['html'],
      photos: json['photos'],
      likes: json['likes'],
      portfolio: json['portfolio'],
      following: json['following'],
      followers: json['followers'],
    );
  }
}
