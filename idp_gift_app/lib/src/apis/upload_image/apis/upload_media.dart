import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/upload_image/responses/upload_file_responses.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:idp_gift_app/src/core/dio_cache/core/dio_cache_ano.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'upload_media.g.dart';

@RestApi(baseUrl: BaseApi.mediaRoot)
@LazySingleton()
abstract class UploadMedia {
  @factoryMethod
  factory UploadMedia(Dio dio) = _UploadMedia;

  @POST('/upload')
  @MultiPart()
  Future<UploadFileResponses> upload(@Part(name: 'file', ) File file);

  @Extra({
    DioCacheAno.age: Duration(days: 1),
    DioCacheAno.expired: Duration(days: 2),
  })
  @GET('{path}')
  Future<dynamic> downloadFile(@Path('path') String path);

}