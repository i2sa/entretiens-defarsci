// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:date_range_picker/date_range_picker.dart';
import "package:intl/intl.dart";

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélection de Plage de Dates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: const Text('Sélectionner la Plage de Dates'),
            ),
            const SizedBox(height: 16),
            if (selectedDateRange != null)
              Text(
                'Plage de Dates Sélectionnée:\n${DateFormat('dd/MM/yyyy').format(selectedDateRange!.start)} - ${DateFormat('dd/MM/yyyy').format(selectedDateRange!.end)}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
