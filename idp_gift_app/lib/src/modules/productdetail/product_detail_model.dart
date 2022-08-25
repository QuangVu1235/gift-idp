import 'package:get/get.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailModel extends ViewModel{

  RxInt indexSlider = 0.obs;
  int idProduct = 0;

  ProductDetailModel();

  // Future<void> initStateAsync() async {
  //   await refresh();
  // }

  // Future<void> refresh() async {
  //   await Future.wait([
  //     getProductById(),
  //   ]);
  // }



}