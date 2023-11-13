import '../api/api.dart';

class AuthenticationService {
  static final AuthenticationService _authService = AuthenticationService._();

  factory AuthenticationService() => _authService;

  AuthenticationService._();

  Future<dynamic> login(String email, String type, String password) async {
    Map<String, String> formData = {
      "password": password,
      "userName": email,
      "type": type
    };
    return await HttpsConfig().postCall(EndPoint.login, formData);
  }
}
