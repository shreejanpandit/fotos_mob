class PaymentHistoryModel {
  List<PaymentHistoryData>? data;
  String? message;

  PaymentHistoryModel({this.data, this.message});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PaymentHistoryData>[];
      json['data'].forEach((v) {
        data!.add(new PaymentHistoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class PaymentHistoryData {
  int? id;
  int? price;
  String? status;
  int? subscriptionId;
  String? createdAt;

  PaymentHistoryData(
      {this.id, this.price, this.status, this.subscriptionId, this.createdAt});

  PaymentHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    status = json['status'];
    subscriptionId = json['subscription_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['status'] = this.status;
    data['subscription_id'] = this.subscriptionId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
