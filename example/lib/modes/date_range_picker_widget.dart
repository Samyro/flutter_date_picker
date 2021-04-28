import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:flutter_date_picker/date_picker.dart' as picker;

///
class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? _selectedDateTimeRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_selectedDateTimeRange != null)
            Text(
              'From Date: ${intl.DateFormat("EEE, MMMM d, y").format(_selectedDateTimeRange!.start)}\n\n'
              'To Date: ${intl.DateFormat("EEE, MMMM d, y").format(_selectedDateTimeRange!.end)}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () async {
                _selectedDateTimeRange =
                    await picker.showMaterialDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2099),
                );
                setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'SELECT DATE RANGE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
