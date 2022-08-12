import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/AppUtils.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductWidgetModel extends ViewModel{
    final CustomerUserCase _customerUserCase;

  ProductWidgetModel(this._customerUserCase);

  Future<void> addToCart(int idProduct)async {

    _customerUserCase.addToCartCustomer({
       "product_id": idProduct,
       "session_id" : 'eyJpdiI6ImZaRDk5N2ZkZk1kUU5kaDZRTm42dUE9PSIsInZhbHVlIjoiLzc2N2FYZHNUNGZVSERpeVZkZlllcnZUVEVwVThBcHQyczd6QzJtVzA2MD0iLCJtYWMiOiIzMmI1ZGZhYjMwMTUzNTcwYzBhN2YzZjI1YjYyZDdkZTg2NWUzZDk5ZjIwNzUyZjQ4ZjcwODEwNmMxYWE3YjIwIiwidGFnIjoiIn0='
    }).then((value){
       AppUtils().showPopupSuccessWarranty(
         title: 'Thành công',
         subtitle: 'Chúc mừng bạn đã tạo đơn quà thành công',
         button: 'Tiếp tục mua hàng'
       );
    });
  }
}