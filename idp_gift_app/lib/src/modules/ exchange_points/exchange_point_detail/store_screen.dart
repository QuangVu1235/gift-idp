import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/gift_exchange_points_response.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/%20exchange_points/exchange_point_detail/exchange_point_detail_model.dart';
import 'package:idp_gift_app/src/modules/cart/cart_kun.dart';
import 'package:idp_gift_app/src/modules/cart/cart_lof.dart';
import 'package:idp_gift_app/src/modules/productwidget/product_widget.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/AppUtils.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

class StoreScreen extends StatefulWidget {
  final String title;
  final String code;

  const StoreScreen({Key? key, required this.title, required this.code}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>_StoreScreen();
}
class _StoreScreen extends ViewWidget<StoreScreen,ExChangePointsDetailModel>{
  @override
  void initState() {
    super.initState();
    viewModel.exChangePointCode.value = widget.code;
    viewModel.getAllProductInGiftExchangePoints();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
           backgroundColor: UIColors.white,
           title: Text(widget.title),
         ),
        body: Container(
          margin: EdgeInsets.only(top: 1),
          padding: EdgeInsets.fromLTRB(16, 20, 16,0),
          color: UIColors.white,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(14),
                  prefixIconConstraints: const BoxConstraints.expand(
                      height: SpaceValues.space16, width: SpaceValues.space32),
                  border: InputBorder.none,
                  hintText: 'Tìm kiếm sản phẩm quà tặng...',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: UIColors.fontGray),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: UIColors.black10),
                    borderRadius: BorderRadius.circular(SpaceValues.space8),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                      maxHeight: SpaceValues.space24, minWidth: 0),
                  suffixIcon: InkWell(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(IconAssets.search,
                            color: UIColors.fontGray),
                        const SizedBox(
                          width: SpaceValues.space16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: SpaceValues.space12,),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: UIColors.greenKun
                    ),
                    onPressed: () {

                    },
                    child: Text(
                        'Quà kun'
                    ),
                  ),
                  SizedBox(width: SpaceValues.space8,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: UIColors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: UIColors.red
                        ),
                        borderRadius: BorderRadius.circular(5)
                      )

                    ),
                    onPressed: () { Get.to(()=> CartLofScreen()); },
                    child: Text(
                        'Quà Lof',
                      style: TextStyle(
                        color: UIColors.red
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SpaceValues.space12,),
              Expanded(
                // margin: const EdgeInsets.only(left: 5),
                  child: ListView(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductWidget(
                            productId:  0,
                            title: '',
                            avatar:  '',
                            qrCode: SvgImageAssets.qrgift,
                            quantity: '20',
                            card:  [''],
                          );
                        },
                      ),
                    ],

                  )
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
            height: 64,
            width: 64,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=> CreateChangePointCart());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(130.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(SvgImageAssets.cartIDP,color: UIColors.white,height: 20,),
                  SizedBox(height: 2,),
                  Text('Giỏ quà',style: TextStyle(fontSize: 9,color: Colors.white),),
                ],
              ),

            ),
          )
      );
  }

  @override
  ExChangePointsDetailModel createViewModel() => getIt<ExChangePointsDetailModel>();

}