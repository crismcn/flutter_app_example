import 'package:app_example/models/enterprise.dart';
import 'package:app_example/services/httpclient.service.dart';
import 'package:app_example/utils/api_consts.dart';
import 'package:dio/dio.dart';

class EnterpriseRepository {
  const EnterpriseRepository(this.client);
  final HTTPClientService client;
  final String _codeKey = 'code';
  final String _dataKey = 'data';

  Future<Map<String, dynamic>> fetchEnterprise(int id) async {
    try {
      final response = await client.get('${API.enterpriseEndpoint}/$id');

      return (response.data['enterprise'] != null)
          ? {
              _codeKey: response.statusCode,
              _dataKey: Enterprise.fromJson(response.data['enterprise']),
            }
          : {_codeKey: response.statusCode, _dataKey: Enterprise.empty};
    } on DioError catch (e) {
      return {_codeKey: e.response?.statusCode, _dataKey: Enterprise.empty};
    } catch (_) {
      return {_codeKey: 0, _dataKey: Enterprise.empty};
    }
  }

  Future<Map<String, dynamic>> fetchAll({String? filter}) async {
    try {
      final response = await client.get(
        '${API.enterpriseEndpoint}'
        '${(filter != null) ? '?name=$filter' : ''}',
      );
      final data = <Enterprise>[];

      if (response.data['enterprises'] != null)
        response.data['enterprises']
            .forEach((json) => data.add(Enterprise.fromJson(json)));

      return {_codeKey: response.statusCode, _dataKey: data};
    } on DioError catch (e) {
      return {_codeKey: e.response?.statusCode, _dataKey: []};
    } catch (_) {
      return {_codeKey: 0, _dataKey: []};
    }
  }
}
