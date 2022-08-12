import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  Rxn<DataCardResponse> dataCart = Rxn();

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
    _customerUserCase.getCartExchangeByUser()
        .then((value) => dataCart.value = value.data
    );

  }


}