import 'package:doctor_notes/store/actions/datePickers_actions.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final Function confirmSelectedDate;
  final Function confirmStartTime;
  final Function confirmEndTime;
  String selectedDateFromStore;
  String selectedStartTimeFromStore;
  String selectedEndTimeFromStore;

  _ViewModel(
      {this.selectedEndTimeFromStore,
      this.confirmSelectedDate,
      this.selectedDateFromStore,
      this.confirmStartTime,
      this.selectedStartTimeFromStore,
      this.confirmEndTime});
}

class DatePickers extends StatelessWidget {
  final List<String> selectedNoteData;
  final DateTime selectedDate = DateTime.now();
  final TimeOfDay selectedStartTime = TimeOfDay.now();
  final TimeOfDay selectedEndTime = TimeOfDay.now();

  DatePickers({this.selectedNoteData});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(
          selectedStartTimeFromStore: store.state.dates[1],
          selectedEndTimeFromStore: store.state.dates[2],
          selectedDateFromStore: store.state.dates[0],
          confirmSelectedDate: (String data) =>
              store.dispatch(ConfirmDates(data)),
          confirmEndTime: (String data) => store.dispatch(ConfirmEndTime(data)),
          confirmStartTime: (String data) =>
              store.dispatch(ConfirmStartTime(data))),
      builder: (BuildContext context, _ViewModel state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            this.selectedNoteData != null
                ? Column(
                    children: <Widget>[
                      Text('Date of service', style: TextStyle(fontSize: 16.0)),
                      Text('${selectedNoteData[0].toString()}'),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Text('Date of service', style: TextStyle(fontSize: 16.0)),
                      Theme(
                        data: ThemeData(
                          accentColor: Colors.yellow,
                        ),
                        child: IconButton(
                          onPressed: () =>
                              _selectDate(context, state.confirmSelectedDate),
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                      state.selectedDateFromStore != null
                          ? Text(state.selectedDateFromStore ??
                              selectedDate.toString().substring(0, 10))
                          : Text(DateTime.now().toString().substring(0, 10)),
                    ],
                  ),
            this.selectedNoteData != null
                ? Column(
                    children: <Widget>[
                      Text('Start time', style: TextStyle(fontSize: 16.0)),
                      Text('${this.selectedNoteData[1].toString()}')
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text('Start time', style: TextStyle(fontSize: 16.0)),
                        IconButton(
                          onPressed: () =>
                              _selectStartTime(context, state.confirmStartTime),
                          icon: Icon(Icons.timer),
                        ),
                        Text(state.selectedStartTimeFromStore != null
                            ? state.selectedStartTimeFromStore ??
                                selectedDate.toString().substring(10, 15)
                            : TimeOfDay.now().toString().substring(10, 15)),
                      ],
                    ),
                  ),
            this.selectedNoteData != null
                ? Column(
                    children: <Widget>[
                      Text('End time', style: TextStyle(fontSize: 16.0)),
                      Text('${this.selectedNoteData[2]}'),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Column(
                      children: <Widget>[
                        Text('End time', style: TextStyle(fontSize: 16.0)),
                        IconButton(
                          onPressed: () =>
                              _selectEndTime(context, state.confirmEndTime),
                          icon: Icon(Icons.timer),
                        ),
                        Text(state.selectedEndTimeFromStore != null
                            ? state.selectedEndTimeFromStore ??
                                selectedDate.toString().substring(10, 15)
                            : TimeOfDay.now().toString().substring(10, 15)),
                      ],
                    ))
          ],
        );
      },
    );
  }

  Future<Null> _selectDate(BuildContext context, confirmSelectedDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null) {
      confirmSelectedDate(picked.toString().substring(0, 10));
    }
  }

  Future<Null> _selectStartTime(BuildContext context, confirmStartTime) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedStartTime) {
      confirmStartTime(picked.toString().substring(10, 15));
    }
  }

  Future<Null> _selectEndTime(BuildContext context, confirmEndTime) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedEndTime) {
      confirmEndTime(picked.toString().substring(10, 15));
    }
  }
}
