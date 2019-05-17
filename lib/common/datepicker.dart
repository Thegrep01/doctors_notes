import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// class _ViewModel {
//   final Function confirmSelectedDate;
//   final Function confirmStartTime;
//   final Function confirmEndTime;
//   final bool isView;
//   final bool isEdit;
//   String selectedDateFromStore;
//   String selectedStartTimeFromStore;
//   String selectedEndTimeFromStore;
//   _ViewModel(
//       {this.selectedEndTimeFromStore,
//       this.confirmSelectedDate,
//       this.isView,
//       this.isEdit,
//       this.selectedDateFromStore,
//       this.confirmStartTime,
//       this.selectedStartTimeFromStore,
//       this.confirmEndTime});
// }

class DatePickers extends StatelessWidget {
  final selectedNoteData;
  final DateTime selectedDate = DateTime.now();
  final TimeOfDay selectedStartTime = TimeOfDay.now();
  final TimeOfDay selectedEndTime = TimeOfDay.now();
  DatePickers({this.selectedNoteData});
  @override
  Widget build(BuildContext context) {
    return
        //  StoreConnector<AppState, _ViewModel>(
        //   converter: (store) => _ViewModel(
        //       selectedStartTimeFromStore: store.state.dates[1],
        //       selectedEndTimeFromStore: store.state.dates[2],
        //       selectedDateFromStore: store.state.dates[0],
        //       confirmSelectedDate: (String data) =>
        //           store.dispatch(ConfirmDates(payload: data)),
        //       isView: store.state.isView,
        //       isEdit: store.state.isEdit,
        //       confirmEndTime: (String data) =>
        //           store.dispatch(ConfirmEndTime(payload: data)),
        //       confirmStartTime: (String data) =>
        //           store.dispatch(ConfirmStartTime(payload: data))),
        //   builder: (BuildContext context, _ViewModel state) {
        //     return
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // state.isView
        //     ?
        // Column(
        //     children: <Widget>[
        //       Text('Date of service', style: TextStyle(fontSize: 16.0)),
        //       Text('${selectedNoteData.first.serviceDate.toString()}'),
        //     ],
        //   )
        // :
        Column(
          children: <Widget>[
            Text('Date of service', style: TextStyle(fontSize: 16.0)),
            Theme(
              data: ThemeData(
                accentColor: Colors.yellow,
              ),
              child: IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_today),
              ),
            ),
            // state.selectedDateFromStore != null
            //     ? Text(state.selectedDateFromStore ??
            //         selectedDate.toString().substring(0, 10))
            //     :
            Text(selectedNoteData != null
                ? selectedNoteData.first.serviceDate
                : DateTime.now().toString().substring(0, 10)),
          ],
        ),
        // state.isView
        //     ? Column(
        //         children: <Widget>[
        //           Text('Start time', style: TextStyle(fontSize: 16.0)),
        //           Text('${selectedNoteData.first.startTime.toString()}')
        //         ],
        //       )
        //     :
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Column(
            children: <Widget>[
              Text('Start time', style: TextStyle(fontSize: 16.0)),
              IconButton(
                onPressed: () => _selectStartTime(context),
                icon: Icon(Icons.timer),
              ),
              Text(
                  // selectedNoteData != null &&
                  //       state.selectedStartTimeFromStore == null
                  //   ? selectedNoteData.first.startTime
                  //   : state.selectedStartTimeFromStore != null
                  //       ? state.selectedStartTimeFromStore ??
                  //           selectedDate.toString().substring(10, 15)
                  //       :
                  TimeOfDay.now().toString().substring(10, 15)),
            ],
          ),
        ),
        // state.isView
        //     ? Column(
        //         children: <Widget>[
        //           Text('End time', style: TextStyle(fontSize: 16.0)),
        //           Text('${selectedNoteData.first.endTime}'),
        //         ],
        //       )
        //     :
        Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Column(
              children: <Widget>[
                Text('End time', style: TextStyle(fontSize: 16.0)),
                IconButton(
                  onPressed: () => _selectEndTime(context),
                  icon: Icon(Icons.timer),
                ),
                Text(
                    // selectedNoteData != null &&
                    //       state.selectedEndTimeFromStore == null
                    //   ? selectedNoteData.first.endTime
                    //   : state.selectedEndTimeFromStore != null
                    //       ? state.selectedEndTimeFromStore ??
                    //           selectedDate.toString().substring(10, 15)
                    //       :
                    TimeOfDay.now().toString().substring(10, 15)),
              ],
            ))
      ],
    );
    // },
    // );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null) {
      // confirmSelectedDate(picked.toString().substring(0, 10));
    }
  }

  Future<Null> _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime:
            // isEdit
            // ? selectedNoteData.first.startTime.toString()
            // :
            TimeOfDay.now());
    if (picked != null && picked != selectedStartTime) {
      // confirmStartTime(picked.toString().substring(10, 15));
    }
  }

  Future<Null> _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime:
            // isEdit
            // ? selectedNoteData.first.endTime
            // :
            TimeOfDay.now());
    if (picked != null && picked != selectedEndTime) {
      // confirmEndTime(picked.toString().substring(10, 15));
    }
  }
}
