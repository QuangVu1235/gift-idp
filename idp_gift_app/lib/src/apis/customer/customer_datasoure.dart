import 'package:idp_gift_app/src/apis/customer/customer_api.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/category_response.dart';
import 'package:idp_gift_app/src/apis/response/confirmorder/confirm_order.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:injectable/injectable.dart';

abstract class CustomerDataSource {
  Future<void> addToCartCustomer(dynamic body);

  Future<CartDataReponse> getCartExchangeByUser();

  Future<DataProductResponse> getProductByCode(String code);

  Future<dynamic> deleteCart(String id);

  Future<dynamic> deleteAllCart(String sessionId);

  Future<dynamic> updateCart(String id, dynamic body);

  Future<dynamic> changeStatusOrder(
      String id, String status, String canceledReason);

  Future<DataGitExchangePoints> getAllGiftExchangePoints(body);

  Future<List<ProductResponse>> getProductByExchangePoint(String productName,String code);

  Future<List<ProductResponse>> getAllProductExchangePoints(String code);
  //managerAddress

  Future<DataUserAddress> doPostAddressUser(
      UserAddressResponse userAddressResponse);

  Future<DataUserAddress> doPutAddressUser(String id, UserAddressResponse userAddressResponse);

  Future<DataUserAddress> doPutAddressUserDefault(String id);

  Future<dynamic> doDeleteAddressUser(String id);

  Future<DataUserAddress> doGetAllAddressUser();

  Future<DataUserAddress> doGetAllAddressUserDetail(String id);

  Future<StatusOrderResp> confirmOrderExchange(dynamic body);

  Future<DataOrderResponse> getAllOrdersByUser();

  Future<DataCategories> getAllCategories();

  Future<DataProductResponse> doGetAllProductByCategory(String categoryId);
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
  Future<dynamic> updateCart(String id, body) => _customerAPI.updateCart(id, body);

  @override
  Future changeStatusOrder(String id, String status, String canceledReason) =>
      _customerAPI.changeStatusOrder(
          id, ({"status": status, "canceled_reason": canceledReason}));

  @override
  Future<DataGitExchangePoints> getAllGiftExchangePoints(
      body) =>
      _customerAPI.getAllGiftExchangePoints(body);

  @override
  Future<List<ProductResponse>> getProductByExchangePoint(String productName, String code)
  => _customerAPI.getProductByExchangePoint(productName, code);

  @override
  Future<dynamic> doDeleteAddressUser(String id) =>
      _customerAPI.doDeleteAddressUser(id);

  @override
  Future<DataUserAddress> doGetAllAddressUser() =>
      _customerAPI.doGetAllAddressUser();

  @override
  Future<DataUserAddress> doGetAllAddressUserDetail(String id) =>
      _customerAPI.doGetAllAddressUserDetail(id);

  @override
  Future<DataUserAddress> doPostAddressUser(
          UserAddressResponse userAddressResponse) =>
      _customerAPI.doPostAddressUser(userAddressResponse);

  @override
  Future<DataUserAddress> doPutAddressUser(String id,UserAddressResponse userAddressResponse) =>
      _customerAPI.doPutAddressUser(id,userAddressResponse);

  @override
  Future<DataUserAddress> doPutAddressUserDefault(String id) =>
      _customerAPI.doPutAddressUserDefault(id);

  @override
  Future<List<ProductResponse>> getAllProductExchangePoints(String code) =>
      _customerAPI.getAllProductExchangePoints(code);

  @override
  Future deleteAllCart(String sessionId) =>
      _customerAPI.deleteAllCart(sessionId);

  @override
  Future<StatusOrderResp> confirmOrderExchange(body)
  => _customerAPI.confirmOrderExchange(body);

  @override
  Future<DataOrderResponse> getAllOrdersByUser()
  => _customerAPI.getAllOrdersByUser();

  @override
  Future<DataCategories> getAllCategories()
  => _customerAPI.getAllCategories();

  @override
  Future<DataProductResponse> doGetAllProductByCategory(String categoryId)
  => _customerAPI.doGetAllProductByCategory(categoryId);


}
