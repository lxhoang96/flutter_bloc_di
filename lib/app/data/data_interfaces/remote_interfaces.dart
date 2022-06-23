import 'package:flutter_bloc_di/app/domain/entities/handle_response_model.dart';

abstract class RemoteInterfaces {

  /// Example Post Request Interfaces
  Future<HandleResponseModel?> postExample(String url,Map<String,dynamic> body, {Map<String,dynamic>? header});

  /// Example Get Request Interfaces
  Future<HandleResponseModel?> getExample(String url, {Map<String,dynamic>? header, Map<String,dynamic>? params});

}
