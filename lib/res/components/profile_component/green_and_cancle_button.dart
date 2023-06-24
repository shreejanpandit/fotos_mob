// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fotos_mobile/res/typo_theme_data.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// class GreenAndCancleButton extends StatelessWidget {
//   const GreenAndCancleButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 37),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () {
//               // Navigator.pop(context);
//               // showDialogAlert(
//               //   context: context,
//               //   title: 'Success',
//               //   message:
//               //       'You have successfully updated your profile.',
//               //   actionButtonTitle: 'OK',
//               // );

//               // Alert(
//               //   context: context,
//               //   style: AlertStyle(
//               //     backgroundColor: CustomTheme.faintGreenColor,
//               //     animationType: AnimationType.fromTop,
//               //     isCloseButton: true,
//               //     isOverlayTapDismiss: true,
//               //     descStyle: TextStyle(fontWeight: FontWeight.bold),
//               //     descTextAlign: TextAlign.start,
//               //     // animationDuration: Duration(milliseconds: 400),
//               //     alertBorder: RoundedRectangleBorder(
//               //       borderRadius: BorderRadius.circular(16.0),
//               //       side: BorderSide(
//               //         color: Colors.grey,
//               //       ),
//               //     ),
//               //     titleStyle: TextStyle(
//               //       color: Colors.red,
//               //     ),
//               //     alertAlignment: Alignment.center,
//               //   ),
//               //   title: "RFLUTTER ALERT",
//               // ).show();
//               Navigator.pop(context);
//               Alert(
//                   style: AlertStyle(
//                       titleStyle: TextStyle(color: Colors.white),
//                       backgroundColor: CustomTheme.lightGreenColor),
//                   context: context,
//                   closeFunction: () {
//                     Navigator.pop(context);
//                   },
//                   buttons: [],
//                   image: SvgPicture.asset(
//                     'assets/branding/home/tick.svg',
//                     height: 41,
//                     width: 41,
//                   ),
//                   title: 'Upload Sucessful !',
//                   closeIcon: InkWell(
//                     child: SvgPicture.asset(
//                       'assets/branding/home/close.svg',
//                       height: 20,
//                       width: 20,
//                     ),
//                   )).show();
//             },
//             child: Container(
//               width: 113,
//               height: 37,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(33),
//                 color: CustomTheme.faintGreenColor,
//               ),
//               child: const Center(
//                 child: Text(
//                   'GreenButton',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 17,
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               width: 113,
//               height: 37,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(33),
//                 color: CustomTheme.faintTextColor,
//               ),
//               child: const Center(
//                 child: Text(
//                   'Cancel',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';

class GreenAndCancleButton extends StatelessWidget {
  final String greenButtonText;
  // final String cancelButtonText;
  final VoidCallback onGreenButton;
  // final VoidCallback onCancel;

  const GreenAndCancleButton({
    Key? key,
    required this.greenButtonText,
    // required this.cancelButtonText,
    required this.onGreenButton,
    // required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 37),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onGreenButton,
            child: Container(
              width: 113,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: CustomTheme.faintGreenColor,
              ),
              child: Center(
                child: Text(
                  greenButtonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 113,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: CustomTheme.faintTextColor,
              ),
              child: const Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
