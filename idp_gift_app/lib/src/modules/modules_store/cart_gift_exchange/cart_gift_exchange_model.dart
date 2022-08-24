import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/apis/response/cart_response.dart';
import 'package:idp_gift_app/src/apis/response/confirmorder/confirm_order_request.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/usecases/gift_exchange_usecase.dart';
import 'package:idp_gift_app/src/utils/AppUtils.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CartGiftExchangeModel extends ViewModel {
  final CustomerUserCase _customerUserCase;
  final GiftExchangeUseCase _giftExchangeUseCase;
  final SharedPreferences _sharedPreferences;
  Rxn<DataCardResponse> dataCart = Rxn();

  Rxn<ProductResponse> productResp = Rxn();
  RxString productCode = ''.obs;
  RxList<CardInfo> cartInfo = RxList.empty();
  RxList<CardInfo> cartInfoCode = RxList.empty();
  RxList<UserAddressResponse> dataAddress = RxList.empty();
  Rxn<UserAddressResponse> address = Rxn();
  RxString message = ''.obs;
  RxBool checkPoint = true.obs;
  // RxList<String> cartInfoCode = RxList.empty();

  CartGiftExchangeModel(this._customerUserCase, this._sharedPreferences, this._giftExchangeUseCase);

  @override
  void initState() {
    super.initState();
    loading(() => refresh());
  }

  Future<void> refresh() =>
      Future.wait([doGetAllCartByUser(), getAddressByUser(), checkPoints()]);

  Future<void> doGetAllCartByUser() async {
    _customerUserCase.getCartExchangeByUser().then((value) {
      dataCart.value = value.data;
      dataCart.value?.details?.forEach((detail) async {
        if (((detail.cardCode ?? '')).isEmpty) {
          // cartInfoCode.add(detail.cartInfo?.first.code ?? '');
          print('Chạy đc không');
          cartInfoCode.add(detail.cartInfo?.first ?? CardInfo());
          await updateQuantityOrCode(detail.id.toString(), detail.quantity,
              detail.cartInfo?.first.code);
        } else {
          print(detail.cartInfo
              ?.firstWhere((card) => card.code == detail.cardCode)
              .code);
          // cartInfoCode.add((detail.cartInfo?.firstWhere((card) => card.code == detail.cardCode).code) ?? '');
          cartInfoCode.add((detail.cartInfo
              ?.firstWhere((card) => card.code == detail.cardCode) ??
              CardInfo()));
        }
      });
    });
  }

  Future<void> updateQuantityOrCode(
      String id, int? quantity, String? cardCode) async {
    _customerUserCase.updateCart(
        id, ({'quantity': quantity, 'card_code': cardCode}));
  }

  Future<void> getProductByCode() async {
    _customerUserCase.getProductByCode(productCode.value).then((value) {
      productResp.value = value.data?.first;
      cartInfo.value = productResp.value?.cardInfo ?? [];
    });
  }

  Future<void> getAddressByUser() async {
    await _customerUserCase.doGetAllAddressUser().then((value) async {
      dataAddress.value = value.data ?? [];
      // print('>>>>>>>>>>>>>>>>>>>');
      // print(value.data
      //     ?.firstWhere((address) => address.isDefault == 1)
      //     .fullAddress);
      // address.value =
      //     value.data?.firstWhere((address) => address.isDefault == 1);
    });
  }

  Future<void> checkPoints() async {
    if (dataCart.value?.distributorCityCode == '') {
      checkPoint.value = false;
    } else {
      checkPoint.value = true;
    }
  }

  ConfirmOrderRequest? request;
  Future<void> confirmOrder() async {
    if (!validate()) {
      loading(() =>  throw message.value);
      return;
    }
    message.value = '';
    ConfirmOrderRequest request = ConfirmOrderRequest(
        sessionId: _sharedPreferences.getString('uSessionId'),
        phone: address.value?.phone,
        cityCode: address.value?.cityCode,
        districtCode: address.value?.districtCode,
        wardCode: address.value?.wardCode,
        streetAddress: address.value?.streetAddress,
        fullName: address.value?.fullName,
        distributorId: dataCart.value?.distributorId,
        distributorCode: dataCart.value?.distributorCode,
        distributorName: dataCart.value?.distributorName,
        orderChannel: 'APP');
    loading(() async {
      await _customerUserCase.confirmOrderExchange(request).then((value) async {
        await AppUtils().showPopupSuccessWarranty(
            isSuccess: true,
            title: 'Thành công',
            subtitle: 'Chúc mừng bạn tạo đơn hàng thành công',
            button: 'Tiếp tục đổi quà');
        dataCart.value?.details?.clear();
        dataCart.refresh();
      });
    }).then((value) => Get.back());
  }

  bool validate() {
    bool result = true;
    if (address.value == null) {
      message.value = message.value + 'Không bỏ trống địa chỉ\n';
      result = false;
    }
    if (dataCart.value?.distributorId == null) {
      message.value = message.value + 'Không bỏ trống điểm đổi quà';
      result = false;
    }
    return result;
  }

  Future<void> deleteCart(String id, int index) async {
    AppUtils().showPopupConfirm(action: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: UIColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: UIColors.black40))),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Huỷ',
            style:
            TextStyle(color: UIColors.black, fontWeight: FontWeight.w400),
          )),
      const SizedBox(
        width: 8,
      ),
      ElevatedButton(
          onPressed: () async {
            await _customerUserCase.deleteCart(id).then((value) async {
              dataCart.value?.details?.removeAt(index);
              dataCart.refresh();
              cartInfoCode.remove(cartInfoCode[index]);
              await doGetAllCartByUser();
              Get.back();
            });
          },
          child: const Text(
            'Đồng ý',
            style: TextStyle(fontWeight: FontWeight.w400),
          )),
      SizedBox(
        width: 16,
      )
    ]);
  }

  Future<void> deleteAllCart() async {
    AppUtils().showPopupConfirm(action: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: UIColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: UIColors.black40))),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Huỷ',
            style:
            TextStyle(color: UIColors.black, fontWeight: FontWeight.w400),
          )),
      const SizedBox(
        width: 8,
      ),
      ElevatedButton(
          onPressed: () async {
            await _customerUserCase.deleteAllCart(
                _sharedPreferences.getString('uSessionId') ?? '');
            await refresh();
            Get.back();
          },
          child: const Text(
            'Đồng ý',
            style: TextStyle(fontWeight: FontWeight.w400),
          )),
      SizedBox(
        width: 16,
      )
    ]);
  }
}
