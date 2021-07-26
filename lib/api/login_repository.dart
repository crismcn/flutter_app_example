import 'package:app_example/services/httpclient.service.dart';
import 'package:app_example/utils/api_consts.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  const LoginRepository(this.client);
  final HTTPClientService client;
  final String _userKey = 'email';
  final String _passwordKey = 'password';
  final String _codeKey = 'code';
  final String _dataKey = 'data';

  Future<Map<String, dynamic>> signin({
    required String user,
    required String password,
  }) async {
    try {
      final response = await client.post(API.authEndpoint, data: {
        _userKey: user,
        _passwordKey: password,
      });

      client.setToken(
        response.headers.map['access-token']!.first,
        response.headers.map['client']!.first,
        response.headers.map['uid']!.first,
      );

      return {
        _codeKey: response.statusCode,
        // _dataKey: response.data['investor'],
      };
    } on DioError catch (e) {
      return {
        _codeKey: e.response?.statusCode,
        // _dataKey: {},
      };
    } catch (_) {
      return {
        _codeKey: 0,
        // _dataKey: {},
      };
    }
  }
}
