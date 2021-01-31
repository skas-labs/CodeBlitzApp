import 'package:code_blitz/model/api/response/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://localhost:3131")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/")
  Future<ProfileResponse> getProfileData();

  @POST("/auth/otp")
  Future<String> sendOtp(@Body() String phoneno);

  @POST("/auth/otp/verify")
  Future<String> verifyOtp(@Body() Map res);
}