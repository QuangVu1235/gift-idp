import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/order_manager/detal_order_manager/app/detail_order_model.dart';
import 'package:idp_gift_app/src/modules/order_manager/widget/detail_order_widget.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

class DetailOrderScreen extends StatefulWidget {
  final OrderResponse orderResponse;
  const DetailOrderScreen({Key? key,  required this.orderResponse}) : super(key: key);

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends ViewWidget<DetailOrderScreen,DetailOrderModel> {

  final List<String> entries = <String>['A', 'B',];
  @override
  void initState() {
    super.initState();
    viewModel.orderResponse.value = widget.orderResponse;
    viewModel.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.orderResponse.value?.code ?? ''),
        elevation: 0.0,
        backgroundColor: UIColors.white,
      ),

      body: Container(
        margin: EdgeInsets.only(top: 1),
        padding: EdgeInsets.all(20),
        color: UIColors.white,
        child: ListView(
          children: [
            Text('Loại đơn quà',
              style:TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: UIColors.black,
              ) ,),
            SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width*0.15,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UIColors.greenKun,
                  ),
                  child: Center(
                      child: Text('Kun',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: UIColors.white
                        ),))),
            ),
            const Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 15),
              child: Text('Hình thức tạo giỏ quà',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                ) ,),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width*0.15,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UIColors.white,
                    border: Border.all(
                      color: UIColors.black30,
                    ),
                  ),
                  child: const Center(
                      child: Text('Đơn hàng online',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: UIColors.black
                        ),))),
            ),
            const Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 15),
              child: Text('Trạng thái đơn hàng',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                ) ,),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: UIColors.black30,
                  )
              ),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: SpaceValues.space56,height: 50,),
                      Obx(() => SizedBox(
                        height: 25,
                        width: 25,
                        child: CircleAvatar(
                          backgroundColor: viewModel.index.value >= 0 ? UIColors.brandA : UIColors.dividerDark,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: viewModel.index.value > 1 ? UIColors.white : UIColors.white,
                          ),
                        ),
                      )),
                      Expanded(
                        child:Divider(height: 50, thickness: 3, color: viewModel.index.value >= 0 ? UIColors.brandA : UIColors.divider5),
                      ),
                      Obx(() => SizedBox(
                        height: 25,
                        width: 25,
                        child: CircleAvatar(
                          backgroundColor: viewModel.index.value > 0 ? UIColors.brandA : UIColors.dividerDark,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: viewModel.index.value > 1 ? UIColors.white : UIColors.white,
                          ),
                        ),
                      )),
                      Expanded(
                        child:Divider(height: 50, thickness: 3, color: viewModel.index.value > 1 ? UIColors.brandA : UIColors.dividerDark),
                      ),
                      Obx(() => SizedBox(
                        height: 25,
                        width: 25,
                        child: CircleAvatar(
                          backgroundColor: viewModel.index.value > 1 ? UIColors.brandA : UIColors.dividerDark,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: viewModel.index.value > 1 ? UIColors.white : UIColors.white,
                          ),
                        ),
                      )
                      ),
                      const SizedBox(width: SpaceValues.space48,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      // const SizedBox(width: SpaceValues.space32,),
                      Spacer(flex: 1,),
                      Text(
                        "Chờ xác nhận",
                        style: TextStyle(
                            fontSize: 12,
                            color: viewModel.index.value >= 0 ? UIColors.brandA : UIColors.black
                        ),
                      ),
                      // const SizedBox(width: SpaceValues.space24,),
                      Spacer(flex: 1),
                      Text(
                        "Đã xác nhận",
                        style: TextStyle(
                            fontSize: 12,
                            color: viewModel.index.value > 0 ? UIColors.brandA : UIColors.black
                        ),
                      ),
                      Spacer(flex: 1,),
                      // const SizedBox(width: 24,),
                      Text(
                        "Hoàn thành",
                        style: TextStyle(
                            fontSize: 12,
                            color: viewModel.index.value > 1 ? UIColors.brandA : UIColors.black

                        ),
                      ),
                      Spacer(flex: 1,),
                    ],
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 15),
              child: Text('Sản phẩm',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                ) ,),
            ),
            SizedBox(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: viewModel.orderResponse.value?.details?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:  (context, int index){
                    return DetailWidget(
                        productID: '#${viewModel.orderResponse.value?.details?[index].productId}',
                        name:'${viewModel.orderResponse.value?.details?[index].productName}',
                        image:viewModel.orderResponse.value?.details?[index].thumbnail ?? '',
                        quantity:'${viewModel.orderResponse.value?.details?[index].qty}',
                        // size:'XL',
                        // color:'Xanh',
                        price:'24'
                    );
                  },
                  separatorBuilder:(context, index) => const SizedBox(height: 10,),
                  ),
            ),
            const Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 15),
              child: Text('Thông tin đơn quà',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                ) ,),
            ),
            Container(
              child: Card(
                elevation: 0.0,
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng số thẻ quà Kun quy đổi', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text('24 thẻ', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      ),
                      SizedBox(height: SpaceValues.space12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Tổng số thẻ Kun vận động quy đổi ', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text('2 thẻ', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 15),
              child: Text('Thông tin người nhận',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                ) ,),
            ),
            Card(
              elevation: 0.0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Ngày tạo đơn'),
                        Text(
                            viewModel.orderResponse.value?.createdDate ?? ''
                        ),
                      ],
                    ),
                    SizedBox(height: SpaceValues.space12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Người nhận'),
                        Text(viewModel.orderResponse.value?.shippingAddressFullName ?? ''),
                      ],
                    ),
                    SizedBox(height: SpaceValues.space12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text('Số điện thoại'),
                        Text(viewModel.orderResponse.value?.shippingAddressPhone ?? ''),
                      ],
                    ),
                    SizedBox(height: SpaceValues.space12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Địa chỉ:'),
                        SizedBox(width: SpaceValues.space32,),
                        Expanded
                          (child: Text(
                          '${viewModel.orderResponse.value?.streetAddress}, '
                              '${viewModel.orderResponse.value?.shippingAddressWard}, '
                              '${viewModel.orderResponse.value?.shippingAddressDistrict}, '
                              '${viewModel.orderResponse.value?.shippingAddressCity}',
                          textAlign: TextAlign.end,
                          maxLines: 3, )),

                      ],
                    ),
                    const SizedBox(height: SpaceValues.space12,),
                  ],
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 15),
              child: Text('Nhận tại cửa hàng',
                style:TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: UIColors.black,
                ) ,),
            ),
            Card(
              elevation: 0.0,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hoàng Anh Shop', style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),),
                    const SizedBox(
                      height: SpaceValues.space8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Icon(Icons.store,color: UIColors.black,),
                        SizedBox(width: 8,),
                        Expanded
                          (child: Text(
                          '${viewModel.orderResponse.value?.distributorName}',
                          textAlign: TextAlign.start,
                          maxLines: 3, )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 180,),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Get.to(DetailOrderScreen2());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Đã nhận được hàng'),
                  ),),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  DetailOrderModel createViewModel() => getIt<DetailOrderModel>();
}
