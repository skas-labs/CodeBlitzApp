import 'package:code_blitz/model/api/response/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.codewar.org/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/players/me")
  Future<ProfileResponse> getProfileData();
}