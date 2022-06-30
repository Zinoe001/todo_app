// import 'package:flutter/material.dart';

// class ValidatorCard extends StatelessWidget {
//   const ValidatorCard({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//             onTap: () async {
//               if (_formKey.currentState!.validate()) {
//                 print("validating time");
//                 if (dateTime == null) {
//                   snackbar.showError(context,
//                       title: "No Date Selected",
//                       message: "You have not selected a date");
//                 } else if (time2 == null) {
//                   snackbar.showError(context,
//                       title: "No Time Selected",
//                       message: "You have not selected a start time");
//                 } else if (time3 == null) {
//                   snackbar.showError(context,
//                       title: "No Time Selected",
//                       message: "You have not selected an end time");
//                 } else {
//                   Navigator.pop(context);
//                   snackbar.showSuccessful(
//                       context,
//                       title: "Todo Created",
//                       message:
//                           "YOu have succesfully created your todo for $dateTime");
//                  widget.getTask(
//                                 {
//                                   "text": controller1,
//                                   "category": controller2,
//                                   "priority": priority,
//                                   "date": dateTime,
//                                   "time": "${time2} - ${time3} ",
//                                 },
//                       );
//                 }
//               }
//             },
//             child: Center(
//               child: Container(
//                 height: 45,
//                 width: 225,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: AppText.heading5(text: "ADD TASK"),
//                 ),
//               ),
//             ),
//           ),;
//   }
// }