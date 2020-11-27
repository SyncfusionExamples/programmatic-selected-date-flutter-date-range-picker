import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(ProgrammaticDateSelection());


class ProgrammaticDateSelection extends StatefulWidget {
  @override
  DateSelectionState createState() => DateSelectionState();
}

class DateSelectionState extends State<ProgrammaticDateSelection> {
  DateRangePickerController _controller;

  @override
  void initState() {
    _controller = DateRangePickerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.fromLTRB(50, 150, 50, 110),
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          controller: _controller,
          onViewChanged: viewChanged,
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void viewChanged(DateRangePickerViewChangedArgs args) {
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      _controller.selectedDate = args.visibleDateRange.startDate;
    });
  }
}
