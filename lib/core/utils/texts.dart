import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/textstyles.dart';

class AppText extends StatelessWidget {
  //constructor for heading 1 style
  AppText.heading1(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = headingStyle1.copyWith(color: color),
        super(key: key);
  //constructor for heading 2 style
  AppText.heading2(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = headingStyle2.copyWith(color: color),
        super(key: key);
  //constructor for heading 3 style
  AppText.heading3(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = headingStyle3.copyWith(color: color),
        super(key: key);
  //constructor for heading 4 style
  AppText.heading4(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = headingStyle4.copyWith(color: color),
        super(key: key);
  //constructor for heading 5 style
  AppText.heading5(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = headingStyle5.copyWith(color: color),
        super(key: key);
  // constructor for heading 6 style
  AppText.heading6(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = headingStyle6.copyWith(color: color),
        super(key: key);
  //constructor for body style
  AppText.body(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = bodyStyle.copyWith(color: color),
        super(key: key);
  //constructor for caption style
  AppText.caption(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = captionStyle.copyWith(color: color),
        super(key: key);
  //constructor for button style
  AppText.buttton(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = buttonStyle.copyWith(color: color),
        super(key: key);
  //constructor for small style
  AppText.small(
      {Key? key,
      required this.text,
      this.color,
      this.centered = false,
      this.maxlines,
      this.multilines = false})
      : style = smallStyle.copyWith(color: color),
        super(key: key);
// defining parameters for the text widgets 
  final String text;
  final TextStyle style;
  final Color? color;
  final bool centered;
  final int? maxlines;
  final bool multilines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: centered ? TextAlign.center : TextAlign.left,
      maxLines: multilines || maxlines != null ? maxlines ?? 999999 : 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
