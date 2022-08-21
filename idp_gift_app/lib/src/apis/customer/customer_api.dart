import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/confirmorder/confirm_order.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
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

  @DELETE('/v1/client/remove-cart-exchange-detail/{sessionId}')
  Future<dynamic> deleteAllCart(@Path('sessionId') String sessionId);

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
  Future<DataGitExchangePoints> getAllGiftExchangePoints(@Queries() Map<String, dynamic> map);

  @GET('/v1/client/get-product-by-gift-exchange-points/{code}')
  Future<List<ProductResponse>> getProductByExchangePoint(@Query('product_name') String productName,@Path('code') String code);

  // getAll product in diem doi qua`
  @GET('v1/client/get-product-by-gift-exchange-points/{code}')
  Future<List<ProductResponse>> getAllProductExchangePoints(@Path('code') String code);

  // Managerment Address
  @POST('v1/shipping_address')
  Future<DataUserAddress> doPostAddressUser(@Body() UserAddressResponse userAddressResponse);

  @PUT('v1/shipping_address/{id}')
  Future<DataUserAddress> doPutAddressUser(@Path('id') String id,@Body() userAddressResponse);

  @PUT('v1/shipping_address/set_default/{id}')
  Future<DataUserAddress> doPutAddressUserDefault(@Path('id') String id);

  @DELETE('v1/shipping_address/{id}')
  Future<dynamic> doDeleteAddressUser(@Path('id') String id);

  @GET('v1/shipping_address')
  Future<DataUserAddress> doGetAllAddressUser();

  @GET('v1/shipping_address/{id}')
  Future<DataUserAddress> doGetAllAddressUserDetail(@Path('id') String id);

  //Danh sach đơn hàng
  @PUT('v1/confirm-order-exchange')
  Future<StatusOrderResp> confirmOrderExchange(@Body() dynamic body);

  @GET('v1/list-orders-exchange')
  Future<DataOrderResponse> getAllOrdersByUser();

}
