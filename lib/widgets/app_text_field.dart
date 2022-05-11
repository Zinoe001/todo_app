import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    required this.validMessage,
    required this.hintText,
    this.onTap, 
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String validMessage;
  final String hintText;
  final Function()? onTap;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: (value){
          if(value?.isEmpty ?? true ) return validMessage;
          return null;
        },
        onTap: onTap,
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
