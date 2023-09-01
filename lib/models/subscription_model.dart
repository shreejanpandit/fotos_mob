class SubscriptionModel {
  List<SubscriptionData>? data;
  String? message;

  SubscriptionModel({this.data, this.message});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SubscriptionData>[];
      json['data'].forEach((v) {
        data!.add(new SubscriptionData.fromJson(v));
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

class SubscriptionData {
  String? id;
  String? object;
  bool? active;
  Null? aggregateUsage;
  int? amount;
  String? amountDecimal;
  String? billingScheme;
  int? created;
  String? currency;
  String? interval;
  int? intervalCount;
  bool? livemode;
  List<Null>? metadata;
  Null? nickname;
  String? product;
  Null? tiersMode;
  Null? transformUsage;
  Null? trialPeriodDays;
  String? usageType;

  SubscriptionData(
      {this.id,
      this.object,
      this.active,
      this.aggregateUsage,
      this.amount,
      this.amountDecimal,
      this.billingScheme,
      this.created,
      this.currency,
      this.interval,
      this.intervalCount,
      this.livemode,
      this.metadata,
      this.nickname,
      this.product,
      this.tiersMode,
      this.transformUsage,
      this.trialPeriodDays,
      this.usageType});

  SubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    active = json['active'];
    aggregateUsage = json['aggregate_usage'];
    amount = json['amount'];
    amountDecimal = json['amount_decimal'];
    billingScheme = json['billing_scheme'];
    created = json['created'];
    currency = json['currency'];
    interval = json['interval'];
    intervalCount = json['interval_count'];
    livemode = json['livemode'];
    // if (json['metadata'] != null) {
    //   metadata = <List>[];
    //   json['metadata'].forEach((v) {
    //     metadata!.add(new Null.fromJson(v));
    //   });
    // }
    nickname = json['nickname'];
    product = json['product'];
    tiersMode = json['tiers_mode'];
    transformUsage = json['transform_usage'];
    trialPeriodDays = json['trial_period_days'];
    usageType = json['usage_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['active'] = this.active;
    data['aggregate_usage'] = this.aggregateUsage;
    data['amount'] = this.amount;
    data['amount_decimal'] = this.amountDecimal;
    data['billing_scheme'] = this.billingScheme;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['interval'] = this.interval;
    data['interval_count'] = this.intervalCount;
    data['livemode'] = this.livemode;
    // if (this.metadata != null) {
    //   data['metadata'] = this.metadata!.map((v) => v.toJson()).toList();
    // }
    data['nickname'] = this.nickname;
    data['product'] = this.product;
    data['tiers_mode'] = this.tiersMode;
    data['transform_usage'] = this.transformUsage;
    data['trial_period_days'] = this.trialPeriodDays;
    data['usage_type'] = this.usageType;
    return data;
  }
}
