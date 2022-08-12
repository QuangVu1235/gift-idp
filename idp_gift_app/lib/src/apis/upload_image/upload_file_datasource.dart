import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/upload_image/apis/upload_media.dart';
import 'package:idp_gift_app/src/apis/upload_image/responses/upload_file_responses.dart';

abstract class UploadFileDatasource {

  Future<UploadFileResponses> upload(File file);

  Future<dynamic> downloadFile(String path);

}

@LazySingleton(as: UploadFileDatasource)
class UploadFileDatasourceImpl extends UploadFileDatasource {

  final UploadMedia _uploadMedia;

  UploadFileDatasourceImpl(this._uploadMedia);

  @override
  Future<UploadFileResponses> upload(File file) => _uploadMedia.upload(file);

  @override
  Future<dynamic> downloadFile(String path) => _uploadMedia.downloadFile(path);

}