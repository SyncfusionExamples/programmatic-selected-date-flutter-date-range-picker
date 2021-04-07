import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(ProgrammaticDateSelection());

class ProgrammaticDateSelection extends StatefulWidget {
  @override
  DateSelectionState createState() => DateSelectionState();
}

class DateSelectionState extends State<ProgrammaticDateSelection> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Card(
          margin: const EdgeInsets.fromLTRB(50, 150, 50, 110),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            controller: _controller,
            onViewChanged: viewChanged,
          ),
        ),
      ),
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    SchedulerBinding.instance!.addPostFrameCallback((Duration duration) {
      _controller.selectedDate = args.visibleDateRange.startDate;
    });
  }
}
