import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/modules/order_manager/detal_order_manager/app/detail_order_screen.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({
    Key? key,
    this.productID = '',
    this.type = '',
    this.status = '',
    this.creator = '',
    this.date_created = '',
    this.address = '',
    this.width = 335,
    this.height = 100,
    this.image = '',
    this.quantity = '',
  }) : super(key: key);
  final String productID;
  final String type;
  final String status;
  final String creator;
  final String date_created;
  final String address;
  final double width;
  final double height;
  final String image;
  final String quantity;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  String? _herotag;
  String get herotag {
    _herotag ??= '${widget.productID.toString()}${Random().nextDouble()}';
    return _herotag!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: GlobalImage(widget.image),
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productID,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 4, bottom: 4),
                              child: Text(
                                widget.status,
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: SpaceValues.space6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Loại đơn:",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: UIColors.black70
                        ),
                      ),
                      Text(
                        widget.type,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SpaceValues.space6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Người tạo",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: UIColors.black70
                        ),
                      ),
                      Text(
                        widget.creator,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SpaceValues.space6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ngày tạo",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: UIColors.black70
                        ),
                      ),
                      Text(
                        widget.date_created,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SpaceValues.space6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nhận tại",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: UIColors.black70),
                      ),
                      Text(
                        widget.address,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: SpaceValues.space6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Số lượng sản phẩm",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400,
                            color: UIColors.black70),
                      ),
                      Text(
                        widget.quantity,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
