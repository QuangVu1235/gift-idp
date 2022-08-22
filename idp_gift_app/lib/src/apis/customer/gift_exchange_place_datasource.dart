import 'package:injectable/injectable.dart';

import 'gift_exchange_place.dart';

abstract class GiftExchangePlaceDatasource{
  Future<dynamic> changeStatusOrder(
      String id, String status, String canceledReason);
  // hoàn thành đơn hàng
  Future<dynamic> doPutComplete(String orderCode);

}
@LazySingleton(as: GiftExchangePlaceDatasource)
class GiftExchangePlaceDatasourceImpl extends GiftExchangePlaceDatasource{
  final GiftExchangePlaceAPI _exchangePlaceAPI;
  GiftExchangePlaceDatasourceImpl(this._exchangePlaceAPI);

  @override
  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _exchangePlaceAPI.changeStatusOrder(
          id, ({"status": status, "canceled_reason": canceledReason}));

  @override
  Future doPutComplete(String orderCode)
  => _exchangePlaceAPI.doPutComplete(orderCode);

}