import 'package:app_api_gsheets/api/user_sheets_api.dart';
import 'package:app_api_gsheets/main.dart';
import 'package:app_api_gsheets/model/user.dart';
import 'package:app_api_gsheets/widget/user_form_widget.dart';
import 'package:flutter/material.dart';

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: UserFormWidget(
              onSavedUser: (user) async {
                final id = await UserSheetsApi.getRowCount() + 1;
                final newUser = user.copyWith(id: id);
                await UserSheetsApi.insert([newUser.toJson()]);
              },
            ),
          ),
        ),
      );

  // Future insertUser() async {
  //   final users = [
  //     User(id: 1, name: 'Luan', email: 'luan@email.com', isBeginner: true),
  //     User(id: 2, name: 'David', email: 'david@email.com', isBeginner: true),
  //     User(id: 3, name: 'Laura', email: 'laura@email.com', isBeginner: true),
  //     User(id: 4, name: 'Jane', email: 'jane@email.com', isBeginner: true),
  //     User(id: 5, name: 'Jean', email: 'jean@email.com', isBeginner: true),
  //   ];
  //   final jsonUsers = users.map((user) => user.toJson()).toList();

  //   await UserSheetsApi.insert(jsonUsers);
  // }
}
