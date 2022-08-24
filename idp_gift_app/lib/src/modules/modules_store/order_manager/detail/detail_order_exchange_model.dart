import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/modules/modules_store/order_manager/orders_exchange_model.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/usecases/gift_exchange_usecase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailOrderExchangeModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  final GiftExchangeUseCase _giftExchangeUseCase;
  final OrdersGiftExchangeModel _ordersGiftExchangeModel;
  final Rxn<OrderResponse>  orderResponse = Rxn();
  final RxInt index = 0.obs;
  TextEditingController note = TextEditingController();
  RxInt valueRadio = 0.obs;

  DetailOrderExchangeModel(this._customerUserCase, this._giftExchangeUseCase, this._ordersGiftExchangeModel);
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
  Future<void> changeStatusOrder(String id, String status, String canceledReason)async {
    _giftExchangeUseCase.changeStatusOrder(id, status, canceledReason).then((value) async {
      await getOrderDetailById(id);
      print('>>>>>>>>>>>>>>>');
      print(orderResponse.value?.status);
      await refresh();
      await refreshOrders();
    });
  }
  Future<void> getOrderDetailById(String id) async {
   await _giftExchangeUseCase.getOrderDetailById(id).then((value){
          orderResponse.value = value.data;
          orderResponse.refresh();
          print(orderResponse.value?.status);
   });
  }

  Future<void> refreshOrders() async {
    _ordersGiftExchangeModel.getAllOrderByUser();
    // await _giftExchangeUseCase
    //     .doGetAllOrdersOfCustomer()
    //     .then((value) async {
    //       _ordersGiftExchangeModel.orders.value = value.data ?? [];
    //       _ordersGiftExchangeModel.orders.refresh();
    // });

  }



}