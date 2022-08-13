import 'package:dio/dio.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'customer_api.g.dart';

@RestApi(baseUrl: BaseApi.idpRoot)
@LazySingleton()
abstract class CustomerAPI {
  @factoryMethod
  factory CustomerAPI(Dio dio) = _CustomerAPI;

  //add to cart
  @POST('v1/client/add-to-cart-exchange-customer')
  Future<void> addToCartCustomer(@Body() dynamic body);

  //get cart by user
  @GET('v1/cart-exchange')
  Future<CartDataReponse> getCartExchangeByUser();

  @GET('v1/client/exchange-products')
  Future<ProductResponse> getProductByCode(@Query('code') String code);




}
