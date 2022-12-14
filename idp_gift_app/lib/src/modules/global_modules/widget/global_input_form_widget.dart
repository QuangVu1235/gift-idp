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
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
              color: UIColors.black40,
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
      return 'Vui l??ng nh???p t??n s???n ph???m';
    }
  }

  static String? bank(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p s??? t??i kho???n ng??n h??ng';
    }
  }

  static String? bankName(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p h??? t??n ch??? t??i kho???n ng??n h??ng';
    }
  }

  static String? address(valueDy) {
    String value = valueDy;
    if (value.isEmpty) {
      return 'Vui l??ng nh???p ?????a ch??? c??? th???';
    }
  }

  static String? idCard(valueDy) {
    String value = valueDy;
    if (value.isEmpty) {
      return 'Vui l??ng nh???p s??? CMND/ CCCD';
    }
    if (value.length != 9 && value.length != 12) {
      return 'Vui l??ng nh???p ????? 9 ho???c 12 s??? CMND/ CCCD';
    }
  }

  static String? email(valueDy) {
    String value = valueDy;
    if (value.isEmpty) {
      return 'Vui l??ng nh???p email';
    }
    if (!RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(value)) {
      return 'Vui l??ng nh???p ????ng email';
    }
  }

  static String? birthday(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng ch???n ng??y sinh';
    }
    if (!RegExp(r'\d{4}.\d{2}.\d{2}').hasMatch(value)) {
      return 'Vui l??ng nh???p ng??y theo ?????nh d???ng "yyyy-MM-dd"';
    }
  }

  static String? birthdayVn(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng ch???n ng??y sinh';
    }
    if (!RegExp(r'\d{2}.\d{2}.\d{4}').hasMatch(value)) {
      return 'Vui l??ng nh???p ng??y theo ?????nh d???ng "dd/MM/yyyy"';
    }
  }

  static String? birthdayVnCanEmpty(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return null;
    }
    if (!RegExp(r'\d{2}.\d{2}.\d{4}').hasMatch(value)) {
      return 'Vui l??ng nh???p ng??y theo ?????nh d???ng "dd/MM/yyyy"';
    }
  }

  static String? referralCode(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p m?? ng?????i gi???i thi???u';
    }
  }

  static String? fullname(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p h??? v?? t??n';
    }
    if (!RegExp(r'\w+').hasMatch(value)) {
      return 'Vui l??ng nh???p ????ng h??? v?? t??n';
    }
  }
  static String? describe(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p m?? t??? chi ti???t';
    }
  }
  static String? phone(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p s??? ??i???n tho???i Vi???t Nam';
    }
    if (value.trim().length != 10) {
      return 'Vui l??ng nh???p ????ng 10 s??? ??i???n tho???i';
    }
    if (!RegExp(r'^0?[3|5|7|8|9][0-9]{8}$')
        .hasMatch(value)) {
      return 'Vui l??ng nh???p ????ng s??? ??i???n tho???i Vi???t Nam';
    }
  }

  static String? password(valueDy) {
    String value = valueDy ?? '';
    if (value.length < 8) {
      return 'Vui l??ng nh???p m???t kh???u ??t nh???t 8 k?? t???';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Vui l??ng nh???p ??t nh???t 1 k?? t??? th?????ng';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Vui l??ng nh???p ??t nh???t 1 k?? t??? in hoa';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Vui l??ng nh???p ??t nh???t 1 s??? t??? 0 ?????n 9';
    }
    if (!RegExp(r'[!"#$%&'"'"'()*+,-./:;<=>?@[\\]^_`{|}~]').hasMatch(value)) {
      return 'Vui l??ng nh???p ??t nh???t 1 k?? t??? ?????c bi???t';
    }
  }

  static String? passwordEasy(valueDy) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng nh???p m???t kh???u!';
    }
    return null;
  }

  static String? rePassword(valueDy, String rePassword) {
    String value = valueDy ?? '';
    if (value.isEmpty) {
      return 'Vui l??ng x??c nh???n l???i m???t kh???u';
    }
    if (value != rePassword) {
      return 'M???t kh???u x??c nh???n kh??ng kh???p';
    }
  }
}
