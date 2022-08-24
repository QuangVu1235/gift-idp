import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/usecases/gift_exchange_usecase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CreateGiftOrderModel extends ViewModel{
  final GiftExchangeUseCase _giftExchangeUseCase;
  final SharedPreferences _sharedPreferences;
  final TextEditingController inPutSearch = TextEditingController();
  RxList<ProductResponse> dataProduct = RxList.empty();
   DataOrderResponse? orderss;

  CreateGiftOrderModel(this._giftExchangeUseCase, this._sharedPreferences);

  @override
  void initState(){
    refresh();
  }

  Future<void> refresh()async {
    await getAllProductByGiftExchangePoint();
  }

  Future<void> getAllProductByGiftExchangePoint()async {
    _giftExchangeUseCase.getAllProductByGiftExchangePoints().then((value) => {
        dataProduct.value = value
    });
  }

  Future<void> addToCart(int idProduct)async {
    loading(() => _giftExchangeUseCase.addToCartGiftExchange({
      "product_id": idProduct,
      "session_id" : _sharedPreferences.getString('uSessionId'),
    }).then((value){
      Fluttertoast.showToast(msg: 'Đặt hàng thành công', backgroundColor: UIColors.brandA);
      // AppUtils().showPopupSuccessWarranty(
      //   title: 'Thành công',
      //   subtitle: 'Chúc mừng bạn đã tạo đơn quà thành công',
      //   button: 'Tiếp tục mua hàng'
      // );
    }));
  }


}