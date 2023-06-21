// class MediaListModel {
//   List<Data>? data;
//   Pagination? pagination;

//   MediaListModel({this.data, this.pagination});

//   MediaListModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     pagination = json['pagination'] != null
//         ? new Pagination.fromJson(json['pagination'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   late final String name;
//   String? slug;
//   String? type;

//   Data({this.id, required this.name, this.slug, this.type});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     slug = json['slug'];
//     type = json['type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['slug'] = this.slug;
//     data['type'] = this.type;
//     return data;
//   }
// }

// class Pagination {
//   int? total;
//   int? count;
//   int? perPage;
//   int? currentPage;
//   int? totalPages;

//   Pagination(
//       {this.total,
//       this.count,
//       this.perPage,
//       this.currentPage,
//       this.totalPages});

//   Pagination.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     count = json['count'];
//     perPage = json['per_page'];
//     currentPage = json['current_page'];
//     totalPages = json['total_pages'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['count'] = this.count;
//     data['per_page'] = this.perPage;
//     data['current_page'] = this.currentPage;
//     data['total_pages'] = this.totalPages;
//     return data;
//   }
// }
