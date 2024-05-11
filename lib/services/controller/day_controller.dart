import 'dart:convert';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/day_model.dart';


class DayController{
  static String apiUrl = '${GlobalVariable.APP_URL}';
  static  String token = "1|TqkBbVuZ2SJQHE8UCnTqz1AEVelJUn35FE12KXFs6534768f";
  final String endpoint;
  DayController(this.endpoint);
  Future<List<Day>> fetchDays() async {
    final response = await http.get(
      Uri.parse('$apiUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
        'Accept-Charset':'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body)['data'];
      print(response.body);
      return jsonResponse.map((day) => Day.fromJson(day)).toList();
    } else {
      throw Exception('Failed to load days');
    }
  }

  Future<Day> createDay(String name, String status, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$apiUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{'name': name, 'status': status}),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body)['data'];
      final msg = jsonDecode(response.body)['message'];
      final createdDay = Day.fromJson(responseData);
      BuildSnackbar.showSnackbar(context, msg).then((value){
      });
      return createdDay;
    } else {
      String errorMessage = jsonDecode(response.body);
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to create day: $errorMessage');
    }
  }

  Future<Day> updateDay(int id, String name, String status,BuildContext context) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{'name': name, 'status': status}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data'];
      final msg = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, msg);
      return Day.fromJson(responseData);
    } else {
      String errorMessage = jsonDecode(response.body);
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to update day. Status code: ${response.statusCode}');
    }
  }


  Future<void> deleteDay(int id,BuildContext context) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset':'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 202) {
      final msg = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context,msg);
    }else{
      String errorMessage = jsonDecode(response.body);
      BuildSnackbar.showSnackbar(context, response.statusCode.toString());
      throw Exception('Failed to delete day $errorMessage');
    }
  }
}