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
    final DateTime currentDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(

      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate:currentDate,
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Customize your date picker theme here
            colorScheme: const ColorScheme.light(
              primary: AppConstants.boldBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Colors.white, // Calendar background color
              onSurface: Colors.black, // Calendar text color
              shadow: AppConstants.boldBlue
            ),

          ),
          child: child!,
        );
      },
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
