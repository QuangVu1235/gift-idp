import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:injectable/injectable.dart';

import '../giftexchangepoints/gift_exchange_place.dart';

abstract class GiftExchangeDatasource{
  Future<dynamic> changeStatusOrder(
      String id, String status, String canceledReason);
  // hoàn thành đơn hàng
  Future<dynamic> doPutComplete(String orderCode);
  //addToCart
  Future<dynamic> addToCartGiftExchange(dynamic body);

  // Lấy danh sách đơn hàng
  Future<DataOrderResponse> doGetAllOrdersOfCustomer();

  // thêm thẻ đổi quà
  Future<dynamic> doPostCreateCard(dynamic body);

  //confirm order
  Future<dynamic> confirmOrderByGiftExchange(dynamic body);

}
@LazySingleton(as: GiftExchangeDatasource)
class GiftExchangePlaceDatasourceImpl extends GiftExchangeDatasource{
  final GiftExchangePlaceAPI _exchangePlaceAPI;
  GiftExchangePlaceDatasourceImpl(this._exchangePlaceAPI);

  @override
  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _exchangePlaceAPI.changeStatusOrder(
          id, ({"status": status, "canceled_reason": canceledReason}));

  @override
  Future doPutComplete(String orderCode)
  => _exchangePlaceAPI.doPutComplete(orderCode);

  @override
  Future addToCartGiftExchange(body)
  => _exchangePlaceAPI.addToCartGiftExchange(body);

  @override
  Future confirmOrderByGiftExchange(body)
  => _exchangePlaceAPI.confirmOrderByGiftExchange(body);

  @override
  Future<DataOrderResponse> doGetAllOrdersOfCustomer()
  => _exchangePlaceAPI.doGetAllOrdersOfCustomer();

  @override
  Future doPostCreateCard(body)
  => _exchangePlaceAPI.doPostCreateCard(body);

}