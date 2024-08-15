import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  @JsonKey(name: 'data')
  final dynamic errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Returns a String containing all the error messages
  String errorMsg() {
    if (errors == null || errors is List && (errors as List).isEmpty) return message ?? "Unknown error occurred";

    if (errors is Map && (errors as Map<String, dynamic>).isEmpty) {
      return message ?? "Unknown error occurred";
    } else {
      return errors!.entries.map((error) {
      return error.value.join(', ');
    }).join('\n');
    }
  }
}

