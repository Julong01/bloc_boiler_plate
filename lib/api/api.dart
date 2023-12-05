import 'package:dio/dio.dart';
import 'package:flutter_bloc_boiler_plate/model/image_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://picsum.photos/v2/")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET("/list")
  Future<List<ImageData>?> getImages(
      @Query("page") int pageNo, @Query("limit") int limit);
}
