import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final String? Function(String?)? validator;
  final TextEditingController? controller; //Added controller parameter
  final TextInputType? keyboardType; //Added keyboardType parameter
  final bool obscureText; //Added obscureText parameter


  const CustomTextFormField({
    super.key,
     required this.hinttext,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, //Use the provided controller
      keyboardType: keyboardType, //Use the provided keyboardType
      obscureText: obscureText, //Use the provided obscureText
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.grey, 
          ),
        ),
      ),
      validator: validator, 
    );
  }
}