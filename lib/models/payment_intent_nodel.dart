class PaymentIntentModel {
  Data? data;
  String? message;

  PaymentIntentModel({this.data, this.message});

  PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? clientSecret;
  String? setupIntentId;

  Data({this.clientSecret, this.setupIntentId});

  Data.fromJson(Map<String, dynamic> json) {
    clientSecret = json['client_secret'];
    setupIntentId = json['setup_intent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_secret'] = this.clientSecret;
    data['setup_intent_id'] = this.setupIntentId;
    return data;
  }
}
