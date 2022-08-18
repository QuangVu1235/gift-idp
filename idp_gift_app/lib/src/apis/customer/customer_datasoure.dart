import 'package:idp_gift_app/src/apis/customer/customer_api.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
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
  //managerAddress

  Future<DataUserAddress> doPostAddressUser(UserAddressResponse userAddressResponse);

  Future<DataUserAddress> doPutAddressUser(String id);

  Future<DataUserAddress> doPutAddressUserDefault(String id);

  Future<DataUserAddress> doDeleteAddressUser( String id);

  Future<DataUserAddress> doGetAllAddressUser();

  Future<DataUserAddress> doGetAllAddressUserDetail( String id);

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

  @override
  Future<DataUserAddress> doDeleteAddressUser(String id)
  => _customerAPI.doDeleteAddressUser(id);

  @override
  Future<DataUserAddress> doGetAllAddressUser()
  => _customerAPI.doGetAllAddressUser();

  @override
  Future<DataUserAddress> doGetAllAddressUserDetail(String id)
  => _customerAPI.doGetAllAddressUserDetail(id);

  @override
  Future<DataUserAddress> doPostAddressUser(UserAddressResponse userAddressResponse)
  => _customerAPI.doPostAddressUser(userAddressResponse);

  @override
  Future<DataUserAddress> doPutAddressUser(String id)
  => _customerAPI.doPutAddressUser(id);
  @override
  Future<DataUserAddress> doPutAddressUserDefault(String id)
  => _customerAPI.doPutAddressUserDefault(id);
}
