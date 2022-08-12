import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class GlobalInputFormWidget extends StatefulWidget {
  GlobalInputFormWidget({
    Key? key,
    this.title,
    this.hint,
    this.security = false,
    this.controller,
    this.textInputType,
    this.validator,
    this.autovalidateMode,
    this.requireInput = '*',
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.inputFormatters,
    this.onSubmit,
    this.enabled,
  }) : super(key: key);

  final Widget? prefixIcon;
  Widget? suffixIcon;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final TextInputType? textInputType;
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  bool security;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalidateMode;
  final String requireInput;
  final int maxLines;
  final int minLines;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onSubmit;
  final bool? enabled;

  @override
  State<GlobalInputFormWidget> createState() => _GlobalInputFormWidgetState();
}

class _GlobalInputFormWidgetState extends State<GlobalInputFormWidget> {

  bool secure = false;

  @override
  void initState() {
    super.initState();
    if (widget.security) {
      if (widget.suffixIcon == null) {
        secure = true;
      }
      widget.suffixIcon ??= TextButton(
        onPressed: () {
          setState(() {
            widget.security = !widget.security;
          });
        },
        child: Visibility(
          visible: widget.security,
          child: const Icon(Icons.visibility, color: UIColors.brandA,),
          replacement: const Icon(Icons.visibility_off, color: UIColors.brandA,),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (secure) {
      widget.suffixIcon = TextButton(
        onPressed: () {
          setState(() {
            widget.security = !widget.security;
          });
        },
        child: Visibility(
          visible: widget.security,
          child: const Icon(Icons.visibility, color: UIColors.brandA,),
          replacement: const Icon(Icons.visibility_off, color: UIColors.brandA,),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: '${widget.title ?? ''}${widget.requireInput}'.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: widget.title ?? '',
                  style: Theme.of(context).textTheme.headline6,
                  children: [
                    TextSpan(
                      text: ' ${widget.requireInput}',
                      style: const TextStyle(color: UIColors.error80),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: SpaceValues.space8,
              ),
            ],
          ),
        ),
        TextFormField(
          autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          obscureText: widget.security,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintText: widget.hint ?? '',
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
              color: UIColors.brandA,
              width: 1.0,
            ),
          ),
          ),
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          validator: widget.validator,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          onChanged: widget.onChanged,
          cursorColor: UIColors.brandA,
          inputFormatters: widget.inputFormatters 
              ?? (TextInputType.phone == widget.textInputType ? [LengthLimitingTextInputFormatter(10)] : null),
          onFieldSubmitted: widget.onSubmit,
        ),
      ],
    );
  }
}

class Validator {
  static String? emailCanEmpty(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return null;
    }
    return email(valueDy);
  }

  static String? productName(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập tên sản phẩm';
    }
  }

  static String? bank(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập số tài khoản ngân hàng';
    }
  }

  static String? bankName(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập họ tên chủ tài khoản ngân hàng';
    }
  }

  static String? address(valueDy) {
    String value = valueDy;
    if (value.isEmpty) {
      return 'Vui lòng nhập địa chỉ cụ thể';
    }
  }

  static String? idCard(valueDy) {
    String value = valueDy;
    if (value.isEmpty) {
      return 'Vui lòng nhập số CMND/ CCCD';
    }
    if (value.length != 9 && value.length != 12) {
      return 'Vui lòng nhập đủ 9 hoặc 12 số CMND/ CCCD';
    }
  }

  static String? email(valueDy) {
    String value = valueDy;
    if (value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    if (!RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(value)) {
      return 'Vui lòng nhập đúng email';
    }
  }

  static String? birthday(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng chọn ngày sinh';
    }
    if (!RegExp(r'\d{4}.\d{2}.\d{2}').hasMatch(value)) {
      return 'Vui lòng nhập ngày theo định dạng "yyyy-MM-dd"';
    }
  }

  static String? birthdayVn(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng chọn ngày sinh';
    }
    if (!RegExp(r'\d{2}.\d{2}.\d{4}').hasMatch(value)) {
      return 'Vui lòng nhập ngày theo định dạng "dd/MM/yyyy"';
    }
  }

  static String? birthdayVnCanEmpty(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return null;
    }
    if (!RegExp(r'\d{2}.\d{2}.\d{4}').hasMatch(value)) {
      return 'Vui lòng nhập ngày theo định dạng "dd/MM/yyyy"';
    }
  }

  static String? referralCode(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập mã người giới thiệu';
    }
  }

  static String? fullname(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập họ và tên';
    }
    if (!RegExp(r'\w+').hasMatch(value)) {
      return 'Vui lòng nhập đúng họ và tên';
    }
  }
  static String? describe(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập mô tả chi tiết';
    }
  }
  static String? phone(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập số điện thoại Việt Nam';
    }
    if (value.trim().length != 10) {
      return 'Vui lòng nhập đúng 10 số điện thoại';
    }
    if (!RegExp(r'^0?[3|5|7|8|9][0-9]{8}$')
        .hasMatch(value)) {
      return 'Vui lòng nhập đúng số điện thoại Việt Nam';
    }
  }

  static String? password(valueDy) {
    String value = valueDy ?? '';
    if (value.length < 8) {
      return 'Vui lòng nhập mật khẩu ít nhất 8 ký tự';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Vui lòng nhập ít nhất 1 ký tự thường';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Vui lòng nhập ít nhất 1 ký tự in hoa';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Vui lòng nhập ít nhất 1 số từ 0 đến 9';
    }
    if (!RegExp(r'[!"#$%&'"'"'()*+,-./:;<=>?@[\\]^_`{|}~]').hasMatch(value)) {
      return 'Vui lòng nhập ít nhất 1 ký tự đặc biệt';
    }
  }

  static String? passwordEasy(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng nhập mật khẩu!';
    }
    return null;
  }

  static String? rePassword(valueDy, String rePassword) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui lòng xác nhận lại mật khẩu';
    }
    if (value != rePassword) {
      return 'Mật khẩu xác nhận không khớp';
    }
  }
}
