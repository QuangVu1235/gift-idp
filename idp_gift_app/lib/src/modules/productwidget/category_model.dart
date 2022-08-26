import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/modules/productwidget/product_widget.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/AppUtils.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CategoryWidgetModel extends ViewModel{
    final CustomerUserCase _customerUserCase;
    final SharedPreferences _sharedPreferences;
    Rxn<GitExchangePointsResp> gitExchangePointsResp = Rxn();

    CategoryWidgetModel(this._customerUserCase, this._sharedPreferences);
    @override
    void initState() {

    }
  Future<void> addToCart(int idProduct)async {
    loading(() => _customerUserCase.addToCartCustomer({
      "product_id": idProduct,
      "session_id" : _sharedPreferences.getString('uSessionId'),
      "distributor_id": gitExchangePointsResp.value?.id,
      "distributor_code": gitExchangePointsResp.value?.code,
      "distributor_name": gitExchangePointsResp.value?.fullName,
      "distributor_phone": gitExchangePointsResp.value?.phone,
      "distributor_address" : gitExchangePointsResp.value?.address
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