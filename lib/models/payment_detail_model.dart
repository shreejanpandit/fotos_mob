class PaymentDetailModel {
  PaymentDetailData? data;
  String? message;

  PaymentDetailModel({this.data, this.message});

  PaymentDetailModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? PaymentDetailData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class PaymentDetailData {
  int? id;
  int? price;
  String? status;
  String? createdAt;
  Subscription? subscription;

  PaymentDetailData(
      {this.id, this.price, this.status, this.createdAt, this.subscription});

  PaymentDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    subscription = json['subscription'] != null
        ? Subscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['status'] = status;
    data['created_at'] = createdAt;
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    return data;
  }
}

class Subscription {
  int? id;
  String? name;
  String? status;
  String? endsAt;
  String? currency;
  String? interval;
  String? intervalCount;
  String? expireAt;

  Subscription(
      {this.id,
      this.name,
      this.status,
      this.endsAt,
      this.currency,
      this.interval,
      this.intervalCount,
      this.expireAt});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    endsAt = json['ends_at'];
    currency = json['currency'];
    interval = json['interval'];
    intervalCount = json['interval_count'];
    expireAt = json['expire_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['ends_at'] = endsAt;
    data['currency'] = currency;
    data['interval'] = interval;
    data['interval_count'] = intervalCount;
    data['expire_at'] = expireAt;
    return data;
  }
}
