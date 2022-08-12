import 'package:idp_gift_app/src/apis/idp/kun/product_datasource.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProductUserCaseKun{
 final ProductDataSourceKun _dataSourceKun;

  ProductUserCaseKun(this._dataSourceKun);

 Future<DataProductResponse> doGetAllProductByCategory(int categoryId)
 => _dataSourceKun.doGetAllProductByCategory(categoryId);

}