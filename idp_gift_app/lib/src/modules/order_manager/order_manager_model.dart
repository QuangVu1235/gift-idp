import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderManagerModel extends ViewModel {
  final CustomerUserCase _customerUserCase;
  RxList<OrderResponse> orders = RxList.empty();

  OrderManagerModel(this._customerUserCase);

  @override
  void initState() {
    getAllOrderByUser();
  }

  Future<void> getAllOrderByUser() async {
    loading(() async{
      await _customerUserCase
          .getAllOrdersByUser()
          .then((value) => orders.value = value.data ?? []);
    });
  }
}
