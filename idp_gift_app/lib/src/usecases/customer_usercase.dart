import 'package:idp_gift_app/src/apis/customer/customer_datasoure.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CustomerUserCase{
  final CustomerDataSource _customerDataSource;
  @factoryMethod
  CustomerUserCase(this._customerDataSource);

  Future<void> addToCartCustomer(body)
  => _customerDataSource.addToCartCustomer(body);

  Future<CartDataReponse> getCartExchangeByUser()
  => _customerDataSource.getCartExchangeByUser();

  Future<DataProductResponse> getProductByCode(String code)
  => _customerDataSource.getProductByCode(code);


  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _customerDataSource.changeStatusOrder(id, status,canceledReason);

  // delete cart
  Future deleteCart(String id)
  => _customerDataSource.deleteCart(id);
  //update cart
  Future<void> updateCart(String id, body)
  => _customerDataSource.updateCart(id, body);
  // danh sách điểm đổi quà
  Future<DataGitExchangePoints> getAllGiftExchangePoints()
  => _customerDataSource.getAllGiftExchangePoints();

  Future<List<ProductResponse>> getAllProductExchangePoints(String code)
  => _customerDataSource.getAllProductExchangePoints(code);
}