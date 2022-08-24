import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/usecases/gift_exchange_usecase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersGiftExchangeModel extends ViewModel {
  final CustomerUserCase _customerUserCase;
  final GiftExchangeUseCase _giftExchangeUseCase;
  RxList<OrderResponse> orders = RxList.empty();

  OrdersGiftExchangeModel(this._customerUserCase, this._giftExchangeUseCase);

  @override
  void initState() {
    getAllOrderByUser();
  }

  Future<void> getAllOrderByUser() async {
    loading(() async {
      await _giftExchangeUseCase
          .doGetAllOrdersOfCustomer()
          .then((value) => orders.value = value.data ?? []);
    });
  }
}
