import 'package:app_api_gsheets/model/user.dart';
import 'package:app_api_gsheets/widget/button_widget.dart';
import 'package:flutter/material.dart';

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({
    Key? key,
    required this.onSavedUser,
  }) : super(key: key);
  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late bool isBeginner;

  @override
  void initState() {
    super.initState();

    initUser();
  }

  void initUser() {
    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    this.isBeginner = true;
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildName(),
            const SizedBox(height: 16),
            buildEmaile(),
            const SizedBox(height: 16),
            buildEFlutterBeginner(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      );

  Widget buildName() => TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Name' : null,
      );
  Widget buildEmaile() => TextFormField(
        controller: controllerEmail,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && !value.contains('@') ? 'Enter Email' : null,
      );

  Widget buildEFlutterBeginner() => SwitchListTile(
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        value: isBeginner,
        title: Text('Is Flutter Beginner?'),
        onChanged: (value) => setState(() => isBeginner = value),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();

          if (isValid) {
            final user = User(
              name: controllerName.text,
              email: controllerEmail.text,
              isBeginner: isBeginner,
            );
            widget.onSavedUser(user);
          }
        },
      );
}
