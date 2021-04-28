import 'package:flutter/material.dart' hide CalendarDatePicker;
import 'package:intl/intl.dart' as intl;
import 'package:flutter_date_picker/date_picker.dart';

///
class CalendarDateRangePickerWidget extends StatefulWidget {
  @override
  _CalendarDateRangePickerWidgetState createState() =>
      _CalendarDateRangePickerWidgetState();
}

class _CalendarDateRangePickerWidgetState
    extends State<CalendarDateRangePickerWidget> {
  ///
  final List<DateTime> dateRange = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 5)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CalendarDateRangePicker(
              initialStartDate: DateTime.now(),
              initialEndDate: DateTime.now().add(Duration(days: 5)),
              firstDate: DateTime(1970),
              lastDate: DateTime(2100),
              onStartDateChanged: (date) {
                dateRange.first = date;
                setState(() {});
              },
              onEndDateChanged: (date) {
                dateRange.last = date;
                setState(() {});
              },
            ),
          ),
          ListTile(
            title: Text('From: ${_format(dateRange.first)}'),
            subtitle: Text('To: ${_format(dateRange.last)}'),
            tileColor: Theme.of(context).primaryColor.withAlpha(50),
          ),
        ],
      ),
    );
  }

  String _format(DateTime? dateTime) {
    if (dateTime == null) return '';
    return intl.DateFormat.yMMMMEEEEd().format(dateTime);
  }
}
