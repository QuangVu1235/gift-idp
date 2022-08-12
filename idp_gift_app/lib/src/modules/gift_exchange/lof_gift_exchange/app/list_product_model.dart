import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/idp/kun/product_datasource.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListProductModel extends ViewModel{
  final ProductDataSourceKun _dataSourceKun;
  RxInt categoryId = 0.obs;
  RxList<ProductResponse> dataProduct = RxList.empty();

  ListProductModel(this._dataSourceKun);

  Future<void> doGetAllProductByCategoryId()async {
   await _dataSourceKun.doGetAllProductByCategory(categoryId.value).then((value) async{
          dataProduct.value = value.data ?? [];
    });
  }


}