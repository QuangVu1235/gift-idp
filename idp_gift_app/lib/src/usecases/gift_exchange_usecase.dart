import 'package:idp_gift_app/src/apis/giftexchangepoints/gift_exchange_place_datasource.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GiftExchangeUseCase {
  final GiftExchangeDatasource _giftExchangeDatasource;

  @factoryMethod
  GiftExchangeUseCase(this._giftExchangeDatasource);

  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _giftExchangeDatasource.changeStatusOrder(id, status, canceledReason);

  Future doPutComplete(String orderCode) =>
      _giftExchangeDatasource.doPutComplete(orderCode);

  Future addToCartGiftExchange(body) =>
      _giftExchangeDatasource.addToCartGiftExchange(body);

  Future confirmOrderByGiftExchange(body) =>
      _giftExchangeDatasource.confirmOrderByGiftExchange(body);

  Future<DataOrderResponse> doGetAllOrdersOfCustomer() =>
      _giftExchangeDatasource.doGetAllOrdersOfCustomer();

  Future doPostCreateCard(body) =>
      _giftExchangeDatasource.doPostCreateCard(body);

  Future addToCartAdvance(body) =>
      _giftExchangeDatasource.addToCartAdvance(body);

  Future updateCartAdvance(String id, body) =>
      _giftExchangeDatasource.updateCartAdvance(id, body);

  Future updateCartGiftExchange(body, String id) =>
      _giftExchangeDatasource.updateCartGiftExchange(body, id);

  Future<DataDetailOrderResponse> getOrderDetailById(String id)
  => _giftExchangeDatasource.getOrderDetailById(id);

  Future<List<ProductResponse>> getAllProductByGiftExchangePoints()
  => _giftExchangeDatasource.getAllProductByGiftExchangePoints();
}
