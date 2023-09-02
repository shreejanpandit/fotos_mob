import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/payment_detail_model.dart';
import '../../../models/payment_history_model.dart';
import '../../../models/payment_intent_nodel.dart';
import '../../../res/app_urls.dart';
import '../../../res/typo_theme_data.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isLoading = true;
  List<PaymentHistoryData?>? paymentHistoryData;
  Future<List<PaymentHistoryData?>?> getPaymentHistory() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    try {
      final response =
          await http.get(Uri.parse('${AppUrl.baseUrl}payments'), headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        final decodedResp = jsonDecode(response.body);
        paymentHistoryData = PaymentHistoryModel.fromJson(decodedResp).data!;
        print('........................$paymentHistoryData');
        print('........................${response.body}');
        return paymentHistoryData;
      } else {
        print('unsucessful');
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  PaymentDetailData? paymentDetailData;

  Future<PaymentDetailData?> getPaymentDetail(String id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    try {
      final response =
          await http.get(Uri.parse('${AppUrl.baseUrl}payments/$id'), headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': "Bearer $token",
      });
      if (response.statusCode == 200) {
        final decodedResp = jsonDecode(response.body);
        paymentDetailData = PaymentDetailModel.fromJson(decodedResp).data!;

        print('........................$paymentDetailData');
        print('........................${response.body}');
        return paymentDetailData;
      } else {
        print('unsucessful');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) {
        getPaymentHistory().then((value) {
          setState(() {
            isLoading = false;
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void _showBottomSheetUpdate(dynamic val) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Title text color
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.id}', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('\$${val.price}', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.status}', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Created At:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.createdAt}', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.grey, // Separator line color
                  thickness: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Subscription Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Title text color
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subscription ID:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.subscription.id}',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subscription Name:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.subscription.name}',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Interval:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.subscription.interval}',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Interval Count:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.subscription.intervalCount}',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Expire At:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${val.subscription.expireAt}',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFA7A7A7),
            size: 16,
          ),
        ),
        title: const Text(
          'Payments',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Payment History',
                style: CustomTheme.h5,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Text(
            //     '${paymentHistoryData![0]!.status.toString()}',
            //   ),
            // ),
            if (isLoading) Center(child: CircularProgressIndicator.adaptive()),
            if (!isLoading)
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  itemCount: paymentHistoryData!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          print('${paymentHistoryData![index]!.id.toString()}');
                          await getPaymentDetail(
                                  paymentHistoryData![index]!.id.toString())
                              .then((value) {
                            _showBottomSheetUpdate(value);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black
                                  .withOpacity(0.5), // Black border color
                              width: 2.0, // Border width
                            ),
                            color: Colors.white, // White background color
                            borderRadius:
                                BorderRadius.circular(10.0), // Rounded corners
                          ),
                          child: ListTile(
                            leading: Text(
                              '${paymentHistoryData![index]!.id.toString()}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700, // Black text color
                              ),
                            ),
                            title: Text(
                              'Amount:  \$ ${paymentHistoryData![index]!.price.toString()}',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey.shade700, // Black text color
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              '${paymentHistoryData![index]!.status.toString()}',
                              style: TextStyle(
                                fontSize: 18,
                                color: paymentHistoryData![index]!
                                            .status
                                            .toString() ==
                                        'success'
                                    ? Color.fromARGB(255, 35, 255, 46)
                                    : Colors.red,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black, // Black icon color
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
