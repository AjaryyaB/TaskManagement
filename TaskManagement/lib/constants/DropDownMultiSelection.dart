import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  final List<String> dropdownItems;
  final String hintText;

  MyDropdown({required this.dropdownItems, required this.hintText});

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        setState(() {
          if (selectedValues.contains(value)) {
            selectedValues.remove(value);
          } else {
            selectedValues.add(value);
          }
        });
      },
      itemBuilder: (BuildContext context) {
        return widget.dropdownItems.map((String value) {
          return PopupMenuItem(
            value: value,
            child: CheckboxListTile(
              title: Text(value),
              value: selectedValues.contains(value),
              onChanged: (_) {
                setState(() {
                  if (selectedValues.contains(value)) {
                    selectedValues.remove(value);
                  } else {
                    selectedValues.add(value);
                  }
                });
              },
            ),
          );
        }).toList();
      },
      child: ListTile(
        title: Text(widget.hintText),
        trailing: Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
