import 'package:idp_gift_app/src/apis/customer/customer_api.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:injectable/injectable.dart';

abstract class CustomerDataSource{
  Future<void> addToCartCustomer(dynamic body);
  Future<CartDataReponse> getCartExchangeByUser();

}
@LazySingleton(as: CustomerDataSource)
class CustomerDataSourceImpl extends CustomerDataSource{
  final CustomerAPI _customerAPI;

  CustomerDataSourceImpl(this._customerAPI);

  @override
  Future<void> addToCartCustomer(body)
  => _customerAPI.addToCartCustomer(body);

  @override
  Future<CartDataReponse> getCartExchangeByUser()
  => _customerAPI.getCartExchangeByUser();

}