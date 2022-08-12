import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';

@injectable
class FormPassModel extends ViewModel {
  String? title;
  String? hint;
  TextEditingController? passtxt;
  RxBool isShowPass = true.obs;
  onShowPass() {
    isShowPass.value = !isShowPass.value;
  }
}
