import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/cart/cart.dart';
import 'package:idp_gift_app/src/modules/productwidget/category_widget.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

import '../../../../config/assets/image_asset.dart';
import 'list_product_model.dart';

class LofGiftProductExchangeScreen extends StatefulWidget {
  final int categoryId;
  const LofGiftProductExchangeScreen({Key? key, required this.categoryId}) : super(key: key);
  @override
  State<LofGiftProductExchangeScreen> createState() => _LofGiftProductExchangeScreenState();
}

class _LofGiftProductExchangeScreenState extends ViewWidget<LofGiftProductExchangeScreen,ListProductModel> {
  @override
  void initState() {
    super.initState();
    // viewModel.categoryId.value = widget.categoryId;
    viewModel.getAllCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(()=>SizedBox(
                  // margin: const EdgeInsets.only(left: 5),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                      ),
                      shrinkWrap: true,
                      itemCount: viewModel.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CategoryWidget(
                          idCategory: viewModel.categories[index].id.toString(),
                          title: viewModel.categories[index].name ?? '',
                          avatar: viewModel.categories[index].imageUrl ?? '',
                        );
                      },
                    )
                ),),
              ],
            ),
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
                Text('Giỏ quà',style: TextStyle(
                    fontSize: 9,
                    color: Colors.white,

                ),),
              ],
            ),

          ),
        )

    );
  }

  @override
  ListProductModel createViewModel() => getIt<ListProductModel>();
}
