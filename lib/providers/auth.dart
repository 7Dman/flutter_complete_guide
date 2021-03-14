import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> singup(String email, String password) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDKHAMTjHgEq4asx9IwTMRb8SQ7oEmgdGU');
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
  }
}
