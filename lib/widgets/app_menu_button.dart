import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/texts.dart';
import 'package:todo_app/widgets/my_list.dart';

class MenuButton extends StatefulWidget {
  MenuButton({
    Key? key,
    required this.hintText,
    this.priority,
    required this.onChanged,
  }) : super(key: key);
  final String hintText;
  final Function(String?) onChanged;
  late String? priority;
  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  MyList list = MyList();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        border: Border.all(
          color: const Color(0XFFFFFFFF),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: kPrimaryLightColor,
          hint: AppText.body(
            text: widget.hintText,
            color: Colors.white,
          ),
          value: widget.priority,
          items: list.prority.map(buildMenuItem).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String value) => DropdownMenuItem(
      value: value ,
      child: AppText.heading5(
        text: value,
        color: Colors.white,
      ));
}
