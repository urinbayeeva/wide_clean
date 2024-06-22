import 'dart:convert';

class ResponseModel {
  final int id;
  final String error;
  final String result;

  ResponseModel({required this.id, required this.error, required this.result});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      id: json['id'] as int,
      error: json['error'] as String,
      result: json['result'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'error': error,
      'result': result,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static ResponseModel fromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return ResponseModel.fromJson(jsonMap);
  }
}