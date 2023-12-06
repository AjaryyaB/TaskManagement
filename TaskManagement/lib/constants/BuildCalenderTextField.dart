import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

class CalendarTextField extends StatefulWidget {
  void Function(DateTime? value) onDateSelected;

  CalendarTextField({super.key, required this.onDateSelected});

  @override
  _CalendarTextFieldState createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.onDateSelected(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(
        text: _selectedDate != null
            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
            : '',
      ),
      decoration: InputDecoration(
       hintText: 'DD/MM/YYYY',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(color: AppConstants.hintText),
        filled: true,
        fillColor: AppConstants.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: AppConstants.inputBorder, // Border color in RGBA
          ),
        ),
        suffixIcon: AppConstants.calenderIcon,
      ),
      onTap: () {
        _selectDate(context);
      },
    );
  }
}
