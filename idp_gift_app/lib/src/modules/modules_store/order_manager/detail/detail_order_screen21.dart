import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/order_manager/widget/detail_order_widget.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class DetailOrderScreen2 extends StatefulWidget {
  const DetailOrderScreen2({Key? key}) : super(key: key);

  @override
  State<DetailOrderScreen2> createState() => _DetailOrderScreen2State();
}

class _DetailOrderScreen2State extends State<DetailOrderScreen2> {
  final List<String> entries = <String>['A', 'B',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      child: Text('Đơn hàng điểm đổi quà',
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
                      SvgPicture.asset(
                        IconAssets.shipping,
                        // color: UIColors.white,
                      ),
                      const Expanded(
                        child: Divider(
                          height: 2,
                          color: UIColors.brandA,
                        ),
                      ),
                      SvgPicture.asset(
                        IconAssets.shipping,
                        // color:UIColors.white,
                      ),
                      const Expanded(
                        child: Divider(
                          height: 2,
                          color: UIColors.brandA,
                        ),
                      ),
                      SvgPicture.asset(
                        IconAssets.shipping,
                        // color: UIColors.brandA ,
                        // height: 5,
                      ),
                      const SizedBox(width: SpaceValues.space48,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      // const SizedBox(width: SpaceValues.space32,),
                      Spacer(flex: 1,),
                      Text(
                        "Chờ xác nhận",
                        style: TextStyle(fontSize: 12),
                      ),
                      // const SizedBox(width: SpaceValues.space24,),
                      Spacer(flex: 1,),
                      Text(
                        "Đã xác nhận",
                        style: TextStyle(fontSize: 12),
                      ),
                      Spacer(flex: 1,),
                      // const SizedBox(width: 24,),
                      Text(
                        "Hoàn thành",
                        style: TextStyle(fontSize: 12),
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
            const SizedBox(height: SpaceValues.space16,),

            SizedBox(
              child: Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:  (context, int index){
                      return DetailWidget(
                          productID:entries[index],
                          image:ImageAssets.imggiftproduct,
                          name:'Bình dữ nhiệt KUN',
                          quantity:'2',
                          size:'XL',
                          color:'Xanh',
                          price:'24'
                      );
                    },
                    separatorBuilder:(context, index) => const SizedBox(height: 10,),
                    itemCount: entries.length),
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
                      children: const [
                        Text('Ngày tạo đơn'),
                        Text('15/05/2022 11:29'),
                      ],
                    ),
                    SizedBox(height: SpaceValues.space12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Người nhận'),
                        Text('Lâm Thu Đang'),
                      ],
                    ),
                    SizedBox(height: SpaceValues.space12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Số điện thoại'),
                        Text('0398 975 708'),
                      ],
                    ),
                    SizedBox(height: SpaceValues.space12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Địa chỉ:'),
                        SizedBox(width: SpaceValues.space32,),
                        Expanded
                          (child: Text(
                          'dsd, Phường Thạnh Xuân, Quận 12, Thành phố Hồ Chí Minh',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.store,color: UIColors.black,),
                        SizedBox(width: 8,),
                        Expanded
                          (child: Text(
                          '17A, Trường Chinh, Quận 12, TP.HCM',
                          textAlign: TextAlign.end,
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
                    // Get.to(DetailOrderScreenFinal());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Đã giao hàng'),
                  ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
