import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/modules_store/cart_advance/cart_advance_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/ware_house/wave_order_manager/wave_order_manager_screen.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class TabWareHouse2 extends StatelessWidget {
  const TabWareHouse2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UIColors.white,
        child: ListView.builder(
          itemCount: 3,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(WaveOrderManagerScreen());
                },
                child: Card(
                  margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.3,
                            child: Image.asset(ImageAssets.watchKun,fit: BoxFit.cover,)),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('#122222',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Padding(
                                        padding:  EdgeInsets.only(
                                            left: 10, right: 10, top: 4, bottom: 4),
                                        child: Text('Đã xác nhận'),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 6,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Loại đơn'),
                                    Text('Tạm ứng'),
                                  ],
                                ),
                                SizedBox(height: 6,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Ngày tạo'),
                                    Text('10:30 - 28/05/2022'),
                                  ],
                                ),
                                SizedBox(height: 6,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Người tạo'),
                                    Text('Cửa hàng Thị Huệ'),
                                  ],
                                ),
                                SizedBox(height: 6,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Số lượng sản phẩm'),
                                    Text('100'),
                                  ],
                                ),
                              ],
                            )
                        ),
                        SizedBox(width: 8,)
                      ],
                    ),
                  ),
                ),
              );
            },),
      ),
        floatingActionButton: SizedBox(
          height: 64,
          width: 64,
          child: ElevatedButton(
            onPressed: () {
              Get.to(()=> CartAdvanceScreen());
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
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text('Tạo đơn tạm ứng',style: TextStyle(fontSize: 10,color: Colors.white),),
                ),
              ],
            ),

          ),
        )
    );
  }
}
