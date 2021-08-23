import 'package:flutter/cupertino.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _credentials = r''' 
  {
  "type": "service_account",
  "project_id": "gsheets-323812",
  "private_key_id": "475d7773b7271344b457a4adfa0dd7bf4425a9e9",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCS2QmLc1kRNHSS\n6jhUj5t2GxM7G2toLApaj1DHWfSv3N0AB+iKsMl04Ls11i/ZzDCx/w094L94F0S5\nD91i/MLRyB6SdqeSrIIBfv2UGceHN7e5yDVf7f7sUPEGKyVXtTni2LaCnsLYeWkZ\nwid6FqlZHBkqUEmrEf400VFYUz1uuiV3cRDxkZLEMp7k7XFXvrbN2CCzJeNqcsXz\nUtyBrjCA+PlpBXUOUyLGfy9+4QPbQvKuwr08LCT6muVDjGKbOolbsTagoSzp/IEH\nPFCsWvMHIheJ8K3Zcjpbar540fkT6mKuwncmcH+xbwtZXxZO3PCJmyP8DmI2MawD\najMFUqEXAgMBAAECggEAMhBKX7+AgwwWHiw57iJThu1uHf2YHZi+IuevS3eQoxAy\nTBtmHTpuRCmFybHu+FrT0ys4EXt463FLXahZ+rBfnvOR8K8BLFEhtW7c9svfKWtG\neNEX2U+jVF+3/DljbsZ7KKpndpq3pOOngD+gA9CMBbQ9pB5hLzBgMROXnvwp+oB5\nk7e3AfwlSDLJdqN02QNyH6s5glmNB5xUGFiUX9YvCK696X7eykv2hqhWrwluycHK\nB63nAe9UeZcnyC6yXYKdDnOMhI7jhIf3LCLj3sPtJ5ooRbbqf+yeZW40DcaTZMWu\nlRCXkUvImz63cl6mfjOa/mi/OuMlQT9hkVS+yHCyyQKBgQDIlhEd7P/P6KQ3eR36\n401+bwdo/czIKO4jyYsfRDThI0I/DQQ7qksdHuy5Q6gKaeZ+yl/A3Zk8n49xy1j9\n5+kY0pa+syJ6Tx+PPj8VXp0Kb5ujoXki5h5smhvlrWXFIh4OUZV30lMN/w0pt4Sy\n8QJckTDGaszXC0u5P2Sk2F0u4wKBgQC7anaR6sPLQ3/+eZVgv5/f3pxdfsBWE/sh\n9HidiCYg30TU0vMvaL5IPWIp4lrnGMlKxsTrKWrnbbDQ8BPVHw4tHhe96/dkezkF\nrLAZIRT6DCNs0TSjfqnWDMjduMA1gp963WWu1t3X6S5TPA+/lIGMmlbMwePIjba+\nnQn3HWTHPQKBgDrbPb6IMi+xVa4pTdC2LaDxtzzpa9M3n1jE5JuSCeodzGxvx1Qy\njcPHtTJPVdloZYfCngIbg8E0GIUNY9ls2Qq9kBn4uh8lZF9FpoEAuBe90+9ZjA/f\ncgHv3kuwa3JCposRCUiVYGV090nMXZWb/lNnDubJo71dxSRgI4nzKrR9AoGBAIlO\n68XmOUKflpPLYjy6yBgNkYQSTDoEc5ah9Qh9amnlChne35qZY+erSVMkarMrfraR\nQE6GTrN1svixG+al1Q4LIRvdWKg+ez2EEpSmnya/Y+jisW0jbKzNOxDuvau2or8y\nm7/n3irExVLoCyWyWOO5Y+SqHQefhAbNKTLqTx6FAoGAXJeGj9We+d+u7npkcdyt\nWHC1QLpuSF7TkYh12t36pM3cuZL1esfs6kymdPgMpON96Z7nD7unGSgZEeVrgYDP\nVK+d5yVMkcMhuuna2gQJn/z72wmyze9B5ogeixifBi/uGc0btYUcDuk7j3hCFf50\nQc/08t1vuwXY2LEYfEvGJmo=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-323812.iam.gserviceaccount.com",
  "client_id": "111064512231400713296",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-323812.iam.gserviceaccount.com"
  }
  ''';
  static final _spreadsheetId = '1ByrJ6HCWqgAj5W75eEfypocT34Wevco-CfqG_T1X8sE';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
