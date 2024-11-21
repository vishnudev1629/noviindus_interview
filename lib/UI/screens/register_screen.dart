import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_interview/UI/widgets/custom_bottom_button.dart';
import 'package:noviindus_interview/UI/widgets/custom_dropdwonbutton.dart';
import 'package:noviindus_interview/UI/widgets/custom_textformfeild.dart';
import 'package:noviindus_interview/core/constants/style/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedOption = 'Cash';
  String _selectedDate = 'Date';

  final List<ClassItem> hours = List.generate(
      24,
      (index) => ClassItem(
          displayName: index.toString().padLeft(2, '0'), id: index.toString()));
  final List<ClassItem> minutes = List.generate(
      12,
      (index) => ClassItem(
          displayName: (index * 5).toString().padLeft(2, '0'),
          id: (index * 5).toString()));

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        setState(() {
          _selectedDate = DateFormat('yyyy-MM-dd').format(picked);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error selecting date.'),
      ));
    }
  }

  void _showTreatments() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const MyPopup();
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Padding(
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
              const CustomTextFormField(hinttext: 'Enter your email'),
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
                color: Colors.grey.shade100,
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
                          const Text(
                            '1. ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Couple Combo package i..',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/Register_remove.svg'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'male',
                            style: TextStyle(
                                fontSize: 16, color: Color(0XFF006837)),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text('2',
                                style: TextStyle(
                                    color: Color(0XFF006837), fontSize: 16)),
                          ),
                          const SizedBox(width: 30),
                          const Text('female',
                              style: TextStyle(
                                  color: Color(0XFF006837), fontSize: 16)),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text('2',
                                style: TextStyle(
                                    color: Color(0XFF006837), fontSize: 16)),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/register_edit.svg')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomBottomButton(
                backgroundcolor: const Color(0XFFc4e2c8),
                foregroundColor: const Color(0XFF000000),
                text: '+Add Treatments',
                onPressed: _showTreatments,
              ),
              const SizedBox(height: 20),
              Text(
                'Total Amount',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              const CustomTextFormField(hinttext: 'Enter your total amount'),
              const SizedBox(height: 12),
              const SizedBox(height: 12),
              Text(
                'Discount Amount',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              const CustomTextFormField(hinttext: 'Enter your discount amount'),
              const SizedBox(height: 20),
              Text(
                'Payment Option',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Cash',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value.toString();
                          });
                        },
                      ),
                      const Text('Cash'),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Card',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value.toString();
                          });
                        },
                      ),
                      const Text('Card'),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'UPI',
                        groupValue: _selectedOption,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value.toString();
                          });
                        },
                      ),
                      const Text('UPI'),
                    ],
                  ),
                ],
              ),
              Text(
                'Advance Amount',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              const CustomTextFormField(hinttext: 'Enter your advance amount'),
              const SizedBox(height: 20),
              Text(
                'Balance Amount',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              const CustomTextFormField(
                hinttext: 'Enter your balance amount',
              ),
              const SizedBox(height: 20),
              Text(
                'Treatment Date',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              CustomTextFormField(
                hinttext: 'Enter your treatment date',
                controller: TextEditingController(text: _selectedDate),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/icons/register_calendr.svg'),
                ),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 20),
              Text(
                'Treatment Time',
                style: TextStyles.poppins16Color40w400,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtons(
                      classItems: hours,
                      onClassChanged: (ClassItem? value) {
                        setState(() {});
                      },
                      hinttext: 'Hour',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtons(
                      classItems: minutes,
                      onClassChanged: (ClassItem? value) {
                        setState(() {});
                      },
                      hinttext: 'Minutes',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomBottomButton(
                  backgroundcolor: const Color(0xff006837),
                  foregroundColor: const Color(0xffFFFFFF),
                  text: 'Save',
                  onPressed: () {}),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPopup extends StatefulWidget {
  const MyPopup({
    super.key,
  });

  @override
  State<MyPopup> createState() => _MyPopupState();
}

class _MyPopupState extends State<MyPopup> {
  int Mcounter = 0;
  int Fcounter = 0;

  void maleIncrementCounter() {
    setState(() {
      Mcounter++;
    });
  }

  void femaleIncrementCounter() {
    setState(() {
      Fcounter++;
    });
  }

  void maleDecrementCounter() {
    setState(() {
      if (Mcounter > 0) {
        Mcounter--;
      }
    });
  }

  void femaleDecrementCounter() {
    setState(() {
      if (Fcounter > 0) {
        Fcounter--;
      }
    });
  }

  String? selectedTreatment;
  final List<ClassItem> classItems = [
    ClassItem(displayName: 'Treatement 1', id: '1'),
    ClassItem(displayName: 'Treatement 2', id: '2'),
    ClassItem(displayName: 'Treatement 3', id: '3'),
  ];

  ClassItem? selectedClass;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Treatment'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 50.0,
          maxHeight: 220,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hinttext: 'Choose prefered treatment',
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_down)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Add Patients'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(child: Text("Male")),
                  ),
                ),
                GestureDetector(
                  onTap: maleDecrementCounter,
                  child: SvgPicture.asset('assets/icons/popup_minus.svg'),
                ),
                Container(
                  width: 35,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                      child: Text(
                    '$Mcounter',
                  )),
                ),
                GestureDetector(
                    onTap: maleIncrementCounter,
                    child: SvgPicture.asset('assets/icons/popup_plus.svg')),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(child: Text("Female")),
                  ),
                ),
                GestureDetector(
                    onTap: femaleDecrementCounter,
                    child: SvgPicture.asset('assets/icons/popup_minus.svg')),
                Container(
                  width: 35,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(child: Text('$Fcounter')),
                ),
                GestureDetector(
                    onTap: femaleIncrementCounter,
                    child: SvgPicture.asset('assets/icons/popup_plus.svg')),
              ],
            )
          ],
        ),
      ),
      actions: <Widget>[
        CustomBottomButton(
            backgroundcolor: const Color(0xff006837),
            foregroundColor: const Color(0xffFFFFFF),
            text: 'Save',
            onPressed: () {})
      ],
    );
  }
}
