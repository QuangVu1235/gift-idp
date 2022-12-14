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
                            color:   widget.status == 'NEW' ? Colors.yellow[50] :
                            widget.status == 'APPROVED' ? Colors.blue[50]:
                            widget.status == 'COMPLETED' ? Colors.green[50] : Colors.yellow[50],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 4, bottom: 4),
                              child:
                              Text(
                                widget.status == 'NEW' ? 'Ch??? x??c nh???n' :
                                widget.status == 'APPROVED' ? '???? x??c nh???n':
                                widget.status == 'COMPLETED' ? '???? ho??n th??nh' : '',
                                style: TextStyle(
                                    color:
                                    widget.status == 'NEW' ? Colors.yellow[700] :
                                    widget.status == 'APPROVED' ? Colors.blue[700]:
                                    widget.status == 'COMPLETED' ? Colors.green[700] : Colors.yellow[700],
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
                        "Lo???i ????n:",
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
                        "Ng?????i t???o",
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
                        "Ng??y t???o",
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
                        "Nh???n t???i",
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
                        "S??? l?????ng s???n ph???m",
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
