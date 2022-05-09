import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/texts.dart';

class MenuButton extends StatefulWidget {
  MenuButton({
    Key? key,
    required this.item,
    required this.hintText,
    this.value,
    required this.onChanged,
  }) : super(key: key);
  List<String> item;
  final String hintText;
  final Function(String?) onChanged;
  late String? value;
  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  
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
          value: widget.value,
          items: widget.item.map(buildMenuItem).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(item) => DropdownMenuItem(
      value: item,
      child: AppText.heading5(
        text: item,
        color: Colors.white,
      ));
}
