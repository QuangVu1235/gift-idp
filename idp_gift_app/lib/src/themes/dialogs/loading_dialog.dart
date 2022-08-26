import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/LoadingWidget.dart';

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
    this.message = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: UIColors.black10,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (message.isEmpty)
                const StaggeredDotsWave(size: 45, color: UIColors.white),
              if (message.isNotEmpty)
                const StaggeredDotsWave(size: 45, color: UIColors.brandA),
              if (message.isNotEmpty)
                Text(
                  message,
                  style: const TextStyle(fontSize: 16, color: UIColors.brandA),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      );
  // => AlertDialog(
  //   backgroundColor: backgroundColor,
  //   insetPadding: insetPadding ?? const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
  //   title: SizedBox(
  //     height: height,
  //     width: width,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         // if(message.isEmpty)
  //         //   const StaggeredDotsWave(size: 25, color: UIColors.white),
  //         const StaggeredDotsWave(size: 25, color: UIColors.brandA),
  //         if(message.isNotEmpty)
  //           Text(message, style: const TextStyle(fontSize: 16, color: UIColors.brandA), textAlign: TextAlign.center,),
  //       ],
  //     ),
  //   ),
  //   elevation: elevation,
  // );
}
