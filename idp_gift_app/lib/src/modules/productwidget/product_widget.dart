import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/modules/productwidget/product_widget_model.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
import '../../themes/space_values.dart';
import '../../themes/ui_colors.dart';


class ProductWidget extends StatefulWidget {

  const ProductWidget({
    Key? key,
    required this.productId,
    this.title = '',
    required this.card,
    this.priceOrigin = '',
    this.price = '',
    this.avatar = '',
    this.promotion = '',
    this.isCanBuy = true,
    this.qrCode = '',
    this.width = 180,
    this.height = 270,
    this.quantity='',
  }) : super(key: key);

  final int productId;
  final String avatar;
  final String title;
  final List<String> card;
  final String promotion;
  final String priceOrigin;
  final String price;
  final String quantity;
  final bool isCanBuy;
  final double width;
  final double height;
  final String qrCode;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ViewWidget<ProductWidget,ProductWidgetModel> {

  String? _herotag;
  String get herotag {
    _herotag ??= '${widget.productId.toString()}${Random().nextDouble()}';
    return _herotag!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: MediaQuery.of(context).size.height*0.25,
      child: InkWell(
        onTap: () {
          // Get.to(ProductDetail(
          //   idProduct: widget.productId,
          //   heroTag: herotag,
          // ));
        },
        child: Card(
          elevation: 0.0,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Padding(
            padding:  EdgeInsets.all(SpaceValues.space8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: herotag,
                          child: GlobalImage(
                            widget.avatar,
                            width: 270,
                            height: 270,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Visibility(
                      //     visible: ('' != widget.promotion) && '0%' != widget.promotion.replaceAll(' ', ''),
                      //     child: Card(
                      //       elevation: 0,
                      //       shape: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(4),
                      //         borderSide: BorderSide.none,
                      //       ),
                      //       color: UIColors.brandA,
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(4.0),
                      //         child: Text(
                      //           widget.promotion,
                      //           style: const TextStyle(
                      //             color: UIColors.white,
                      //             fontSize: 10,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: SvgPicture.asset(
                            widget.qrCode
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SpaceValues.space8),
                Text(
                  widget.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: UIColors.title, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: SpaceValues.space4),
                for(var i = 0; i < widget.card.length; i++)
                Row(
                  children: [
                    Text(
                      widget.card[i],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: UIColors.title, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: SpaceValues.space4),
                // Text(
                //   widget.priceOrigin,
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                //   style: const TextStyle(fontSize: 12, color: UIColors.title, decoration: TextDecoration.lineThrough),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Số lượng còn",style:TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,),),
                    Text(widget.quantity,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ) ,),
                  ],
                ),
                // RichText(
                //   text: TextSpan(
                //     text: 'Số lượng còn  ',
                //     style:
                //     const TextStyle(fontSize: 10, color: UIColors.title70),
                //     children: <TextSpan>[
                //       TextSpan(
                //           text: widget.quantity.replaceAll(',', '.'),
                //           style: const TextStyle(
                //               fontWeight: FontWeight.w700,
                //               fontSize: 12,
                //               color: UIColors.title)),
                //     ],
                //   ),
                // ),
                 SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 26,
                  child: Visibility(
                    visible: widget.isCanBuy,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 12,
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: (){

                            },
                            child: const Text(
                              'Đổi ngay',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: SpaceValues.space8,
                        ),
                        InkWell(
                          onTap: () {
                            viewModel.addToCart(widget.productId);
                          },
                          child: Container(
                            height: 30,
                            alignment: Alignment.center,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: Colors.blue, //                   <--- border color
                                  width: 1.0,
                                )),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.blue,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    replacement: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 12,
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: null,
                            child: const Text(
                              'Hết hàng',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProductWidgetModel createViewModel() => getIt<ProductWidgetModel>();

}

