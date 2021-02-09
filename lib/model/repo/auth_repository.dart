import 'package:code_blitz/model/api/dio_provider.dart';
import 'package:code_blitz/model/api/rest_client.dart';
import 'package:retrofit/dio.dart';

class AuthRepository {
  RestClient client;

  AuthRepository() {
    final dio = DioProvider.instance();
    client = RestClient(dio);
  }

  Future<HttpResponse> sendOtp(String phoneno) async {
    return client.sendOtp("{\"phno\": \"${phoneno}\" }");
  }

  Future<HttpResponse> verifyOtp(String body) async {
    return client.verifyOtp(body);
  }
}
