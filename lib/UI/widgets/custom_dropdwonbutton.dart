import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButtons extends StatefulWidget {
  final List<ClassItem> classItems;
  final Function(ClassItem?) onClassChanged;
  final String hinttext;
  

  const DropdownButtons({
    super.key,
    required this.classItems,
    required this.onClassChanged,
    required this.hinttext,
  });

  @override
  State<DropdownButtons> createState() => _DropdownButtonsState();
}

class _DropdownButtonsState extends State<DropdownButtons> {
  ClassItem? _selectedClassItem;

  List<DropdownMenuItem<ClassItem>> _addDividersAfterItems(
      List<ClassItem> items) {
    final List<DropdownMenuItem<ClassItem>> menuItems = [];
    for (final ClassItem item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<ClassItem>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.displayName, 
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
      
          if (item != items.last)
            const DropdownMenuItem<ClassItem>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (widget.classItems.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }

      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Use the full screen width
      height: 59,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0XFFFEFFFF),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color.fromARGB(255, 92, 92, 92), // Black border color
          width: 1.0, // Width of the border
        ),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton2<ClassItem>(
          isExpanded: true,
          hint: Text(
            widget.hinttext,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: _addDividersAfterItems(widget.classItems),
          value: _selectedClassItem,
          onChanged: (ClassItem? value) {
            setState(() {
              _selectedClassItem = value;
            });
            widget.onClassChanged(value); // Pass the selected value back
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            customHeights: _getCustomItemsHeights(),
          ),
          iconStyleData: const IconStyleData(
            openMenuIcon: Icon(Icons.arrow_drop_up),
          ),
        ),
      ),
    );
  }
}

class ClassItem {
  final String displayName;
  final String id;

  ClassItem({required this.displayName, required this.id});
}
