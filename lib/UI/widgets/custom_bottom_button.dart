import 'package:flutter/material.dart';
import 'package:noviindus_interview/core/constant/style/text_style.dart';

// ignore: must_be_immutable
class CustomBottomButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var backgroundcolor;
  // ignore: prefer_typing_uninitialized_variables
  var foregroundColor;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  var onPressed;
  final double borderRadius;

  CustomBottomButton({
    super.key,
    required this.backgroundcolor,
    required this.foregroundColor,
    required this.text,
    required this.onPressed,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.poppins17w600,
        ),
      ),
    );
  }
}
