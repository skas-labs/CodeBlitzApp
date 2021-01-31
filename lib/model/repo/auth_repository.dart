import 'package:code_blitz/model/api/dio_provider.dart';
import 'package:code_blitz/model/api/rest_client.dart';
import 'package:retrofit/dio.dart';

class AuthRepository {
  RestClient client;

  AuthRepository() {
    final dio = DioProvider.instance();
    client = RestClient(dio);
  }

  Future<String> sendOtp(String phoneno) async {
    return client.sendOtp("{\"phno\": \"+91${phoneno}\" }");
  }
}
