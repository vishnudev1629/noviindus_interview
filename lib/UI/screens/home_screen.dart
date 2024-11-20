import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noviindus_interview/UI/widgets/custom_bottom_button.dart';
import 'package:noviindus_interview/UI/widgets/personDetail_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedDate = 'Date';

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

  final List<Map<String, String>> bookings = [
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation)',
      'date': '31/01/2024',
      'person': 'Jithesh',
    },
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation)',
      'date': '31/01/2024',
      'person': 'Jithesh',
    },
  ];

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for treatments',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            width: 0.3,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF006837),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 18),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(color: Color(0XFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sort by:'),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: TextEditingController(text: _selectedDate),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            width: 0.3,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return PersonDetailBookingCard(
                  name: booking['name']!,
                  package: booking['package']!,
                  date: booking['date']!,
                  person: booking['person']!,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomBottomButton(
                  backgroundcolor: const Color(0xff006837),
                  foregroundColor: const Color(0xffFFFFFF),
                  text: 'Register Now',
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
