import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/components/profile_component/green_and_cancle_button.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';

import 'choose_payment_method.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentScreenState createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  bool _toggleValue = false;
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
        title: const Center(
          child: Text(
            'Add Payment Methods',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 34),
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const PaymentTextField(
                label: 'Full Name',
                hintText: 'John Doe',
              ),
              const PaymentTextField(
                label: 'Street Address',
                hintText: 'Rajakochautara',
              ),
              const PaymentTextField(
                label: 'State',
                hintText: 'Gandaki',
              ),
              const PaymentTextField(
                label: 'City',
                hintText: 'Kaski',
              ),
              const PaymentTextField(
                label: 'Postal Code',
                hintText: '33700',
              ),
              Row(
                children: [
                  Switch(
                    value: _toggleValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        _toggleValue = newValue;
                      });
                    },
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'SET AS DEFAULT',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 41),
                child: GreenAndCancleButton(
                  greenButtonText: 'Next',
                  onGreenButton: () {
                    Navigator.pushNamed(context, RoutesName.select_payment);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;

  const PaymentTextField({
    Key? key,
    this.controller,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: ShapeDecoration(
              color: const Color(0xFFF8F8F8),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xA3E4E4E4)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
