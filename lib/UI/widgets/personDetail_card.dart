import 'package:flutter/material.dart';

class PersonDetailBookingCard extends StatelessWidget {
  final String name;
  final String package;
  final String date;
  final String person;

  const PersonDetailBookingCard({
    super.key,
    required this.name,
    required this.package,
    required this.date,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10.0),
      child: Card(
        color: Colors.grey.shade200,
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
                  const Text('1. ', style: TextStyle(fontWeight: FontWeight.bold)), 
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                package,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, 
                style: TextStyle(color: Colors.green[700]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 18, color: Colors.orange[700]),
                  const SizedBox(width: 4),
                  Text(date),
                  const SizedBox(width: 20),
                  Icon(Icons.person, size: 18, color: Colors.orange[700]),
                  const SizedBox(width: 4),
                  Text(person),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'View Booking details',
                    style: TextStyle(color: Colors.green[700]),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green[700]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}