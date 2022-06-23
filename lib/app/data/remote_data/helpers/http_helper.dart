import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_di/app/data/data_interfaces/remote_interfaces.dart';
import 'package:flutter_bloc_di/app/domain/entities/handle_response_model.dart';

const int REQUEST_TIME_OUT = 11;

class HttpHelper implements RemoteInterfaces {
  /// init http client
  HttpClient _client = HttpClient();
  init() {
    _client.connectionTimeout = Duration(seconds: REQUEST_TIME_OUT);
  }

  Future<HandleResponseModel?> _customPost(String url, Map<String,dynamic> body,
      {Map<String,dynamic>? headers}) async {
    final request = await _client.postUrl(Uri.parse(url));
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });
    }
    request.write(body);
    HttpClientResponse result = await request.close();
    if (result.statusCode != 200) {
      return null;
    }
    String resultJson = await result.transform(utf8.decoder).join();
    HandleResponseModel _model =
        HandleResponseModel.fromJson(jsonDecode(resultJson));
    return _model;
  }

  Future<HandleResponseModel?> _customGet(String url,
      {Map<String,dynamic>? headers, Map<String, dynamic>? params}) async {
    Uri _uri = Uri.parse(url);
    if (params != null) {
      _uri.replace(queryParameters: params);
    }
    final request = await _client.getUrl(_uri);
    if (headers != null) {
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });
    }

    HttpClientResponse result = await request.close();
    if (result.statusCode != 200) {
      return null;
    }
    String resultJson = await result.transform(utf8.decoder).join();
    HandleResponseModel _model =
        HandleResponseModel.fromJson(jsonDecode(resultJson));
    return _model;
  }

  @override
  Future<HandleResponseModel?> postExample(String url, Map<String,dynamic> body,
      {Map<String,dynamic>? header}) {
    return _customPost(url, body, headers: header);
  }

  @override
  Future<HandleResponseModel?> getExample(String url,
      {Map<String,dynamic>? header, Map<String,dynamic>? params}) {
    return _customGet(url,headers: header,params: params);
  }
}
