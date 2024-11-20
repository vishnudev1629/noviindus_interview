import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noviindus_interview/UI/widgets/custom_bottom_button.dart';
import 'package:noviindus_interview/UI/widgets/custom_textformfeild.dart';
import 'package:noviindus_interview/core/constant/style/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 217,
                child: Stack(children: [
                  Image.asset(
                    'assets/images/login_screen_img.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Center(
                      child: SvgPicture.asset(
                          'assets/images/login_screen_logo.svg')),
                ]),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Login or register to book\nyour appointments',
                  style: TextStyles.poppins24Color40w600,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Email',
                  style: TextStyles.poppins16Color40w400,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextFormField(
                  hinttext: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required'; 
                    }
                    return null;
                  },
                  keyboardType: TextInputType
                      .emailAddress,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Password',
                  style: TextStyles.poppins16Color40w400,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomTextFormField(
                    hinttext: 'Enter your password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  )),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomBottomButton(
                  backgroundcolor: const Color(0xff006837),
                  foregroundColor: const Color(0xffFFFFFF),
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      //Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      children: [
                        const TextSpan(
                          text:
                              'By creating or logging into an account you are agreeing with our ',
                        ),
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
