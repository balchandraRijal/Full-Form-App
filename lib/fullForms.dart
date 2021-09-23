import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<FullForms>> fetchFullForms(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://api.jsonbin.io/b/614c34004a82881d6c53f551'));
  var a = response.body;
  return compute(parseFullForms, response.body);
}

List<FullForms> parseFullForms(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, String>>();
  return parsed.map<FullForms>((json) => FullForms.fromJson(json)).tolist();
}

class FullForms {
  final String shortform;
  final String fullform;

  FullForms({required this.fullform, required this.shortform});

  factory FullForms.fromJson(Map<String, dynamic> json) {
    return FullForms(
        shortform: json["shortform"] as String,
        fullform: json["fullform"] as String);
  }
}
