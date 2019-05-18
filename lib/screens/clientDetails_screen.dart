import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final String firstName;
  final String lastName;
  final List<dynamic> diagnos;
  final int height;
  final int weigth;
  final String pressure;
  final String temperature;

  _ViewModel(
      {this.firstName,
      this.lastName,
      this.diagnos,
      this.height,
      this.weigth,
      this.pressure,
      this.temperature});
}

class ClientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(
          firstName: store.state.client.firstName,
          lastName: store.state.client.lastName,
          diagnos: store.state.client.problems,
          height: store.state.client.height,
          weigth: store.state.client.weigth,
          pressure: store.state.client.pressure,
          temperature: store.state.client.temperature),
      builder: (context, state) {
        return Scaffold(
          appBar: header(),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(50.0),
            children: <Widget>[
              Text('Name: ${state.firstName}', textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text('Surname: ${state.lastName}', textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text('Height: ${state.height.toString()}',
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text('Weigth: ${state.weigth ?? '0'}',
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text('Last arterial pressure: ${state.pressure ?? '0'}',
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text('Last temperature: ${state.temperature.toString()}',
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text(
                  'Last diagnos: ${state.diagnos != null ? state.diagnos.last : 'No diagnos'}',
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              SizedBox(
                width: 25,
                child: FlatButton(
                    child:
                        Text('History', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      _dialog(context, state.diagnos);
                    },
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        );
      },
    );
  }

  void _dialog(BuildContext context, List<dynamic> diagnosis) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                height: 500,
                width: 100,
                child: Column(
                  children: <Widget>[
                    Text('List of diagnoses'),
                    Flexible(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(diagnosis[index].name),
                            subtitle: Text('${diagnosis[index].date}'),
                          );
                        },
                        itemCount: diagnosis.length,
                      ),
                    ),
                  ],
                )),
            elevation: 0.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          );
        });
  }
}
