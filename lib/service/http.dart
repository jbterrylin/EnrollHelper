import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx_cb/api/base.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class HttpService {
  static final baseUrl = "https://randomuser.me";
  static final HttpService _instance = HttpService._internal();
  factory HttpService({BuildContext context}) {
    _instance._context = context;
    return _instance;
  }

  BuildContext _context;
  Dio _dio;
  String _token = "";

  HttpService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: "application/json",
    ));
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    _dio.interceptors.add(DioInterceptor());
  }

  Future<DioResponse> request(ApiRequest req) {
    return fetch(
      req.method(),
      req.endpoint(),
      body: req.body(),
      query: req.query(),
    );
  }

  Future<DioResponse> fetch(String method, String path,
      {dynamic body, Map<String, dynamic> query}) async {
    if (query != null && query.length > 0) {
      if (path.contains("?")) {
        path += "&";
      } else {
        path += "?";
      }
      List<String> queries = [];
      query.forEach((key, value) => queries.add("$key=${value.toString()}"));
      path += queries.join("&");
    }

    CancelToken token = CancelToken();
    Timer timer = Timer(Duration(seconds: 30), () {
      token.cancel("timeout");
    });
    DioResponse res = DioResponse();
    try {
      Options options = Options(method: method);
      if (_token != null) {
        options.headers = {
          'Authorization': 'Bearer $_token',
        };
      }
      Response response = await _dio.request(path,
          data: body, options: options, cancelToken: token);
      timer.cancel();
      res.status = response.statusCode;
      res.data = response.data;
    } on DioError catch (error) {
      timer.cancel();
      res.status = error.response.statusCode;
      res.error = error.response.data;
      if (res.status == 401) {
        Navigator.pushReplacementNamed(this._context, "/login");
        return res;
      }
    }
    return res;
  }
}

class DioResponse {
  int status;
  dynamic data;
  dynamic error;

  String get errorMessage => error != null && error is Map
      ? error['errors']
      : "Unhandled errors, missing errors message from backend.";

  bool get isOk => error == null;
  bool get isError => error != null;
}

class DioInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("[HTTP REQUEST]");
    print("Endpoint: " + options.method + " " + options.path);
    if (options.data != null) {
      debugPrint("Body: " + options.data.toString(), wrapWidth: 1024);
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("[HTTP SUCCESS]");
    print("Status: " + response.statusCode.toString());
    print("Endpoint: " + response.request.method + " " + response.request.path);
    debugPrint("Request: " + json.encode(response.request.data),
        wrapWidth: 1024);
    debugPrint("Response: " + json.encode(response.data), wrapWidth: 1024);
    return super.onResponse(response);
  }

  @override
  Future onError(DioError error) {
    print("[HTTP ERROR]");
    print("Status: " + error.response.statusCode.toString());
    print("Endpoint: " + error.request.method + " " + error.request.path);
    debugPrint("Request: " + json.encode(error.request.data), wrapWidth: 1024);
    debugPrint("Response: " + json.encode(error.response.data),
        wrapWidth: 1024);
    return super.onError(error);
  }
}
