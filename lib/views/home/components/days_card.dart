// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/texts.dart';

class DaysCard extends StatelessWidget {
   DaysCard({
    Key? key,
    required this.day,
    required this.istap,
  }) : super(key: key);
  final int day;
  bool istap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.only(right: 12),
      height: 32,
      width: 95,
      decoration: istap? BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kPrimaryColor,
            kPrimaryLightColor.shade600,
          ]),
      borderRadius: BorderRadius.circular(10),
    ): BoxDecoration(
      border: Border.all(),
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
      child: Column(
        children: [
          AppText.heading1(
            text: "${day + 1}",
            color: istap? Colors.white: Colors.black,
            ),
        ],
      ),
    );
  }
}
