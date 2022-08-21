import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:idp_gift_app/src/apis/idp/kun/response/kun_response.dart';
import 'package:idp_gift_app/src/apis/response/address/user_address_response.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/cart/cart_model.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

import '../../config/assets/icon_assets.dart';

class CreateChangePointCart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CreateChangePointCart();

}
class _CreateChangePointCart extends ViewWidget<CreateChangePointCart, CartModel>{
  String sizeItem = 'Size';
  var sizes = [
    'Size',
    'Item 1',
  ];
  String color = 'Màu';
  var colors = [
    'Màu',
    'Item 1',
  ];
  String design = 'Kiểu dáng';
  var designs = [
    'Kiểu dáng',
    'Item',
  ];
  final List<String> entries = <String>[ImageAssets.watchKun, ImageAssets.waterKun];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Tạo giỏ quà Kun'),
         backgroundColor: UIColors.white  ,
       ),
      body: Container(
        margin: const EdgeInsets.only(top: 1),
        color: UIColors.white,
        child: Column(
          children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: ListView(
                    children: [
                      Obx(
                            ()=> ListView.separated(
                              shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.dataCart.value?.details?.length ?? 0,
                                itemBuilder: (context, int index) {
                                  return Card(
                                    elevation: 0.0,
                                    margin: EdgeInsets.zero,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: GlobalImage(
                                                viewModel.dataCart.value?.details?[index].productThumb ?? '',
                                                height: 90,
                                                width: 90),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,10,10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:  [
                                                Text(
                                                  '#${viewModel.dataCart.value?.details?[index].productId.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700
                                                  ),
                                                ),
                                                const SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        viewModel.dataCart.value?.details?[index].productName ?? '',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 100,),
                                                    SizedBox(
                                                      width: 24,
                                                      height: 24,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          onSurface: Colors.red,
                                                          minimumSize: Size.zero, // Set this
                                                          padding: EdgeInsets.zero, // and this
                                                          primary: UIColors.white,
                                                          elevation: 0.0,
                                                        ),
                                                        onPressed: () async{
                                                          await viewModel.deleteCart(viewModel.dataCart.value?.details?[index].id.toString() ?? '');
                                                        },
                                                        child: SvgPicture.asset(SvgImageAssets.trash,height: 20),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10,),
                                                Row(
                                                  children:  [
                                                    Text(
                                                      'Số lượng hiện có: ',
                                                      style: TextStyle(
                                                          color: UIColors.red,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          fontStyle: FontStyle.italic
                                                      ),
                                                    ),
                                                    Text(
                                                        '0',
                                                      // viewModel.productResp.value?.qty.toString() ?? '0',
                                                      style: TextStyle(
                                                          color: UIColors.red,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                          fontStyle: FontStyle.italic
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Số lượng chọn: ',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,

                                                      ),
                                                    ),
                                                    Expanded(child: const SizedBox()),
                                                    SizedBox(
                                                      height: 30 ,
                                                      width: 30,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize: Size.zero, // Set this
                                                            padding: EdgeInsets.zero, // and this
                                                            primary: UIColors.white,
                                                            elevation: 0.0,
                                                            shadowColor: Colors.transparent,
                                                            shape:   RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft:Radius.circular(7)),
                                                                side: BorderSide(color: UIColors.black10,width: 1)
                                                            )
                                                        ),
                                                        onPressed: () async{
                                                          await viewModel.updateQuantityOrCode(viewModel.dataCart.value?.details?[index].id.toString() ?? '',
                                                              (viewModel.dataCart.value?.details?[index].quantity ?? 0 ) - 1,
                                                              viewModel.cartInfoCode[index].code
                                                          );
                                                          viewModel.refresh();
                                                        },
                                                        child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
                                                      ),
                                                    ),
                                                    Obx(()=>Container(
                                                      height: 30,
                                                      decoration: const BoxDecoration(
                                                          border: Border.symmetric(
                                                              horizontal:
                                                              BorderSide(
                                                                color: UIColors.black10,
                                                                width: 1,
                                                              ))
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.only(left: 15,right: 15),
                                                        child: Center(
                                                            child: Text(
                                                              viewModel.dataCart.value?.details?[index].quantity.toString() ?? '',
                                                              style: TextStyle(fontSize:12 ),)),
                                                      ),
                                                    ),
                                                    ),
                                                    SizedBox(
                                                      height: 30 ,
                                                      width: 30,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize: Size.zero, // Set this
                                                            padding: EdgeInsets.zero, // and this
                                                            primary: UIColors.white,
                                                            elevation: 0.0,
                                                            shadowColor: Colors.transparent,
                                                            shape:   const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(topRight: Radius.circular(7),bottomRight:Radius.circular(7)),
                                                                side: BorderSide(color: UIColors.black10,width: 1)
                                                            )
                                                        ),
                                                        onPressed: () async{
                                                            await viewModel.updateQuantityOrCode(viewModel.dataCart.value?.details?[index].id.toString() ?? '',
                                                                (viewModel.dataCart.value?.details?[index].quantity ?? 0 ) + 1,
                                                                viewModel.cartInfoCode[index].code
                                                            );
                                                            viewModel.refresh();
                                                        },
                                                        child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.black40,height: 10,)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: SpaceValues.space6,),
                                                //thêm loại thẻ
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Thêm loại thẻ:',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,

                                                      ),
                                                    ),
                                                    Expanded(child: SizedBox(),),
                                                    Obx(()=> SizedBox(
                                                      width: MediaQuery.of(context).size.width *0.26,
                                                      height: 30,
                                                      child: InputDecorator(
                                                        decoration:InputDecoration(
                                                            focusColor: UIColors.black10,
                                                            hintText: "Thêm loại thẻ",
                                                            contentPadding: EdgeInsets.only(left: 2),
                                                            border: InputBorder.none,
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(color: UIColors.black10),
                                                              borderRadius: BorderRadius.circular(SpaceValues.space8),)
                                                        ),
                                                        child: DropdownButtonHideUnderline(
                                                          child: DropdownButton<String>(
                                                              iconEnabledColor: UIColors.black40,
                                                              dropdownColor: UIColors.white,
                                                              isExpanded: false,
                                                              isDense: false,
                                                              value: viewModel.cartInfoCode[index].code,
                                                              items: viewModel.dataCart.value?.details?[index].cartInfo?.map((items)
                                                              =>  DropdownMenuItem(
                                                                value: items.code ?? '',
                                                                child: Padding(
                                                                  padding:  const EdgeInsets.only(left: 5),
                                                                  child: Text(items.name ?? '',style:  const TextStyle(
                                                                    color: UIColors.fontGray,
                                                                    fontSize: 10,
                                                                  ),),
                                                                ),
                                                              )).toList(),
                                                              onChanged: (value) {
                                                                setState(()  {
                                                                  if(viewModel.cartInfoCode[index].code == value!){
                                                                    viewModel.cartInfoCode[index] = viewModel.dataCart.value?.details?[index].cartInfo?.firstWhere((cartInfo) => cartInfo.code == value) ?? CardInfo();
                                                                  }else {
                                                                    viewModel.cartInfoCode[index] = viewModel.dataCart.value?.details?[index].cartInfo?.firstWhere((cartInfo) => cartInfo.code == value) ?? CardInfo();
                                                                     viewModel.updateQuantityOrCode(
                                                                        viewModel.dataCart.value?.details?[index].id.toString() ?? '',
                                                                        viewModel.dataCart.value?.details?[index].quantity,
                                                                        viewModel.cartInfoCode[index].code);
                                                                    viewModel.cartInfoCode[index].code = value;
                                                                    // viewModel.refresh();
                                                                  }

                                                                });
                                                              }),
                                                        ),
                                                      ),
                                                    ),),
                                                    SizedBox(width: SpaceValues.space8,),
                                                    SizedBox(
                                                      height: 25 ,
                                                      width: 25,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize: Size.zero, // Set this
                                                            padding: EdgeInsets.zero, // and this
                                                            elevation: 0.0,
                                                            shadowColor: Colors.transparent,
                                                            shape:   RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(20),
                                                                side: BorderSide(color: UIColors.black10,width: 1)
                                                            )
                                                        ),
                                                        onPressed: (){

                                                        },
                                                        child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.white,height: 16,)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: SpaceValues.space4,),
                                                //kun vận động
                                                Row(
                                                  children: [
                                                     Text(
                                                      viewModel.cartInfoCode[index].name ?? 'Kun vận động',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,

                                                      ),
                                                    ),
                                                    Expanded(child: const SizedBox(),),
                                                    SizedBox(
                                                      height: 30 ,
                                                      width: 30,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize: Size.zero, // Set this
                                                            padding: EdgeInsets.zero, // and this
                                                            primary: UIColors.white,
                                                            elevation: 0.0,
                                                            shadowColor: Colors.transparent,
                                                            shape:   RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft:Radius.circular(7)),
                                                                side: BorderSide(color: UIColors.black10,width: 1)
                                                            )
                                                        ),
                                                        onPressed: () async{
                                                          await viewModel.updateQuantityOrCode(viewModel.dataCart.value?.details?[index].id.toString() ?? '',
                                                              (viewModel.dataCart.value?.details?[index].quantity ?? 0 ) - 1,
                                                              viewModel.cartInfoCode[index].code
                                                          );
                                                          viewModel.refresh();
                                                        },
                                                        child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
                                                      ),
                                                    ),
                                                 Obx(()=>    Container(
                                                   height: 30,
                                                   decoration: const BoxDecoration(
                                                       border: Border.symmetric(
                                                           horizontal:
                                                           BorderSide(
                                                             color: UIColors.black10,
                                                             width: 1,
                                                           ))
                                                   ),
                                                   child:  Padding(
                                                     padding: EdgeInsets.only(left: 15,right: 15),
                                                     child: Center(child:
                                                     Text(
                                                       ((viewModel.cartInfoCode[index].quantity ?? 0) * (viewModel.dataCart.value?.details?[index].quantity ?? 0)).toString(),
                                                       style: TextStyle(
                                                           fontSize:12 ),)),
                                                   ),
                                                   ),
                                                 ),
                                                    SizedBox(
                                                      height: 30 ,
                                                      width: 30,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            minimumSize: Size.zero, // Set this
                                                            padding: EdgeInsets.zero, // and this
                                                            primary: UIColors.white,
                                                            elevation: 0.0,
                                                            shadowColor: Colors.transparent,
                                                            shape:   const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(topRight: Radius.circular(7),bottomRight:Radius.circular(7)),
                                                                side: BorderSide(color: UIColors.black10,width: 1)
                                                            )
                                                        ),
                                                        onPressed: () async {
                                                          await viewModel.updateQuantityOrCode(viewModel.dataCart.value?.details?[index].id.toString() ?? '',
                                                              (viewModel.dataCart.value?.details?[index].quantity ?? 0 ) + 1,
                                                              viewModel.cartInfoCode[index].code
                                                          );
                                                          viewModel.refresh();
                                                        },
                                                        child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.black40,height: 10,)),
                                                      ),
                                                    ),
                                                    SizedBox(width: SpaceValues.space8,),
                                                    SizedBox(
                                                      height: 25 ,
                                                      width: 25,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary: UIColors.red,
                                                            minimumSize: Size.zero, // Set this
                                                            padding: EdgeInsets.zero, // and this
                                                            elevation: 0.0,
                                                            shadowColor: Colors.transparent,
                                                            shape:   RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(20),
                                                                side: BorderSide(color: UIColors.black10,width: 1)
                                                            )
                                                        ),
                                                        onPressed: (){

                                                        },
                                                        child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.white,height: 16,)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );;
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  ),),
                      const SizedBox(height: SpaceValues.space12,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.center
                          ),
                          onPressed: (){

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SvgImageAssets.qrCode,height: 25,color: UIColors.white,),
                              const SizedBox(width: SpaceValues.space16,),
                              const Text(
                                'Thêm sản phẩm',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: SpaceValues.space12,),
                      const Text(
                        'Giá trị đơn quà',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: SpaceValues.space12,),
                      Card(
                        elevation: 0.0,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Tổng số thẻ quà Kun quy đổi',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '24',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    ' thẻ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Tổng số thẻ Kun vận động quy đổi',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Text(
                                    '24',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    ' thẻ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: SpaceValues.space12,),
                      //Thông tin người nhận
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //  ListTile(
                          //   dense: true,
                          //   minVerticalPadding: 0,
                          //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                          //   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                          //   title: Text(
                          //     "Địa chỉ nhận hàng",
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          //   ),
                          //   tileColor: Colors.transparent,
                          //   onTap: null, // viewModel.selectedAddress,
                          // ),
                          const Text(
                            'Thông tin người nhận',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              onSurface: UIColors.brandA,
                              primary: UIColors.brandA,
                            ) ,
                              onPressed: (){
                                Get.bottomSheet(SelecteAddressDiaLog(viewModel: viewModel));
                              }
                              , child: Row(
                               children: [
                                    SvgPicture.asset(SvgImageAssets.driveFileRename,color: UIColors.brandA,height: 20,),
                                    Text(' Thay đổi',style: TextStyle(color: UIColors.brandA,fontSize: 12,fontWeight: FontWeight.w400),)
                                ],

                          )
                          )
                        ],
                      ),
                      const SizedBox(height: SpaceValues.space12,),
                      Obx(()=> Card(
                        elevation: 0.0,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    'Người nhận',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    viewModel.address.value?.fullName ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text(
                                    'Số điện thoại',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                  Text(
                                    viewModel.address.value?.phone ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    'Địa chỉ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.2),
                                  Expanded(
                                    child: Text(
                                      viewModel.address.value?.fullAddress ?? '',
                                      // maxLines: 3,
                                      // overflow: TextOverflow.fade,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),),
                      const SizedBox(height: SpaceValues.space12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Nhận tại điểm đổi quà',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: SpaceValues.space12,),
                      Obx(()=>Card(
                        elevation: 0.0,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(SpaceValues.space16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(IconAssets.actionStore, color: UIColors.brandA, width: 24,),
                                  SizedBox(width: SpaceValues.space12,),
                                  const Text(
                                    'Nhận tại điểm đổi quà',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        onSurface: UIColors.brandA,
                                        primary: UIColors.brandA,
                                      ) ,
                                      onPressed: (){

                                      }
                                      , child: Checkbox(
                                      checkColor: Colors.white,
                                      shape: CircleBorder(),
                                      value: viewModel.checkPoint.value,
                                      onChanged: (bool? value){
                                        setState(() {
                                          // viewModel.checkPoint.value = value!;
                                          // if(!value){
                                          //   viewModel.dataCart.value?.distributorId = null;
                                          //   viewModel.dataCart.refresh();
                                          // }
                                        });
                                      },
                                      activeColor: UIColors.brandA,
                                    ),
                                    ),
                                  )
                                ],),
                              SizedBox(width: SpaceValues.space12,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:   [
                                  Text(
                                    'Địa chỉ: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      viewModel.dataCart.value?.distributorAddress ?? '',
                                      // maxLines: 3,
                                      // overflow: TextOverflow.fade,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),),
                      const SizedBox(height: SpaceValues.space12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Ghi chú',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: SpaceValues.space12,),
                       const TextField(
                        decoration: InputDecoration(
                          hintText: 'Nhập ghi chú (nếu có)',

                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                          ),
                          floatingLabelAlignment: FloatingLabelAlignment.center
                        ),
                        minLines: 3,
                        maxLines: 3,
                      ),
                      const SizedBox(height: SpaceValues.space48,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: UIColors.white,
                            // elevation: 0.0,
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: UIColors.red,width: 1)
                            )
                          ) ,
                          onPressed: () async{
                            await viewModel.deleteAllCart();
                          },
                          child: Text(
                              'Xoá giỏ quà',
                              style: TextStyle(
                                color: UIColors.red
                              ),
                          )),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              // elevation: 0.0,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),

                              )
                          ) ,
                          onPressed: (){
                            viewModel.confirmOrder();
                          },
                          child: Text(
                            'Xác nhận đơn quà',
                            style: TextStyle(

                            ),
                          )),
                    )
                  ],
                ),
              )

            //button add product

          ],
        ),
      ),
    );

  }

  @override
  CartModel createViewModel() => getIt<CartModel>();
}

class SelecteAddressDiaLog extends StatefulWidget{
  final CartModel viewModel;

  const SelecteAddressDiaLog({Key? key, required this.viewModel}) : super(key: key);
  @override
  State<StatefulWidget> createState()=>_SelecteAddressDiaLog();

}

class _SelecteAddressDiaLog extends State<SelecteAddressDiaLog> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(SpaceValues.space16),
            decoration: const BoxDecoration(
              color: UIColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: Get.back,
                  child: SvgPicture.asset(
                    IconAssets.navigationClose,
                    color: UIColors.black,
                  ),
                ),

                const Text(
                  'Danh sách địa chỉ',
                  style: TextStyle(
                      color: UIColors.black, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
          const Divider(height: 1,color: UIColors.black40),
          Obx(()=>Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: widget.viewModel.dataAddress.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<UserAddressResponse>(
                  title:  Text(widget.viewModel.dataAddress[index].fullName ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(widget.viewModel.dataAddress[index].fullAddress ?? ''),
                      SizedBox(height: 10,),
                      Text(widget.viewModel.dataAddress[index].phone ?? ''),
                    ],
                  ),
                  // selected: false,
                  value: widget.viewModel.dataAddress[index],
                  groupValue: widget.viewModel.address.value,
                  onChanged: (value) => setState(()=> {
                    widget.viewModel.address.value = value,
                    Get.back()
                  })
                    // viewModel.address.refresh();
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(color: UIColors.black70,indent: 1),
            ),
          ))
        ],
      ),
    );
  }
}
