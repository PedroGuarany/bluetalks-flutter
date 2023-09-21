import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Bluetalks Group Code

class BluetalksGroup {
  static String baseUrl = 'http://guarany.ddns.net:3723';
  static Map<String, String> headers = {
    'Content-type': 'application/json',
    'Authorization': 'Bearer [auth_token]',
  };
  static TestCall testCall = TestCall();
  static RegisterCall registerCall = RegisterCall();
  static LoginCall loginCall = LoginCall();
}

class TestCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: '${BluetalksGroup.baseUrl}/check',
      callType: ApiCallType.GET,
      headers: {
        ...BluetalksGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? authToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "nome": "${name}",
  "email":"${email}" ,
  "senha": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '${BluetalksGroup.baseUrl}/usuario',
      callType: ApiCallType.POST,
      headers: {
        ...BluetalksGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? authToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "senha": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${BluetalksGroup.baseUrl}/usuario/login',
      callType: ApiCallType.POST,
      headers: {
        ...BluetalksGroup.headers,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic jwt(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

/// End Bluetalks Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
