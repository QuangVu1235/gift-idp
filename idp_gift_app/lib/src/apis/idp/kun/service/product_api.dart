import 'package:dio/dio.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'product_api.g.dart';

@RestApi(baseUrl: BaseApi.idpRoot)
@LazySingleton()
abstract class ProductApi{
  @factoryMethod
  factory ProductApi(Dio dio) = _ProductApi;

  @GET("v1/client/exchange-products")
  Future<DataProductResponse> doGetAllProductByCategory(@Query('category_ids') int? categoryId);

}