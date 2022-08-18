import 'package:idp_gift_app/src/apis/customer/customer_api.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:injectable/injectable.dart';

abstract class CustomerDataSource {
  Future<void> addToCartCustomer(dynamic body);
  Future<CartDataReponse> getCartExchangeByUser();
  Future<DataProductResponse> getProductByCode(String code);
  Future<dynamic> deleteCart(String id);
  Future<void> updateCart(String id,dynamic body);
  Future<dynamic> changeStatusOrder(
      String id, String status, String canceledReason);
  Future<DataGitExchangePoints> getAllGiftExchangePoints();
  Future<List<ProductResponse>> getAllProductExchangePoints(String code);

}

@LazySingleton(as: CustomerDataSource)
class CustomerDataSourceImpl extends CustomerDataSource {
  final CustomerAPI _customerAPI;

  CustomerDataSourceImpl(this._customerAPI);

  @override
  Future<void> addToCartCustomer(body) => _customerAPI.addToCartCustomer(body);

  @override
  Future<CartDataReponse> getCartExchangeByUser() =>
      _customerAPI.getCartExchangeByUser();

  @override
  Future<DataProductResponse> getProductByCode(String code) =>
      _customerAPI.getProductByCode(code);

  @override
  Future deleteCart(String id) => _customerAPI.deleteCart(id);

  @override
  Future<void> updateCart(String id, body) => _customerAPI.updateCart(id,body);

  @override
  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _customerAPI.changeStatusOrder(
          id, ({"status": status, "canceled_reason": canceledReason}));

  @override
  Future<DataGitExchangePoints> getAllGiftExchangePoints()
  => _customerAPI.getAllGiftExchangePoints();

  @override
  Future<List<ProductResponse>> getAllProductExchangePoints(String code)
  => _customerAPI.getAllProductExchangePoints({
        "code": code
   });
}
