import 'package:dio/dio.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
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
  Future<DataProductResponse> getProductByCode(@Query('code') String code);

  //delete cart
  @DELETE('/v1/client/remove-product-in-cart-exchange/{id}')
  Future<dynamic> deleteCart(@Path('id') String id);

  //getAllOrder
  // @GET('/v1/client/remove-product-in-cart-exchange/{id}')
  // Future<dynamic> deleteCart(@Path('id') String id);


  //update cart (số lượng, cart_code)
  @PUT('v1/update-product-in-cart-exchange-customer/{id}')
  Future<void> updateCart(@Path('id') String id,@Body() dynamic body);

  //duyệt đơn hàng
  @PUT('v1/orders-exchange/{id}/status')
  Future<dynamic> changeStatusOrder(@Path('id') String id, @Body() Map<String, dynamic> body);

  //danh sach diem doi qua
  @GET('v1/client/get-gift-exchange-points')
  Future<DataGitExchangePoints> getAllGiftExchangePoints();

  // getAll product in diem doi qua`
  @GET('v1/client/get-product-by-gift-exchange-points')
  Future<List<ProductResponse>> getAllProductExchangePoints(@Body() Map<String, dynamic> body);









}
