
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/idp/kun/service/product_api.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDataSourceKun{
  Future<DataProductResponse> doGetAllProductByCategory(int categoryId);

}
@LazySingleton(as:ProductDataSourceKun)
class ProductDataSourceKunImpl extends ProductDataSourceKun{
  final ProductApi _productApi;

  ProductDataSourceKunImpl(this._productApi);
  @override
  Future<DataProductResponse> doGetAllProductByCategory(int categoryId)
  => _productApi.doGetAllProductByCategory(categoryId);

}