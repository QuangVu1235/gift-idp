import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/modules/productdetail/product_detail_screen.dart';
import 'package:idp_gift_app/src/modules/productwidget/category_model.dart';
import 'package:idp_gift_app/src/modules/productwidget/product_widget_model.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
import '../../themes/space_values.dart';
import '../../themes/ui_colors.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget(
      {Key? key,
      required this.idCategory,
      this.title = '',
      this.avatar = '',
      this.width = 180,
      this.height = 270,
      this.gitExchangePointsResp})
      : super(key: key);

  final String idCategory;
  final String avatar;
  final String title;
  final double width;
  final double height;
  final GitExchangePointsResp? gitExchangePointsResp;

  @override
  State<CategoryWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState
    extends ViewWidget<CategoryWidget, CategoryWidgetModel> {
  String? _herotag;
  String get herotag {
    _herotag ??= '${widget.idCategory.toString()}${Random().nextDouble()}';
    return _herotag!;
  }

  @override
  void initState() {
    super.initState();
    viewModel.gitExchangePointsResp.value = widget.gitExchangePointsResp;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // elevation: 0.0,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: EdgeInsets.all(SpaceValues.space8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
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
              const SizedBox(height: SpaceValues.space8),
              Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    color: UIColors.title,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: SpaceValues.space4),
              ElevatedButton(
                  onPressed: () {
                    Get.to(ProductDetail(
                      title: 'Bình nước',
                      idCategory: widget.idCategory,
                      heroTag: herotag,
                      distributorCode: widget.gitExchangePointsResp?.code ?? '',
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 1.5, color: Color(0xff086252)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Color(0xffDBF6FF)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 3),
                    child: Text(
                      "ĐỔI NGAY",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff086252)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CategoryWidgetModel createViewModel() => getIt<CategoryWidgetModel>();
}
