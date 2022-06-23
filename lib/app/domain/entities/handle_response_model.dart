import 'package:json_annotation/json_annotation.dart';
part 'handle_response_model.g.dart';

@JsonSerializable()
class HandleResponseModel {
  String? message;
  String? code;
  Map? body;

  HandleResponseModel({this.message, this.code, this.body});

  factory HandleResponseModel.fromJson(Map<String, dynamic> json) => _$HandleResponseModelFromJson(json);

  /// Connect the generated [_$HandleResponseModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HandleResponseModelToJson(this);
}
