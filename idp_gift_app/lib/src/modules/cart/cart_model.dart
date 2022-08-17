import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartModel extends ViewModel {
  final CustomerUserCase _customerUserCase;
  Rxn<DataCardResponse> dataCart = Rxn();

  Rxn<ProductResponse> productResp = Rxn();
  RxString productCode = ''.obs;
  RxList<CardInfo> cartInfo = RxList.empty();
  RxList<String> cartInfoCode = RxList.empty();

  CartModel(this._customerUserCase);

  @override
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() => Future.wait([
        doGetAllCartByUser(),
      ]);

  Future<void> doGetAllCartByUser() async {
    _customerUserCase.getCartExchangeByUser().then((value) {
      dataCart.value = value.data;
      dataCart.value?.details?.forEach((detail) async {
        if(((detail.cardCode ?? '')).isEmpty){
          cartInfoCode.add(detail.cartInfo?.first.code ?? '');
          await updateQuantityOrCode(detail.id.toString(), detail.quantity, detail.cartInfo?.first.code);
        }else{
          print(detail.cartInfo?.firstWhere((card) => card.code == detail.cardCode).code);
          cartInfoCode.add((detail.cartInfo?.firstWhere((card) => card.code == detail.cardCode).code) ?? '');
        }
      });
    });
  }

  Future<void> updateQuantityOrCode(String id, int? quantity, String? cardCode)async {
    _customerUserCase.updateCart(
        id,
        ({
          'quantity': quantity,
          'card_code': cardCode
        })
    );
  }

  Future<void> getProductByCode() async {
    _customerUserCase.getProductByCode(productCode.value).then((value) {
      productResp.value = value.data?.first;
      cartInfo.value = productResp.value?.cardInfo ?? [];
    });
  }

  Future<void> deleteCart(String id) async {
    _customerUserCase.deleteCart(id);
    await refresh();
  }
}
