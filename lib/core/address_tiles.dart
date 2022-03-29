// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shopping/core/size_config.dart';
// import 'package:shopping/core/styles.dart';
// import 'package:shopping/router/app_router.dart';

// class AddressTiles extends StatefulWidget {
//   final String name;
//   final String address;
//   final bool isChange;
//   final bool isEdit;
//   final bool isDefault;
//   const AddressTiles({
//     Key? key,
//     required this.name,
//     required this.address,
//     this.isChange = false,
//     this.isEdit = false,
//     this.isDefault = false,
//   }) : super(key: key);

//   @override
//   State<AddressTiles> createState() => _AddressTilesState();
// }

// class _AddressTilesState extends State<AddressTiles> {
//   bool value = false;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 15,
//           right: 15,
//           top: 20,
//           bottom: 20,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   widget.name,
//                   style: GoogleFonts.poppins(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const Spacer(),
//                 if (widget.isChange)
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, ShoppPages.addresslist);
//                     },
//                     child: Text(
//                       'Change',
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: kPrimaryColor,
//                       ),
//                     ),
//                   ),
//                 if (widget.isEdit)
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'Edit',
//                       style: GoogleFonts.poppins(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: kPrimaryColor,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(
//               height: SizeConfig.minBlockVertical!,
//             ),
//             Text(
//               widget.address,
//               style: GoogleFonts.poppins(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.minBlockVertical!,
//             ),
//             if (widget.isDefault)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Checkbox(
//                     value: value,
//                     onChanged: (val) {
//                       setState(() {
//                         value = !value;
//                       });
//                     },
//                   ),
//                   const SizedBox(
//                     width: 2,
//                   ),
//                   Text(
//                     'Use as the shipping address',
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
