import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotos_mobile/view/profile/payment/payment_details.dart';


class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({super.key});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
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
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PaymentMethod(
                imagePath: 'assets/branding/payment/Visa.svg',
                text: 'Visa',
                selectedIndex: 0,
              ),
              PaymentMethod(
                imagePath: 'assets/branding/payment/Mastercard.svg',
                text: 'MasterCard',
                selectedIndex: 1,
              ),
              PaymentMethod(
                imagePath: 'assets/branding/payment/Amex.svg',
                text: 'American Express',
                selectedIndex: 2,
              ),
              PaymentMethod(
                imagePath: 'assets/branding/payment/Paypal.svg',
                text: 'PayPal',
                selectedIndex: 3,
              ),
              PaymentMethod(
                imagePath: 'assets/branding/payment/Diners.svg',
                text: 'Diners',
                selectedIndex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String imagePath;
  final String text;
  final int selectedIndex;

  const PaymentMethod({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PaymentDetailScreen(selectedIndex: selectedIndex),
          ),
        );
        // Navigator.pushNamed(context, RoutesName.select_payment,
        //     arguments: selectedIndex);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15, left: 7, right: 7),
        width: double.infinity,
        height: 88,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.25,
              color: Color(0xFFE4E4E4),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imagePath,
                ),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
