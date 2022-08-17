import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExChangePointsModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  RxList<GitExchangePointsResp> dataGiftExchangePoints = RxList.empty();

  @override
  void initState() {
    if (dataGiftExchangePoints.isEmpty) {
       refresh();
    }
  }

  ExChangePointsModel(this._customerUserCase);

  Future<void> refresh() async {
    await getAllGiftExchangePoints();
  }
  Future<void> getAllGiftExchangePoints() async {
    loading(() async{
     await _customerUserCase.getAllGiftExchangePoints()
          .then((value) => dataGiftExchangePoints.value = value.data ?? []
      );
    });
  }
}