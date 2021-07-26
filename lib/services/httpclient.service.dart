import 'package:dio/dio.dart';

class HTTPClientService implements IHTTPClient {
  final Dio client = Dio();
  final String? baseUrl;
  HTTPClientService({this.baseUrl = ''}) {
    if (baseUrl!.isNotEmpty) client.options.baseUrl = baseUrl!;
  }

  @override
  void setToken(token, client, uid) {
    this.client.options.headers['Access-Token'] = '$token';
    this.client.options.headers['Client'] = '$client';
    this.client.options.headers['UID'] = '$uid';
  }

  @override
  get(url) async => await client.get(url);

  @override
  post(url, {Map<String, dynamic>? data}) async =>
      await client.post(url, data: data);

  @override
  put(url, {Map<String, dynamic>? data}) async =>
      await client.put(url, data: data);
}

abstract class IHTTPClient {
  void setToken(String token, String client, String uid);
  Future<Response> get(String url);
  Future<Response> post(String url);
  Future<Response> put(String url);
}
