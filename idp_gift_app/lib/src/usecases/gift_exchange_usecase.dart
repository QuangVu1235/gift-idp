import 'package:idp_gift_app/src/apis/giftexchangepoints/gift_exchange_place_datasource.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GiftExchangeUseCase{

  final GiftExchangeDatasource _giftExchangeDatasource;

  @factoryMethod
  GiftExchangeUseCase(this._giftExchangeDatasource);

  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _giftExchangeDatasource.changeStatusOrder(id, status, canceledReason);

  Future doPutComplete(String orderCode)
  => _giftExchangeDatasource.doPutComplete(orderCode);

  Future addToCartGiftExchange(body)
  => _giftExchangeDatasource.addToCartGiftExchange(body);


  Future confirmOrderByGiftExchange(body)
  => _giftExchangeDatasource.confirmOrderByGiftExchange(body);


  Future<DataOrderResponse> doGetAllOrdersOfCustomer()
  => _giftExchangeDatasource.doGetAllOrdersOfCustomer();


  Future doPostCreateCard(body)
  => _giftExchangeDatasource.doPostCreateCard(body);

}