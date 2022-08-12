import 'package:idp_gift_app/src/apis/datasoure/customer_datasoure.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
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
}