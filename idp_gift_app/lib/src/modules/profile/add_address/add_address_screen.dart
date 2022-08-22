import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_input_form_widget.dart';
import 'package:idp_gift_app/src/modules/profile/add_address/add_address_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

class AddAddressScreen extends StatefulWidget {
  final UserAddressResponse? defaultAddress;
  final void Function(UserAddressResponse value)? confirmAddress;
  const AddAddressScreen({Key? key, this.defaultAddress, this.confirmAddress}) : super(key: key);
  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ViewWidget<AddAddressScreen,AddAddressModel> {
  @override
  void initState() {
    super.initState();
    viewModel.defaultAddress = widget.defaultAddress;
    viewModel.confirmAddress = widget.confirmAddress;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: AppBar(
        backgroundColor: UIColors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Thêm địa chỉ mới",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        shape:
        Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.5)),
      ),
      body:
      SingleChildScrollView(
        child: Form(
          key: viewModel.fromKey,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(SpaceValues.space16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalInputFormWidget(
                  controller: viewModel.inputfullname,
                  title: 'Họ và tên',
                  hint: 'Nhập họ và tên',
                  requireInput: '',
                  validator: Validator.fullname,
                ),
                const SizedBox(height: 16,),
                GlobalInputFormWidget(
                  controller: viewModel.inputPhone,
                  title: 'Số điện thoại',
                  hint: 'Nhập số điện thoại',
                  textInputType: TextInputType.phone,
                  requireInput: '',
                  validator: Validator.fullname,
                ),
                const SizedBox(height: 16,),
                RichText(
                  text: TextSpan(
                    text: "Tỉnh/ Thành phố",
                    style: Theme.of(context).textTheme.headline6,
                    // children: const [
                    //   TextSpan(
                    //     text: ' *',
                    //     style: TextStyle(color: UIColors.error80),
                    //   )
                    // ],
                  ),
                ),
                const SizedBox(height: SpaceValues.space4,),
                Obx(() => InputDecorator(
                  decoration: InputDecoration(
                    hintText: "Chọn Tỉnh/ Thành phố",
                    contentPadding: const EdgeInsets.only(left: 5),
                    border: viewModel.validCity.isNotEmpty ? const OutlineInputBorder() : Theme.of(context).inputDecorationTheme.errorBorder,
                    errorText: viewModel.validCity.isNotEmpty ? '  ${viewModel.validCity.value}' : null,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: viewModel.city.value,
                      items: viewModel.cities.map((e)
                      => DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(e.name ?? 'Chọn Tỉnh/ Thành phố'),
                        ), value: e.code ?? '',
                      ),
                      ).toList(),
                      onChanged: (value) {
                        viewModel.city.value = value;
                        viewModel.loadDistricts();
                      },
                    ),
                  ),
                )),
                const SizedBox(height: SpaceValues.space16),
                RichText(
                  text: TextSpan(
                    text: "Quận/ Huyện",
                    style: Theme.of(context).textTheme.headline6,
                    // children: const [
                    //   TextSpan(
                    //       text: ' *',
                    //       style: TextStyle(color: UIColors.error80)
                    //   )
                    // ],
                  ),
                ),
                const SizedBox(height: SpaceValues.space4,),
                Obx(() => InputDecorator(
                  decoration: InputDecoration(
                    hintText: "Chọn Quận/ Huyện",
                    contentPadding: const EdgeInsets.only(left: 5),
                    border: viewModel.validDistrict.isNotEmpty ? const OutlineInputBorder() : Theme.of(context).inputDecorationTheme.errorBorder,
                    errorText: viewModel.validDistrict.isNotEmpty ? '  ${viewModel.validDistrict.value}' : null,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: viewModel.district.value,
                      items: viewModel.districts.map((e)
                      => DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(e.name ?? 'Chọn Quận/ Huyện',),
                        ),
                        value: e.code ?? '',
                      ),
                      ).toList(),
                      onChanged: viewModel.districts.length > 1 ?
                          (value) {
                        viewModel.district.value = value;
                        viewModel.loadWards();
                      } :
                      null,
                    ),
                  ),
                )),
                const SizedBox(height: SpaceValues.space16),
                RichText(
                  text: TextSpan(
                    text: "Phường/ Xã",
                    style: Theme.of(context).textTheme.headline6,
                    // children: const [
                    //   TextSpan(
                    //       text: ' *',
                    //       style: TextStyle(color: UIColors.error80)
                    //   ),
                    // ],
                  ),
                ),
                const SizedBox(height: SpaceValues.space4,),
                Obx(() => InputDecorator(
                  decoration: InputDecoration(
                    hintText: "Chọn Phường/ Xã",
                    contentPadding: const EdgeInsets.only(left: 5),
                    border: viewModel.validWard.isNotEmpty ? const OutlineInputBorder() : Theme.of(context).inputDecorationTheme.errorBorder,
                    errorText: viewModel.validWard.isNotEmpty ? '  ${viewModel.validWard.value}' : null,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: viewModel.ward.value,
                      items: viewModel.wards.map((e)
                      => DropdownMenuItem(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(e.name ?? 'Chọn Phường/ Xã'),
                        ), value: e.code ?? '',
                      ),
                      ).toList(),
                      onChanged: viewModel.wards.length > 1 ?
                          (value) {
                        viewModel.ward.value = value;
                      } :
                      null,
                    ),
                  ),
                )),
                const SizedBox(height: SpaceValues.space16),
                GlobalInputFormWidget(
                  controller: viewModel.inputAddress,
                  textInputType: TextInputType.streetAddress,
                  validator: Validator.address,
                  title: 'Địa chỉ cụ thể',
                  hint: 'Tên đường, số nhà, thôn, xóm',
                  minLines: 3,
                  maxLines: 4,
                  requireInput: '',
                ),
                Visibility(
                  visible: widget.confirmAddress == null,
                  child: const SizedBox(height: SpaceValues.space24,),
                ),
                Visibility(
                  visible: widget.confirmAddress == null,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: InkWell(
                      onTap: () => viewModel.onChangeIsDefault(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                                () => Icon(
                              viewModel.checkIsDefault.value
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              size: 20.0,
                              color: UIColors.black70,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            "Đặt làm địa chỉ mặc định",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: UIColors.black70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: UIColors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          // decoration: BoxDecoration(
          //   border: Border(bottom:BorderSide(color: Colors.grey.shade300, width: 0.5))
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                viewModel.btnConfirm();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Hoàn tất",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddAddressModel createViewModel()=> getIt<AddAddressModel>();
}
