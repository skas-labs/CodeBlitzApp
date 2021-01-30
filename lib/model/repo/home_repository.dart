import 'package:code_blitz/model/api/dio_provider.dart';
import 'package:code_blitz/model/api/response/profile_response.dart';
import 'package:code_blitz/model/api/rest_client.dart';

class HomeRepository {
  final dio = DioProvider.instance();

  Future<ProfileResponse> getProfileData() async {
    final client = RestClient(dio);
    return client.getProfileData();
  }
}