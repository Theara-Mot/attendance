import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../const/app_variable.dart';
import '../model/classDivision_model.dart';

class ClassDivisionController {
  static String apiUrl = '${GlobalVariable.APP_URL}';
  static  String token = GlobalVariable.APP_TOKEN;
  final String endpoint;

  ClassDivisionController(this.endpoint);

  Future<List<ClassDivision>> fetchClassDivisions(int classID) async {
    final response = await http.get(
      Uri.parse('$apiUrl/class-divisions-one/$classID'),
      headers: <String, String>{
        'Content-Type': 'application/json;',
        'Accept-Charset':'UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ClassDivision.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load class divisions');
    }
  }

  Future<ClassDivision> fetchClassDivision(int id) async {
    final response = await http.get(Uri.parse('$apiUrl/class_divisions/$id'));

    if (response.statusCode == 200) {
      return ClassDivision.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load class division');
    }
  }

  Future<ClassDivision> createClassDivision(ClassDivision classDivision) async {
    final response = await http.post(
      Uri.parse('$apiUrl/class_divisions'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(classDivision.toJson()),
    );

    if (response.statusCode == 201) {
      return ClassDivision.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create class division');
    }
  }

  Future<ClassDivision> updateClassDivision(int id, ClassDivision classDivision) async {
    final response = await http.put(
      Uri.parse('$apiUrl/class_divisions/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(classDivision.toJson()),
    );

    if (response.statusCode == 200) {
      return ClassDivision.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update class division');
    }
  }

  Future<void> deleteClassDivision(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/class_divisions/$id'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete class division');
    }
  }
}
