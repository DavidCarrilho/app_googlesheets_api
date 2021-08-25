import 'package:app_api_gsheets/api/user_sheets_api.dart';
import 'package:app_api_gsheets/page/create_sheets.api.dart';
import 'package:flutter/material.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google Sheets API';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateSheetsPage(),
    );
  }
}
