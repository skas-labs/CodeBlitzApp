import 'package:code_blitz/model/api/response/profile_response.dart';
import 'package:code_blitz/model/api/rest_client.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final dio = Dio();

  Future<ProfileResponse> getProfileData() async {
    final client = RestClient(dio);
    return client.getProfileData();
  }
}