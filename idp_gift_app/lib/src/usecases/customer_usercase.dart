import 'package:idp_gift_app/src/apis/customer/customer_datasoure.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
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
  //manager Address
  
  Future<DataUserAddress> doDeleteAddressUser(String id)
  => _customerDataSource.doDeleteAddressUser(id);

  
  Future<DataUserAddress> doGetAllAddressUser()
  => _customerDataSource.doGetAllAddressUser();

  
  Future<DataUserAddress> doGetAllAddressUserDetail(String id)
  => _customerDataSource.doGetAllAddressUserDetail(id);

  
  Future<DataUserAddress> doPostAddressUser(UserAddressResponse userAddressResponse)
  => _customerDataSource.doPostAddressUser(userAddressResponse);

  
  Future<DataUserAddress> doPutAddressUser(String id)
  => _customerDataSource.doPutAddressUser(id);
  
  Future<DataUserAddress> doPutAddressUserDefault(String id)
  => _customerDataSource.doPutAddressUserDefault(id);
}