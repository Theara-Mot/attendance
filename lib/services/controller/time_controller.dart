import 'dart:convert';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/time_model.dart'; // Adjust this import to match your Time model file

class TimeController {
  static String apiUrl = '${GlobalVariable.APP_URL}';
  static String token = GlobalVariable.APP_TOKEN;
  final String endpoint;

  TimeController(this.endpoint);

  Future<List<Time>> fetchTimes() async {
    final response = await http.get(
      Uri.parse('$apiUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((time) => Time.fromJson(time)).toList();
    } else {
      throw Exception('Failed to load times');
    }
  }

  Future<Time> createTime(String name, String status, BuildContext context) async {
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
      BuildSnackbar.showSnackbar(context, msg);
      return Time.fromJson(responseData);
    } else {
      String errorMessage = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to create time: $errorMessage');
    }
  }

  Future<Time> updateTime(int id, String name, String status, BuildContext context) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{'name': name, 'status': status}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data'];
      final msg = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, msg);
      return Time.fromJson(responseData);
    } else {
      String errorMessage = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to update time: $errorMessage');
    }
  }

  Future<void> deleteTime(int id, BuildContext context) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 202) {
      final msg = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, msg);
    } else {
      String errorMessage = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to delete time: $errorMessage');
    }
  }
}
