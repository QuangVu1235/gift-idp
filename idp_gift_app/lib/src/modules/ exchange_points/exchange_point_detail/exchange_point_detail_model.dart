import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/customer/customer_datasoure.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/category_response.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/modules/%20exchange_points/exchange_point_detail/store_screen.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExChangePointsDetailModel extends ViewModel{
  final CustomerUserCase _customerUserCase;
  RxString exChangePointCode = ''.obs;
  Rxn<GitExchangePointsResp> gitExchangePointsResp = Rxn();
  RxList<ProductResponse> dataProducts = RxList.empty();
  RxList<Categories> categories = RxList.empty();

  @override
  void initState() {
    getAllCategory();
  }
  ExChangePointsDetailModel(this._customerUserCase);

  Future<void> refresh() async {
    await getAllProductInGiftExchangePoints();
  }
  GitExchangePointsResp? request;
  Future<void> getAllProductInGiftExchangePoints() async {
    // request = GitExchangePointsResp(
    //   id: giftExchangePointsRequest.value?.id,
    //   code: giftExchangePointsRequest.value?.code,
    //   address: giftExchangePointsRequest.value?.address,
    //   email: giftExchangePointsRequest.value?.email,
    //   fullName: giftExchangePointsRequest.value?.fullName,
    //   groupCode: giftExchangePointsRequest.value?.groupCode,
    //   groupId:  giftExchangePointsRequest.value?.groupId,
    //   groupName: giftExchangePointsRequest.value?.groupName,
    //   isActive:  giftExchangePointsRequest.value?.isActive,
    //   phone:   giftExchangePointsRequest.value?.phone,
    //   tax:   giftExchangePointsRequest.value?.tax,
    //   type:  giftExchangePointsRequest.value?.type,
    //   updatedAt: giftExchangePointsRequest.value?.updatedAt,
    // );
    loading(() async{
      await _customerUserCase.getAllProductExchangePoints(exChangePointCode.value)
          .then((value) => dataProducts.value = value
      );
    });
  }

  Future<void> getAllCategory()async {
    loading(() async => await _customerUserCase.getAllCategories().then((value) async{
      categories.value = value;
    }));
  }

  Future<void> findProductByName (String search) async {
    loading(() async{
      await  _customerUserCase.getProductByExchangePoint(search,exChangePointCode.value)
          .then((value) => dataProducts.value = value);
    });
  }
}