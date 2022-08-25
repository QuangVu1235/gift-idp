import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/usecases/gift_exchange_usecase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

import 'detail_order_screen.dart';
@injectable
class DetailOrderModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  final GiftExchangeUseCase _giftExchangeUseCase;
  final Rxn<OrderResponse>  orderResponse = Rxn();
  final RxInt index = 0.obs;

  DetailOrderModel(this._customerUserCase, this._giftExchangeUseCase);
  @override
  void initState() {
  }
  Future<void> refresh() async {
    await checkDataOrderResp();
  }
  Future<void> checkDataOrderResp()async {
      if(orderResponse.value == null){
        print('load tại đây');
      }else{
        print('Không load');
        if(orderResponse.value?.status == 'NEW'){
            index.value = 0;
        }else if(orderResponse.value?.status == 'APPROVED'){
          index.value = 1;
        }else if(orderResponse.value?.status == 'SHIPPING'){
          index.value = 1;
        }else if(orderResponse.value?.status == 'SHIPPED'){
          index.value = 1;
        }else if(orderResponse.value?.status == 'COMPLETED'){
          index.value = 2;
        }
      }
  }
  Future<void> completeOrder()async {

  }

  Future<void> getOrderDetailById(String id) async {
    await _giftExchangeUseCase.getOrderDetailById(id).then((value){
      orderResponse.value = value.data;
      orderResponse.refresh();
      print(orderResponse.value?.status);
      refresh();
    });
  }


}