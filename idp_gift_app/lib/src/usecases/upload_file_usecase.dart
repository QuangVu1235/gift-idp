import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/apis/upload_image/upload_file_datasource.dart';
import 'package:idp_gift_app/src/apis/upload_image/responses/upload_file_responses.dart';

@LazySingleton()
class UploadFileUsecase {
  final UploadFileDatasource _uploadFileDatasource;
  UploadFileUsecase(this._uploadFileDatasource);

  Future<UploadFileResponses> upload(File file) => _uploadFileDatasource.upload(file);

  Future<dynamic> downloadFile(String path) => _uploadFileDatasource.downloadFile(path);

}