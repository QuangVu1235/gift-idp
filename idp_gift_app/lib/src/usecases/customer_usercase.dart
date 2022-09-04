import 'package:idp_gift_app/src/apis/customer/customer_datasoure.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/category_response.dart';
import 'package:idp_gift_app/src/apis/response/confirmorder/confirm_order.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
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

  Future deleteAllCart(String sessionId)
  => _customerDataSource.deleteAllCart(sessionId);
  //update cart
  Future<dynamic> updateCart(String id, body)
  => _customerDataSource.updateCart(id, body);
  // danh sách điểm đổi quà
  Future<DataGitExchangePoints> getAllGiftExchangePoints(body)
  => _customerDataSource.getAllGiftExchangePoints(body);

  // tìm sp trong điểm đổi quà
  Future<List<ProductResponse>> getProductByExchangePoint(String productName, String code)
  => _customerDataSource.getProductByExchangePoint(productName, code);

  Future<List<ProductResponse>> getAllProductExchangePoints(String code)
  => _customerDataSource.getAllProductExchangePoints(code);
  //manager Address
  
  Future<dynamic> doDeleteAddressUser(String id)
  => _customerDataSource.doDeleteAddressUser(id);

  
  Future<DataUserAddress> doGetAllAddressUser()
  => _customerDataSource.doGetAllAddressUser();

  
  Future<DataUserAddress> doGetAllAddressUserDetail(String id)
  => _customerDataSource.doGetAllAddressUserDetail(id);

  
  Future<dynamic> doPostAddressUser(UserAddressResponse userAddressResponse)
  => _customerDataSource.doPostAddressUser(userAddressResponse);

  
  Future<dynamic> doPutAddressUser(String id,UserAddressResponse userAddressResponse)
  => _customerDataSource.doPutAddressUser(id,userAddressResponse);
  
  Future<DataUserAddress> doPutAddressUserDefault(String id)
  => _customerDataSource.doPutAddressUserDefault(id);

  //confirmOrder
  Future<StatusOrderResp> confirmOrderExchange(body)
  => _customerDataSource.confirmOrderExchange(body);

  //getAllOrderByUser
  Future<DataOrderResponse> getAllOrdersByUser()
  => _customerDataSource.getAllOrdersByUser();

  Future<List<Categories>> getAllCategories()
  => _customerDataSource.getAllCategories();

  Future<DataProductResponse> doGetAllProductByCategory(String categoryId)
  => _customerDataSource.doGetAllProductByCategory(categoryId);

  Future<DataProductResponse> doGetAllProductByCategoryDistributor(String categoryId, String distributorCode)
  => _customerDataSource.doGetAllProductByCategoryDistributor(categoryId, distributorCode);
}