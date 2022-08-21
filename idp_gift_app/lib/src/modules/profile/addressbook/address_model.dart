import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/usecases/customer_usercase.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressModel extends ViewModel {
  final CustomerUserCase _customerUserCase;

  RxList<UserAddressResponse> dataAddress = RxList.empty();
  Rxn<UserAddressResponse> address = Rxn();

  AddressModel(this._customerUserCase);

  @override
  void initState() {
    getAddressByUser();
  }

  Future<void> refresh() async {
    await getAddressByUser();
  }

  Future<void> getAddressByUser() async {
    // dataAddress.refresh();
    await _customerUserCase.doGetAllAddressUser().then((value) async {
      if (value.data?.isNotEmpty == true) {
        value.data?.forEach((element) {
          if (element.isDefault == 0) {
            dataAddress.add(element);
          }
        });
        address.value = value.data?.firstWhere(
            (address) => address.isDefault == 1,
            orElse: () => UserAddressResponse(id: null));
      } else {
        dataAddress.clear();
      }
    });
  }

  Future<void> deleteAddress(String id, int index) async {
    await _customerUserCase.doDeleteAddressUser(id).then((value) async => {
          print('...............'),
          print(value['status']),
          Fluttertoast.showToast(
              msg: value['status'], backgroundColor: UIColors.brandA),
          if (index == 00010)
            {print('delete default'), address.value = null}
          else
            {
              dataAddress.removeAt(index),
            },
          await getAddressByUser()
        });
  }
}
