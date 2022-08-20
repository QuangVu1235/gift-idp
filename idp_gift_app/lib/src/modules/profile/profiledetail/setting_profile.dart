import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_input_form_widget.dart';
import 'package:idp_gift_app/src/modules/profile/profiledetail/setting_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({Key? key}) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfile();
}

class _SettingProfile extends ViewWidget<SettingProfile, SettingProfileModel> {
  bool _isVisible = true;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: UIColors.white,
        shape: const Border(bottom: BorderSide(color: UIColors.border10)),
      ),
      // backgroundColor: UIColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color:UIColors.white,
              child: Padding(
                padding: const EdgeInsets.all(SpaceValues.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        ImagePicker ip = ImagePicker();
                        ip.pickImage(source: ImageSource.gallery).then((value) {
                          viewModel.imgUpload.value = value;
                        });
                      },
                      child: Obx(
                            () => Visibility(
                          visible: null != viewModel.imgUpload.value?.path,
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: UIColors.black,
                                  radius: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: ClipOval(
                                      child: Image.file(
                                        File(viewModel.imgUpload.value?.path ??
                                            ''),
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: UIColors.white,
                                    )),
                                const Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: UIColors.black,
                                    ))
                              ],
                            ),
                          ),
                          replacement: Center(
                            child: Stack(
                              children: <Widget>[
                                Visibility(
                                  // visible:viewModel.avartar.isNotEmpty ,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: ClipOval(
                                        child: GlobalImage(
                                          viewModel.avartar.value,
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 120,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: UIColors.white,
                                    )),
                                const Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: UIColors.black,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ///////////////////////////////////
                    const SizedBox(height: SpaceValues.space24),
                    Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalInputFormWidget(
                              readOnly: true,
                              controller: viewModel.id,
                              requireInput: '',
                              title: 'ID',
                              hint: 'id...',
                              textInputType: TextInputType.phone,
                            ),

                            const SizedBox(height: SpaceValues.space24),
                            GlobalInputFormWidget(
                              controller: viewModel.full_name,
                              title: 'Tên',
                              hint: 'Nguyễn Văn A',
                              textInputType: TextInputType.name,
                              requireInput: '',
                              // validator: Validator.fullnameCanEmpty,
                              suffixIcon: const Icon(
                                Icons.drive_file_rename_outline,
                              ),
                            ),
                            const SizedBox(height: SpaceValues.space24),
                            GlobalInputFormWidget(
                              readOnly: false,
                              controller: viewModel.email,
                              validator: Validator.emailCanEmpty,
                              textInputType: TextInputType.emailAddress,
                              requireInput: '',
                              title: 'Email',
                              hint: '(Chưa có email)',
                              suffixIcon: Icon(
                                Icons.drive_file_rename_outline,
                              ),
                            ),
                            const SizedBox(height: SpaceValues.space24),
                            RichText(
                              text: TextSpan(
                                text: "Giới tính",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            const SizedBox(height: SpaceValues.space4),
                            Obx(() => InputDecorator(
                              decoration: InputDecoration(
                                hintText: "Chọn giới tính",
                                contentPadding: const EdgeInsets.only(left: 5),
                                border: viewModel.validGender.isNotEmpty
                                    ? const OutlineInputBorder()
                                    : Theme.of(context)
                                    .inputDecorationTheme
                                    .errorBorder,
                                errorText: viewModel.validGender.isNotEmpty
                                    ? '  ${viewModel.validGender.value}'
                                    : null,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: viewModel.inputGender.value,
                                  items: const [
                                    DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SpaceValues.space8),
                                          child: Text("Chọn giới tính"),
                                        ),
                                        value: -1),
                                    DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SpaceValues.space8),
                                          child: Text("Nam"),
                                        ),
                                        value: 1),
                                    DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SpaceValues.space8),
                                          child: Text("Nữ"),
                                        ),
                                        value: 0),
                                    DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SpaceValues.space8),
                                          child: Text("Khác"),
                                        ),
                                        value: 3),
                                  ],
                                  onChanged: (value) => viewModel.inputGender.value =
                                      int.tryParse(value.toString()) ?? 1,
                                ),
                              ),
                            )),
                            const SizedBox(height: SpaceValues.space24),
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
                            const SizedBox(
                              height: SpaceValues.space4,
                            ),
                            Obx(() => InputDecorator(
                              decoration: InputDecoration(
                                hintText: "Chọn Tỉnh/ Thành phố",
                                contentPadding: const EdgeInsets.only(left: 5),
                                border: viewModel.validCity.isNotEmpty
                                    ? const OutlineInputBorder()
                                    : Theme.of(context)
                                    .inputDecorationTheme
                                    .errorBorder,
                                errorText: viewModel.validCity.isNotEmpty
                                    ? '  ${viewModel.validCity.value}'
                                    : null,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: viewModel.city.value,
                                  items: viewModel.cities
                                      .map(
                                        (e) => DropdownMenuItem(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                            e.name ?? 'Chọn Tỉnh/ Thành phố'),
                                      ),
                                      value: e.code ?? '',
                                    ),
                                  )
                                      .toList(),
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
                                //       style: TextStyle(color: UIColors.error80))
                                // ],
                              ),
                            ),
                            const SizedBox(
                              height: SpaceValues.space4,
                            ),
                            Obx(() => InputDecorator(
                              decoration: InputDecoration(
                                hintText: "Chọn Quận/ Huyện",
                                contentPadding: const EdgeInsets.only(left: 5),
                                border: viewModel.validDistrict.isNotEmpty
                                    ? const OutlineInputBorder()
                                    : Theme.of(context)
                                    .inputDecorationTheme
                                    .errorBorder,
                                errorText: viewModel.validDistrict.isNotEmpty
                                    ? '  ${viewModel.validDistrict.value}'
                                    : null,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: viewModel.district.value,
                                  items: viewModel.districts
                                      .map(
                                        (e) => DropdownMenuItem(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(
                                          e.name ?? 'Chọn Quận/ Huyện',
                                        ),
                                      ),
                                      value: e.code ?? '',
                                    ),
                                  )
                                      .toList(),
                                  onChanged: viewModel.districts.length > 1
                                      ? (value) {
                                    viewModel.district.value = value;
                                    viewModel.loadWards();
                                  }
                                      : null,
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
                                //       style: TextStyle(color: UIColors.error80)),
                                // ],
                              ),
                            ),
                            const SizedBox(
                              height: SpaceValues.space4,
                            ),
                            Obx(() => InputDecorator(
                              decoration: InputDecoration(
                                hintText: "Chọn Phường/ Xã",
                                contentPadding: const EdgeInsets.only(left: 5),
                                border: viewModel.validWard.isNotEmpty
                                    ? const OutlineInputBorder()
                                    : Theme.of(context)
                                    .inputDecorationTheme
                                    .errorBorder,
                                errorText: viewModel.validWard.isNotEmpty
                                    ? '  ${viewModel.validWard.value}'
                                    : null,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: viewModel.ward.value,
                                  items: viewModel.wards
                                      .map(
                                        (e) => DropdownMenuItem(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Text(e.name ?? 'Chọn Phường/ Xã'),
                                      ),
                                      value: e.code ?? '',
                                    ),
                                  )
                                      .toList(),
                                  onChanged: viewModel.wards.length > 1
                                      ? (value) {
                                    viewModel.ward.value = value;
                                  }
                                      : null,
                                ),
                              ),
                            )),
                            const SizedBox(
                              height: SpaceValues.space16,
                            ),
                            GlobalInputFormWidget(
                              controller: viewModel.address,
                              title: 'Địa chỉ cụ thể',
                              hint: 'Số nhà, tên đường(Thôn, xóm)...',
                              textInputType: TextInputType.name,
                              requireInput: '',
                              suffixIcon: const Icon(
                                Icons.drive_file_rename_outline,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: UIColors.white,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xB2000000), minimumSize: const Size(0, 48)),
                onPressed: () {
                  // viewModel.updateProfile();
                },
                child: const Text(
                  "Cập nhật thông tin",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            //   child: InkWell(
            //     onTap: () => Get.to(ChangePasswordScreen(
            //       pass: viewModel.dataUser.value?.data?.password,
            //     )),
            //     child: Container(
            //       padding: const EdgeInsets.all(12),
            //       width: double.infinity,
            //       decoration: BoxDecoration(
            //           border: Border.all(color: Color(0xB2000000)),
            //           borderRadius: BorderRadius.circular(8)),
            //       child: const Text(
            //         "Thay đổi mật khẩu",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             fontSize: 16,
            //             color: Color(0xB2000000),
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  SettingProfileModel createViewModel() => getIt<SettingProfileModel>();
}
