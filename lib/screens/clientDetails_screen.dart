import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/models/client_model.dart';
import 'package:doctor_notes/store/actions/client_actions.dart';
import 'package:doctor_notes/store/reducers/reducer.dart';
import 'package:doctor_notes/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class _ViewModel {
  final Client client;

  _ViewModel({this.client});
}

class ClientDetails extends StatefulWidget {
  final int id;

  ClientDetails(this.id);

  @override
  _ClientDetailsState createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  @override
  void initState() {
    store.dispatch(GetClientPending(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(
            client: store.state.client,
          ),
      builder: (context, state) {
        return Center(
          child: Scaffold(
            appBar: header(),
            body: store.state.client == null
                ? CircularProgressIndicator()
                : ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(50.0),
                    children: <Widget>[
                      Text('Name: ${state.client.firstName}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text('Surname: ${state.client.lastName}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text('Height: ${state.client.height.toString()}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text('Weigth: ${state.client.weigth ?? '0'}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text(
                          'Last arterial pressure: ${state.client.pressure ?? '0'}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text(
                          'Last temperature: ${state.client.temperature.toString()}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Text(
                          'Last diagnos: ${state.client.problems != null ? state.client.problems.last.name : 'No diagnos'}',
                          textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 25,
                        child: FlatButton(
                            child: Text('History',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              _dialog(context, state.client.problems);
                            },
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
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
