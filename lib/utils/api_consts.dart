class API {
  API._();
  static const DOMAIN = 'https://empresas.ioasys.com.br';
  static const BASE_URL = '$DOMAIN/api/v1';

  static String get authEndpoint => 'auth/sign_in';
  static String get enterpriseEndpoint => 'enterprises';
}
