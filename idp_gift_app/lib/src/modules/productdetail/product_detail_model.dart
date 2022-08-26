import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  RxInt indexSlider = 0.obs;
  int idProduct = 0;
  RxList<ProductResponse> productResp = RxList.empty();

  ProductDetailModel(this._customerUserCase);

  // Future<void> initStateAsync() async {
  //   await refresh();
  // }

  // Future<void> refresh() async {
  //   await Future.wait([
  //     getProductById(),
  //   ]);
  // }

  Future<void> getProductByCategoryId(String categoryId)async {
      loading(() async{
        await _customerUserCase.doGetAllProductByCategory(categoryId)
            .then((value) {
          productResp.value = value.data ?? [];

        });
      });
  }



}