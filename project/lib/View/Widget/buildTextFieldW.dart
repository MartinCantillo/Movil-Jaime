
import 'package:flutter/material.dart';

Widget buildTextField({
  required String labelText,
  required IconData prefixIcon,
  required FormFieldSetter<String> onSaved,
  required FormFieldValidator<String> validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(),
    ),
    onSaved: onSaved,
    validator: validator,
    keyboardType: keyboardType,
  );
}

Widget buildDatePicker({
  required BuildContext context,
  required String labelText,
  required IconData prefixIcon,
  required DateTime selectedDate,
  required Function(DateTime) onDateSelected,
}) {
  return GestureDetector(
    onTap: () async {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null) {
        onDateSelected(pickedDate);
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(
            text: '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
      ),
    ),
  );
}

Widget buildTimePicker({
  required BuildContext context,
  required String labelText,
  required IconData prefixIcon,
  required TimeOfDay selectedTime,
  required Function(TimeOfDay) onTimeSelected,
}) {
  return GestureDetector(
    onTap: () async {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (pickedTime != null) {
        onTimeSelected(pickedTime);
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(
            text: '${selectedTime.hour}:${selectedTime.minute}'),
      ),
    ),
  );
}
