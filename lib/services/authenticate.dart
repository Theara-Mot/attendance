import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:attendance/const/app_snackbar.dart';
import 'package:attendance/const/app_variable.dart';
import 'package:attendance/provider/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';

class Authenticate{
  // static String url = 'http://127.0.0.1:8000';
  static String url = 'http://192.168.0.101:1234';
  LocalStorage localStorage = LocalStorage();
  Future<void> login(String email, String password,{BuildContext? context}) async {
    final response = await http.post(Uri.parse('$url/api/login'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      Map<String, dynamic> user = responseData['user'];
      final message = responseData['message'];
      localStorage.storeData('token', token);
      GlobalVariable.userType = 'admin';
      GlobalVariable.APP_TOKEN = token;
      BuildSnackbar.showSnackbar(context!,message);
      if(GlobalVariable.userType != null || GlobalVariable.userType != ''){
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute( builder: (BuildContext context) { return MyAppHomePage(); }, ), (_) => false, );
      }
    }else{
      final Map<String, dynamic> errorData = json.decode(response.body);
      final errorMessage = errorData['message'];
      BuildSnackbar.showSnackbar(context!, errorMessage);
    }
  }

  Future<void> register(String name, String email, String password) async {
    final url = 'http://example.com/register'; // Replace with your API endpoint
    final response = await http.post(Uri.parse(url), body: {
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Registration successful
    } else {
      // Handle errors
      throw Exception('Failed to register');
    }
  }
  Future<void> logout(BuildContext context) async {
    String? token = await localStorage.getData('token');
    if (token != null) {
      print('Token: $token');
      final response = await http.get(
        Uri.parse('$url/api/logout'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        await localStorage.storeData('token', '');
        GlobalVariable.userType = '';
        final responseData = json.decode(response.body);
        BuildSnackbar.showSnackbar(context, responseData['message']);
      } else {
        BuildSnackbar.showSnackbar(context, 'Internal Server Error');
      }
    } else {
      BuildSnackbar.showSnackbar(context, 'Please restart the application');
    }

  }

  Future<Map<String, dynamic>> getProfile() async {
    final url = 'http://example.com/profile'; // Replace with your API endpoint
    final token = ''; // Retrieve the token from local storage
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData; // Assuming your API returns the user profile data
    } else {
      // Handle errors
      throw Exception('Failed to get profile');
    }
  }


  Future<void> updateProfile(String name, String email) async {
    final url = 'http://example.com/profile'; // Replace with your API endpoint
    final token = ''; // Retrieve the token from local storage
    final response = await http.put(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'name': name,
      'email': email,
    });

    if (response.statusCode == 200) {
      // Profile updated successfully
    } else {
      // Handle errors
      throw Exception('Failed to update profile');
    }
  }


}