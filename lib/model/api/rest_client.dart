import 'package:code_blitz/model/api/response/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.stage.codeblitz.app")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/auth/otp")
  Future<HttpResponse> sendOtp(@Body() String phoneno);

  @POST("/auth/otp/verify")
  Future<HttpResponse> verifyOtp(@Body() String body);

  @GET("/players/me")
  Future<ProfileResponse> getProfileData();

  @GET("/players/{id}/follow")
  Future<List<ProfileResponse>> followPlayer(@Path("id") String id);

  @DELETE("/players/{id}/follow")
  Future<List<ProfileResponse>> unfollowPlayer(@Path("id") String id);

  @GET("/players")
  Future<List<ProfileResponse>> getPlayers({@Query("username") String username});

  @GET("/api/players/{id}")
  Future<ProfileResponse> getPlayerById(@Path("id") String id);

  @GET("/players/{id}/followers")
  Future<List<ProfileResponse>> getFollowersById(@Path("id") String id);

  @GET("/players/{id}/following")
  Future<List<ProfileResponse>> getFollowingById(@Path("id") String id);

  @POST("/matches")
  Future<HttpResponse> createMatch();
}
