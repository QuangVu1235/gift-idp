import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class LoadingDialog extends StatelessWidget {
  final double? elevation;
  final double height;
  final double? width;
  final EdgeInsets? insetPadding;
  final Color? backgroundColor;
  final String message;
  const LoadingDialog({
    Key? key,
    this.elevation,
    this.height = 96,
    this.width,
    this.insetPadding,
    this.backgroundColor,
    this.message = 'Vui lòng chờ...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context)
  => AlertDialog(
    backgroundColor: backgroundColor,
    insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    title: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircularProgressIndicator(
            color: UIColors.title70,
            backgroundColor: UIColors.border10,
          ),
          if(message.isNotEmpty)
            Text(message, style: const TextStyle(fontSize: 16, color: UIColors.brandA), textAlign: TextAlign.center,),
        ],
      ),
    ),
    elevation: elevation,
  );
}
