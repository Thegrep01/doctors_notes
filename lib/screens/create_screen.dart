import 'package:doctor_notes/common/datepicker.dart';
import 'package:doctor_notes/common/header.dart';
import 'package:doctor_notes/common/mockdata.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateSreenState createState() => _CreateSreenState();
}

class _CreateSreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  String _codeSelection;
  final dropdownActivityGoals = MockData.codeItems
      .map((String item) =>
          DropdownMenuItem<String>(value: item, child: Text(item)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(title: 'Create Note'),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(children: <Widget>[
                DatePickers(),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Activity code', style: TextStyle(fontSize: 18.0)),
                      DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              value: _codeSelection,
                              items: dropdownActivityGoals,
                              onChanged: (s) {
                                setState(() {
                                  _codeSelection = s;
                                });
                              })),
                      Row(
                        children: <Widget>[
                          Text('Go to Service location:',
                              style: TextStyle(fontSize: 17.0)),
                          GestureDetector(
                            onTap: () async {
                              dynamic url =
                                  'https://www.google.com/maps/search/?api=1&query=37.785834,-122.406417';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: IconButton(
                              icon: Icon(Icons.map,
                                  size: 40.0,
                                  color: Color.fromRGBO(20, 137, 124, 1)),
                              onPressed: () async {
                                dynamic url =
                                    'https://www.google.com/maps/search/?api=1&query=37.785834,-122.406417';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: 25),
                      Center(
                          child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        color: Color.fromRGBO(20, 137, 124, 1),
                        child: Text('Submit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ))
                    ],
                  ),
                ),
              ]),
            )));
  }
}
