import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/payment_intent_nodel.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, dynamic>? paymentIntent;
  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('0.99', 'USD');
      print(paymentIntent);
      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  // style: ThemeMode.dark,
                  merchantDisplayName: 'Shreejan Pandit'))
          .then((value) {
        print(value);
        displayPaymentSheet();
      });

      //STEP 3: Display Payment sheet
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print('aayo');
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                    ],
                  ),
                ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print(json.decode(response.body));
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (double.parse(amount)) * 100;
    return '${calculatedAmout.toInt()}';
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(left: 32, right: 33),
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'No Payment Found',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'You can add and edit payments during checkout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                print('Add new payment');
                // Navigator.pushNamed(context, RoutesName.add_payment);
                await makePayment();
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Container(
                  width: 325,
                  height: 184.33,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0x99E4E4E4)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14323247),
                        blurRadius: 24,
                        offset: Offset(0, 16),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x14323247),
                        blurRadius: 12,
                        offset: Offset(0, 12),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Icon(
                            Icons.add_circle_outline,
                            color: Color(0xFF239DE9),
                            size: 60,
                            weight: 0.5,
                          ),
                        ),
                        Text(
                          'Add Payment Method',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF239DE9),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
