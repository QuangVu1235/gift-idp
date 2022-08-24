import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/cart/cart_kun.dart';
import 'package:idp_gift_app/src/modules/modules_store/%20create_gift_order/lof_order/create_gift_lof_order_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

class CreateGiftOrder extends StatefulWidget{
  const CreateGiftOrder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateGiftOrder();

}
class _CreateGiftOrder extends ViewWidget<CreateGiftOrder,CreateGiftOrderModel>  {
    final List<String> title= <String>['Tất cả','Áo gia đình', 'Áo cặp','Gối yêu thương'];
    final List<String> nameProduct= <String>['Bộ 04 áo gia đình LOF (1 thẻ hạnh phúc)','Bộ 04 áo gia đình LOF (1 thẻ hạnh phúc)', 'Bộ 04 áo gia đình LOF (1 thẻ hạnh phúc)','Bộ 04 áo gia đình LOF (1 thẻ hạnh phúc)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        appBar: AppBar(
          backgroundColor: UIColors.white,
          title: const Text('Danh sách quà LOF', style: TextStyle(color: UIColors.black,fontWeight: FontWeight.w700),),
          shape: const Border(bottom: BorderSide(color: UIColors.black10)),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12,right: 12,top: 8),
          child: Column(
            children: [
              TextField(
                  controller: viewModel.inPutSearch,
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
                        // viewModel.getAllGiftExchangePoints(viewModel.inPutSearch.text);
                        // FocusScopeNode currentFocus = FocusScope.of(context);
                        // if (!currentFocus.hasPrimaryFocus) {
                        //   currentFocus.unfocus();
                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(IconAssets.search,
                              color: UIColors.fontGray),
                          const SizedBox(
                            width: 14,
                          ),
                          SvgPicture.asset(IconAssets.Filter,
                              color: UIColors.fontGray),
                          const SizedBox(
                            width: SpaceValues.space16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    // print(value);
                    // viewModel.getAllGiftExchangePoints(value);
                  }
              ),
              SizedBox(height: 12,),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.065,
                child: ListView.builder(
                  itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shadowColor: UIColors.white,
                              primary: UIColors.white,
                              side: BorderSide(color: UIColors.blue)
                            ),
                            child: Text(title[index],style: TextStyle(color: UIColors.blue),)),
                      );
                    },),
              ),
                Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(left: 12,right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: UIColors.black10
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height:120,
                                  child: Image.asset(ImageAssets.watchKun,fit: BoxFit.fill,)),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('#1234',style: TextStyle(color: UIColors.black,fontWeight: FontWeight.w600),),
                                      Text(nameProduct[index],style: TextStyle(color: UIColors.black,fontWeight: FontWeight.w600)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Số lượng còn:'),
                                          Text('20'),
                                        ],
                                      ),
                                      SizedBox(height: 4,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.08,
                                              child: Image.asset(ImageAssets.qrCode)),
                                          ElevatedButton(
                                              onPressed: (){},
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 12.0,right: 12),
                                                child: Text('Đổi ngay'),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    );
                  },),
              )
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 64,
          width: 64,
          child: ElevatedButton(
            onPressed: () {
              // Get.to(()=> CreateChangePointCart());
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
  CreateGiftOrderModel createViewModel() => getIt<CreateGiftOrderModel>();

}