import 'dart:developer';

import 'package:code_blitz/model/api/dio_provider.dart';
import 'package:code_blitz/model/api/response/profile_response.dart';
import 'package:code_blitz/model/api/rest_client.dart';

class HomeRepository {
  RestClient client;

  HomeRepository() {
    final dio = DioProvider.instance();
    client = RestClient(dio);
  }

  Future<ProfileResponse> getProfileData() async {
    return client.getProfileData();
  }

  Future<List<ProfileResponse>> getPlayers({String keyword}) async {
    log("keyword for the search $keyword");
    return client.getPlayers(username: keyword);
  }
}
