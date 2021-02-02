import 'package:code_blitz/model/api/response/api_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.stage.codeblitz.app")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/auth/otp")
  Future<String> sendOtp(@Body() String phoneno);

  @POST("/auth/otp/verify")
  Future<String> verifyOtp(@Body() String body);

  @GET("/api/players/me")
  Future<ProfileResponse> getProfileData();

  @GET("/api/players/{id}/follow")
  Future<List<ProfileResponse>> followPlayer(@Path("id") String id);

  @DELETE("/api/players/{id}/follow")
  Future<List<ProfileResponse>> unfollowPlayer(@Path("id") String id);

  @GET("/api/players")
  Future<List<ProfileResponse>> getPlayers({@Query("username") String username});

  @GET("/api/players/{id}")
  Future<ProfileResponse> getPlayerById(@Path("id") String id);

  @GET("/api/players/{id}/followers")
  Future<List<ProfileResponse>> getFollowersById(@Path("id") String id);

  @GET("/api/players/{id}/following")
  Future<List<ProfileResponse>> getFollowingById(@Path("id") String id);
}
