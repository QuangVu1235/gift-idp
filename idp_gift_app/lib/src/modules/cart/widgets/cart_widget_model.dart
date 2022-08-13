import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

import 'cart_kun_widget.dart';

@injectable
class CartWidgetModel extends ViewModel{
  final CustomerUserCase _customerUserCase;

  Rxn<ProductResponse> productResp = Rxn();
  RxString productCode = ''.obs;
  RxString cartInfoCode = ''.obs;

  CartWidgetModel(this._customerUserCase);

  @override
  initState() {
    print('>>>>>>>>>>>');
    // productCode.value = _widget.productCode;

  }
  Future<void> getProductByCode()async {
    _customerUserCase.getProductByCode(productCode.value)
        .then((value) {
            productResp.value = value;
    });
  }
}