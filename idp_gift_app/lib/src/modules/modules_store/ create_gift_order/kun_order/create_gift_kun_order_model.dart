import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateKunGiftOrderModel extends ViewModel {
  final TextEditingController inPutSearch = TextEditingController();
  RxList<ProductResponse> dataProduct = RxList.empty();
}
