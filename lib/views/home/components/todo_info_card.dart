import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/texts.dart';

class TodoInfoCard extends StatelessWidget {
  const TodoInfoCard({
    Key? key,
    required this.text,
    required this.time, 
    required this.title,
  }) : super(key: key);
  final String title;
  final String text;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: 150,
      decoration:
      title == "Ongoing" ?
       BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5),
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kPrimaryColor,
              kPrimaryLightColor.shade600,
            ]),
        borderRadius: BorderRadius.circular(10),
      ): BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 5),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.body(
            text: title,
            color:  title == "Ongoing" ?Colors.white:Colors.black,
          ),
          Expanded(
              child: AppText.heading3(
            text: text,
            color:  title == "Ongoing" ?Colors.white:Colors.black,
            multilines: true,
          )),
          const SizedBox(
            height: 4,
          ),
          AppText.caption(
            text: time,
            color:  title == "Ongoing" ?Colors.white:Colors.black,
          ),
        ],
      ),
    );
  }
}
