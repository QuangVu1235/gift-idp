import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/profile/add_address/add_address_screen.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

import 'address_model.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState
    extends ViewWidget<AddressBookScreen, AddressModel> {
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
          "Sổ địa chỉ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade300, width: 0.5)),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Visibility(
            replacement: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Bạn chưa có địa chỉ nào!'),
            )),
            visible: viewModel.dataAddress.isNotEmpty,
            child: Column(
              children: [
                Obx(
                  () => Visibility(
                    replacement: SizedBox(),
                    visible: viewModel.address.value?.id != null,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xff1B68B5)),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      viewModel.address.value?.fullName ?? '',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          height: 2.1,
                                          letterSpacing: 0.5),
                                    ),
                                    Text(
                                      " (Địa chỉ mặc định)",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xff1B68B5),
                                          height: 2.1,
                                          letterSpacing: 0.5),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        viewModel.address.value?.fullAddress ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 12, letterSpacing: 0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(viewModel.address.value?.phone ?? '',
                                        style: TextStyle(
                                            fontSize: 12, letterSpacing: 0.5)),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(AddAddressScreen(
                                          defaultAddress:
                                              viewModel.address.value,
                                        ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          "Chỉnh sửa",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('123');
                                        viewModel.deleteAddress(
                                            viewModel.address.value?.id
                                                    .toString() ??
                                                '',
                                            00010);
                                      },
                                      child: Image.asset(
                                        "resources/images/recyclebin_address.png",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: viewModel.dataAddress.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width * .9,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        viewModel.dataAddress[index].fullName ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            height: 2.1,
                                            letterSpacing: 0.5),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          viewModel.dataAddress[index]
                                                  .fullAddress ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          viewModel.dataAddress[index].phone ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              letterSpacing: 0.5)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Get.to(AddAddressScreen(
                                            defaultAddress:
                                                viewModel.dataAddress[index],
                                          ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Text(
                                            "Chỉnh sửa",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          print('123');
                                          viewModel.deleteAddress(
                                              viewModel.dataAddress[index].id
                                                  .toString(),
                                              index);

                                          await viewModel.refresh();
                                        },
                                        child: Image.asset(
                                          "resources/images/recyclebin_address.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: UIColors.white,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          // decoration: BoxDecoration(
          //   border: Border(bottom:BorderSide(color: Colors.grey.shade300, width: 0.5))
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.to(AddAddressScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Thêm địa chỉ mới",
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
  AddressModel createViewModel() => getIt<AddressModel>();
}
