import 'dart:convert';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/student_model.dart';

class StudentController {
  static String apiUrl = '${GlobalVariable.APP_URL}';
  static String token = "4|w7HjWit832DAHxt66LrsYIesGrpmjeew9IfhzL5144c5ebf7";
  final String endpoint;
  StudentController(this.endpoint);


  Future<List<Student>> fetchStudents() async {
    final response = await http.get(
      Uri.parse('$apiUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body)['data'];
      print(response.body);
      return jsonResponse.map((student) => Student.fromJson(student)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<Student> createStudent(Map<String, String> studentData, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$apiUrl/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(studentData),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body)['data'];
      final msg = jsonDecode(response.body)['message'];
      final createdStudent = Student.fromJson(responseData);
      BuildSnackbar.showSnackbar(context, msg).then((value) {});
      return createdStudent;
    } else {
      String errorMessage = jsonDecode(response.body);
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to create student: $errorMessage');
    }
  }

  Future<Student> updateStudent(int id, Map<String, String> studentData, BuildContext context) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(studentData),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['data'];
      final msg = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, msg);
      return Student.fromJson(responseData);
    } else {
      String errorMessage = jsonDecode(response.body);
      BuildSnackbar.showSnackbar(context, errorMessage);
      throw Exception('Failed to update student. Status code: ${response.statusCode}');
    }
  }

  Future<void> deleteStudent(int id, BuildContext context) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$endpoint/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept-Charset': 'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 202) {
      final msg = jsonDecode(response.body)['message'];
      BuildSnackbar.showSnackbar(context, msg);
    } else {
      String errorMessage = jsonDecode(response.body);
      BuildSnackbar.showSnackbar(context, response.statusCode.toString());
      throw Exception('Failed to delete student $errorMessage');
    }
  }
}
