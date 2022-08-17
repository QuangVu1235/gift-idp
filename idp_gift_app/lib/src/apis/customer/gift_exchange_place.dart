import 'package:dio/dio.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'gift_exchange_place.g.dart';

@RestApi(baseUrl: BaseApi.idpRoot)
@LazySingleton()
abstract class GiftExchangePlaceAPI {
  @factoryMethod
  factory GiftExchangePlaceAPI(Dio dio) = _GiftExchangePlaceAPI;

  //duyệt đơn hàng, cập nhập đơn quà
  @PUT('v1/orders-exchange/{id}/status')
  Future<dynamic> changeStatusOrder(@Path('id') String id, @Body() Map<String, dynamic> body);

  // hoàn thành đơn hàng
  @PUT('v1/complete-order-exchange')
  Future<dynamic> doPutComplete(@Query('order_code') String orderCode);










}
