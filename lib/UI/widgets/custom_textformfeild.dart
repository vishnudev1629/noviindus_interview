import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final String? Function(String?)? validator;
  final TextEditingController? controller; // Controller parameter
  final TextInputType? keyboardType; // Keyboard type parameter
  final bool obscureText; // Obscure text parameter
  final VoidCallback? onTap; // OnTap parameter
  final Widget? suffixIcon; // Prefix icon parameter (optional)

  const CustomTextFormField({
    super.key,
    required this.hinttext,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onTap,
    this.suffixIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Use the provided controller
      keyboardType: keyboardType, // Use the provided keyboard type
      obscureText: obscureText, // Use the provided obscure text
      readOnly: onTap != null, // Make field readonly if onTap is provided
      onTap: onTap, // Trigger the onTap callback if provided
      decoration: InputDecoration(
        hintText: hinttext,
        filled: true,
        fillColor: Colors.white10,
        suffixIcon: suffixIcon, // Display prefix icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      validator: validator, // Use the provided validator
    );
  }
}