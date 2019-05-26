import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'FOrm Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: CustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class CustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class CustomFormState extends State<CustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Enter Your Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text!!';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                    child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, we want to show a Snackbar
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Processing Data...'),
                      ));
                    }
                  },
                  child: Text('LOGIN!'),
                )),
              ),
            ],
          ),
        ));
  }
}
