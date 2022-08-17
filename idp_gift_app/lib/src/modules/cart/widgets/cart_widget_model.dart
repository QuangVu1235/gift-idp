import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/modules/cart/cart_model.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

import 'cart_kun_widget.dart';

@injectable
class CartWidgetModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  final CartModel _cartModel;

  Rxn<ProductResponse> productResp = Rxn();
  RxString productCode = ''.obs;
  RxString cartInfoCode = ''.obs;
  RxList<CardInfo> cartInfo = RxList.empty();


  CartWidgetModel(this._customerUserCase, this._cartModel);

  @override
  initState() {

    // productCode.value = _widget.productCode;

  }
  Future<void> getProductByCode()async {
    _customerUserCase.getProductByCode(productCode.value)
        .then((value) {
            productResp.value = value.data?.first;
            cartInfo.value = productResp.value?.cardInfo ?? [];
            cartInfoCode.value = cartInfo.value.first.code!;
            print('>>>>>>>>>>>');
            print(cartInfo.value.length);
    });
  }
  Future<void> deleteCart(String id) async{
    _customerUserCase.deleteCart(id);
  }
  Future<void> refreshCart() async{
   await _customerUserCase.getCartExchangeByUser()
        .then((value) async {
       _cartModel.dataCart.value = value.data;
      });
  }
}