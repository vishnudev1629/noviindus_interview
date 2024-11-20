import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:noviindus_interview/UI/widgets/custom_textformfeild.dart';
import 'package:noviindus_interview/core/constant/style/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 7,
                    minHeight: 7,
                  ),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Register'),
            const SizedBox(height: 15),
            Text(
              'Name',
              style: TextStyles.poppins16Color40w400,
              textAlign: TextAlign.start,
            ),
            const CustomTextFormField(hinttext: 'Enter your Name'),
            const SizedBox(height: 12),
            Text(
              'Whatsapp Number',
              style: TextStyles.poppins16Color40w400,
              textAlign: TextAlign.start,
            ),
            const CustomTextFormField(hinttext: 'Enter your whatsapp number'),
            const SizedBox(height: 12),
            Text(
              'Address',
              style: TextStyles.poppins16Color40w400,
              textAlign: TextAlign.start,
            ),
            const CustomTextFormField(hinttext: 'Enter your address'),
            const SizedBox(height: 12),
            Text(
              'Email',
              style: TextStyles.poppins16Color40w400,
              textAlign: TextAlign.start,
            ),
            const CustomTextFormField(hinttext: 'hinttext'),
            const SizedBox(height: 12),
            Text(
              'Location',
              style: TextStyles.poppins16Color40w400,
              textAlign: TextAlign.start,
            ),
            const CustomTextFormField(hinttext: 'Enter your location'),
            const SizedBox(height: 12),
            Text(
              'Branch',
              style: TextStyles.poppins16Color40w400,
              textAlign: TextAlign.start,
            ),
            const CustomTextFormField(hinttext: 'Enter your Branch'),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('1. ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text(
                          'Couple Combo package i..',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black),
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/Register_remove.svg'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('male'),
                        SizedBox(width: 10), // Add some spacing
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:
                              Text('2', style: TextStyle(color: Colors.green)),
                        ),
                        SizedBox(width: 30),
                        Text('female'),
                        SizedBox(width: 10), // Add some spacing
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:
                              Text('2', style: TextStyle(color: Colors.green)),
                        ),
                        Spacer(),
                        SvgPicture.asset('assets/icons/register_edit.svg')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
