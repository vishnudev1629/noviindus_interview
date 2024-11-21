
import 'package:flutter/material.dart';

Future<void> navigateToSiginIn(BuildContext context) {
  return Navigator.of(context).pushReplacementNamed('/login');
}

Future<void> navigateToRegister(BuildContext context) {
  return Navigator.of(context).pushNamed('/register');
}