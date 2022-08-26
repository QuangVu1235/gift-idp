import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/idp/kun/product_datasource.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/category_response.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListProductModel extends ViewModel{
  final ProductDataSourceKun _dataSourceKun;
  final CustomerUserCase _customerUserCase;
  RxInt categoryId = 0.obs;
  RxList<Categories> categories = RxList.empty();

  @override
  void initState() {
    super.initState();
    // viewModel.categoryId.value = widget.categoryId;
     getAllCategory();
  }

  ListProductModel(this._dataSourceKun, this._customerUserCase);

  Future<void> getAllCategory()async {
    loading(() async => await _customerUserCase.getAllCategories().then((value) async{
      categories.value = value.data ?? [];
    }));

  }


}