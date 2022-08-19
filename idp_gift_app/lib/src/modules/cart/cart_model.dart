import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/AppUtils.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CartModel extends ViewModel {
  final CustomerUserCase _customerUserCase;
  final SharedPreferences _sharedPreferences;
  Rxn<DataCardResponse> dataCart = Rxn();

  Rxn<ProductResponse> productResp = Rxn();
  RxString productCode = ''.obs;
  RxList<CardInfo> cartInfo = RxList.empty();
  RxList<CardInfo> cartInfoCode = RxList.empty();
  RxList<UserAddressResponse> dataAddress = RxList.empty();
  Rxn<UserAddressResponse> address = Rxn();
  // RxList<String> cartInfoCode = RxList.empty();

  CartModel(this._customerUserCase, this._sharedPreferences);

  @override
  void initState() {
    super.initState();
    loading(() =>  refresh());
  }

  Future<void> refresh() => Future.wait([
        doGetAllCartByUser(),
        getAddressByUser()
      ]);

  Future<void> doGetAllCartByUser() async {
    _customerUserCase.getCartExchangeByUser().then((value) {
      dataCart.value = value.data;
      dataCart.value?.details?.forEach((detail) async {
        if(((detail.cardCode ?? '')).isEmpty){
          // cartInfoCode.add(detail.cartInfo?.first.code ?? '');
          print('Chạy đc không');
          cartInfoCode.add(detail.cartInfo?.first ?? CardInfo());
          await updateQuantityOrCode(detail.id.toString(), detail.quantity, detail.cartInfo?.first.code);
        }else{
          print(detail.cartInfo?.firstWhere((card) => card.code == detail.cardCode).code);
          // cartInfoCode.add((detail.cartInfo?.firstWhere((card) => card.code == detail.cardCode).code) ?? '');
          cartInfoCode.add((detail.cartInfo?.firstWhere((card) => card.code == detail.cardCode) ?? CardInfo()));
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

  Future<void> getAddressByUser() async{
   await _customerUserCase.doGetAllAddressUser().then((value) async {
      dataAddress.value = value.data ?? [];
      print('>>>>>>>>>>>>>>>>>>>');
      print(value.data?.firstWhere((address) => address.isDefault == 1).fullAddress);
      address.value = value.data?.firstWhere((address) => address.isDefault == 1);

    });

  }

  Future<void> deleteCart(String id) async {
    AppUtils().showPopupConfirm(
      action: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: UIColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: UIColors.black40)
                )
              ),
              onPressed: (){
                  Get.back();
              },
              child: const Text(
                  'Huỷ',
                style: TextStyle(
                  color: UIColors.black,
                  fontWeight: FontWeight.w400
                ),
              )
          ),
        const SizedBox(width: 8,),
          ElevatedButton(
              onPressed: () async{
                await _customerUserCase.deleteCart(id);
                await refresh();
                Get.back();
              },
              child: const Text(
                'Đồng ý',
                style: TextStyle(
                    fontWeight: FontWeight.w400
                ),
              )
          ),
        SizedBox(width: 16,)
      ]
    );
  }
  Future<void> deleteAllCart() async {
    AppUtils().showPopupConfirm(
        action: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: UIColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: UIColors.black40)
                  )
              ),
              onPressed: (){
                Get.back();
              },
              child: const Text(
                'Huỷ',
                style: TextStyle(
                    color: UIColors.black,
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          const SizedBox(width: 8,),
          ElevatedButton(
              onPressed: () async{
                await _customerUserCase.deleteAllCart(_sharedPreferences.getString('uSessionId') ?? '');
                await refresh();
                Get.back();
              },
              child: const Text(
                'Đồng ý',
                style: TextStyle(
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          SizedBox(width: 16,)
        ]
    );
  }
}
