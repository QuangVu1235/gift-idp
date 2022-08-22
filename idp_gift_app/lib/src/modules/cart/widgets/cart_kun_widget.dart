import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/cart/widgets/cart_widget_model.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

class CartKunWidget extends StatefulWidget{
  final String idCartDetail;
  final String idProduct;
  final String productCode;
  final String cartInfoCode;
  final String img;
  final String giftId;
  final String name;
  final String quantity;
  final String quantityOfpicks;

  const CartKunWidget({Key? key,
    required this.img,
    required this.giftId,
    required this.name,
    this.quantity = '0',
    required this.quantityOfpicks,
    required this.idProduct,
    required this.productCode, required this.cartInfoCode,
    required this.idCartDetail,

  }) : super(key: key);
  @override
  State<StatefulWidget> createState()=> _CartKunWidget();

}
class _CartKunWidget extends ViewWidget<CartKunWidget,CartWidgetModel>{
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

  @override
  void initState() {
    super.initState();
    viewModel.productCode.value = widget.productCode;
    viewModel.getProductByCode();

  }
  @override
  Widget build(BuildContext context) {
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
              child: GlobalImage(widget.img,height: 90,width: 90),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,10,10,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    widget.giftId,
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
                          widget.name,
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
                            await viewModel.deleteCart(widget.idCartDetail);
                            await viewModel.refreshCart();
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
                        viewModel.productResp.value?.qty.toString() ?? '0',
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
                          onPressed: (){

                          },
                          child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
                        ),
                      ),
                      Container(
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
                                          widget.quantityOfpicks,
                                          style: TextStyle(fontSize:12 ),)),
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
                          onPressed: (){

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
                              hintText: "Kiểu dáng",
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
                                value: viewModel.cartInfoCode.value,
                                items: viewModel.cartInfo.map((items)
                                =>  DropdownMenuItem(
                                  value: items.code ?? '',
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 5),
                                    child: Text(items.name ?? '',style:  const TextStyle(
                                      color: UIColors.fontGray,
                                      fontSize: 10,
                                    ),),
                                  ),
                                )).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    viewModel.cartInfoCode.value = value!;
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
                      const Text(
                        'Kun vận động:',
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
                          onPressed: (){

                          },
                          child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
                        ),
                      ),
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal:
                                BorderSide(
                                  color: UIColors.black10,
                                  width: 1,
                                ))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: Center(child: Text('10',style: TextStyle(fontSize:12 ),)),
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
                          onPressed: (){

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
    );
  }

  @override
  CartWidgetModel createViewModel() => getIt<CartWidgetModel>();

}

//
// class CartKunWidget extends StatefulWidget{
//   final String img;
//   final String giftId;
//   final String name;
//   final String quantity;
//   final String quantityOfpicks;
//
//   const CartKunWidget({Key? key,
//     required this.img,
//     required this.giftId,
//     required this.name,
//     required this.quantity,
//     required this.quantityOfpicks,
//
//   }) : super(key: key);
//   @override
//   State<StatefulWidget> createState()=> _CartKunWidget();
//
// }
// class _CartKunWidget extends State<CartKunWidget>{
//   String sizeItem = 'Size';
//   var sizes = [
//     'Size',
//     'Item 1',
//   ];
//   String color = 'Màu';
//   var colors = [
//     'Màu',
//     'Item 1',
//   ];
//   String design = 'Kiểu dáng';
//   var designs = [
//     'Kiểu dáng',
//     'Item',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0.0,
//       margin: EdgeInsets.zero,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width*0.2,
//             child: Padding(
//               padding: EdgeInsets.all(10),
//               child: GlobalImage(widget.img,height: 90,width: 90),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(0,10,10,10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children:  [
//                   Text(
//                     widget.giftId,
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700
//                     ),
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.name,
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w700
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 100,),
//                       SizedBox(
//                         width: 24,
//                         height: 24,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             onSurface: Colors.red,
//                             minimumSize: Size.zero, // Set this
//                             padding: EdgeInsets.zero, // and this
//                             primary: UIColors.white,
//                             elevation: 0.0,
//                           ),
//                           onPressed: (){
//                           },
//                           child: SvgPicture.asset(SvgImageAssets.trash,height: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     children:  [
//                       Text(
//                         'Số lượng hiện có: ',
//                         style: TextStyle(
//                             color: UIColors.red,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.italic
//                         ),
//                       ),
//                       Text(
//                         widget.quantity,
//                         style: TextStyle(
//                             color: UIColors.red,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.italic
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Số lượng chọn: ',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//
//                         ),
//                       ),
//                       Expanded(child: const SizedBox()),
//                       SizedBox(
//                         height: 30 ,
//                         width: 30,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               minimumSize: Size.zero, // Set this
//                               padding: EdgeInsets.zero, // and this
//                               primary: UIColors.white,
//                               elevation: 0.0,
//                               shadowColor: Colors.transparent,
//                               shape:   RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft:Radius.circular(7)),
//                                   side: BorderSide(color: UIColors.black10,width: 1)
//                               )
//                           ),
//                           onPressed: (){
//
//                           },
//                           child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
//                         ),
//                       ),
//                       Container(
//                         height: 30,
//                         decoration: const BoxDecoration(
//                             border: Border.symmetric(
//                                 horizontal:
//                                 BorderSide(
//                                   color: UIColors.black10,
//                                   width: 1,
//                                 ))
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 15,right: 15),
//                           child: Center(
//                               child: Text(
//                                 widget.quantityOfpicks,
//                                 style: TextStyle(fontSize:12 ),)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30 ,
//                         width: 30,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               minimumSize: Size.zero, // Set this
//                               padding: EdgeInsets.zero, // and this
//                               primary: UIColors.white,
//                               elevation: 0.0,
//                               shadowColor: Colors.transparent,
//                               shape:   const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(topRight: Radius.circular(7),bottomRight:Radius.circular(7)),
//                                   side: BorderSide(color: UIColors.black10,width: 1)
//                               )
//                           ),
//                           onPressed: (){
//
//                           },
//                           child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.black40,height: 10,)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: SpaceValues.space6,),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width*0.18,
//                         height: 30,
//                         child: Center(
//                           child: InputDecorator(
//                             decoration:InputDecoration(
//                                 isDense: true,
//                                 focusColor: UIColors.black10,
//                                 hintText: "Size",
//                                 contentPadding: EdgeInsets.only(left: 2),
//                                 border: InputBorder.none,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: UIColors.black10),
//                                   borderRadius: BorderRadius.circular(SpaceValues.space8),)
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                   iconEnabledColor: UIColors.black40,
//                                   elevation: 0,
//                                   alignment: Alignment.center,
//                                   dropdownColor: UIColors.white,
//                                   isExpanded: false,
//                                   isDense: false,
//                                   value: sizeItem,
//                                   items: sizes.map((String items)
//                                   =>  DropdownMenuItem(
//                                     alignment: Alignment.center,
//                                     value: items,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 2),
//                                       child: Align(
//                                         alignment: Alignment.center,
//                                         child: Text(items,style: const TextStyle(
//                                           color: UIColors.fontGray,
//                                           fontSize: 10,
//                                         ),),
//                                       ),
//                                     ),
//                                   )).toList(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       sizeItem = newValue!;
//                                     });
//                                   }),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 4,),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width*0.18,
//                         height: 30,
//                         child: Center(
//                           child: InputDecorator(
//                             decoration:InputDecoration(
//                                 isDense: true,
//                                 focusColor: UIColors.black10,
//                                 hintText: "Size",
//                                 contentPadding: EdgeInsets.only(left: 2),
//                                 border: InputBorder.none,
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: UIColors.black10),
//                                   borderRadius: BorderRadius.circular(SpaceValues.space8),)
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                   iconEnabledColor: UIColors.black40,
//                                   elevation: 0,
//                                   alignment: Alignment.center,
//                                   dropdownColor: UIColors.white,
//                                   isExpanded: false,
//                                   isDense: false,
//                                   value: color,
//                                   items: colors.map((String items)
//                                   =>  DropdownMenuItem(
//                                     alignment: Alignment.center,
//                                     value: items,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 2),
//                                       child: Align(
//                                         alignment: Alignment.center,
//                                         child: Text(items,style: const TextStyle(
//                                           color: UIColors.fontGray,
//                                           fontSize: 10,
//                                         ),),
//                                       ),
//                                     ),
//                                   )).toList(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       sizeItem = newValue!;
//                                     });
//                                   }),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 4,),
//                       Expanded(
//                         child: SizedBox(
//                           height: 30,
//                           child: InputDecorator(
//                             decoration:InputDecoration(
//                               focusColor: UIColors.black10,
//                               hintText: "Kiểu dáng",
//                               contentPadding: EdgeInsets.only(left: 2),
//                               border: InputBorder.none,
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: UIColors.black10),
//                                 borderRadius: BorderRadius.circular(SpaceValues.space8),
//                               ),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                   iconEnabledColor: UIColors.black40,
//                                   dropdownColor: UIColors.white,
//                                   isExpanded: false,
//                                   isDense: false,
//                                   value: design,
//                                   items: designs.map((String items)
//                                   =>  DropdownMenuItem(
//                                     value: items,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 5),
//                                       child: Text(items,style:  const TextStyle(
//                                         color: UIColors.fontGray,
//                                         fontSize: 10,
//                                       ),),
//                                     ),
//                                   )).toList(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       design = newValue!;
//                                     });
//                                   }),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: SpaceValues.space4,),
//                   //thêm loại thẻ
//                   Row(
//                     children: [
//                       const Text(
//                         'Thêm loại thẻ:',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//
//                         ),
//                       ),
//                       Expanded(child: SizedBox(),),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width *0.26,
//                         height: 30,
//                         child: InputDecorator(
//                           decoration:InputDecoration(
//                               focusColor: UIColors.black10,
//                               hintText: "Kiểu dáng",
//                               contentPadding: EdgeInsets.only(left: 2),
//                               border: InputBorder.none,
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: UIColors.black10),
//                                 borderRadius: BorderRadius.circular(SpaceValues.space8),)
//                           ),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                                 iconEnabledColor: UIColors.black40,
//                                 dropdownColor: UIColors.white,
//                                 isExpanded: false,
//                                 isDense: false,
//                                 value: design,
//                                 items: designs.map((String items)
//                                 =>  DropdownMenuItem(
//                                   value: items,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 5),
//                                     child: Text(items,style:  const TextStyle(
//                                       color: UIColors.fontGray,
//                                       fontSize: 10,
//                                     ),),
//                                   ),
//                                 )).toList(),
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     design = newValue!;
//                                   });
//                                 }),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: SpaceValues.space8,),
//                       SizedBox(
//                         height: 25 ,
//                         width: 25,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               minimumSize: Size.zero, // Set this
//                               padding: EdgeInsets.zero, // and this
//                               elevation: 0.0,
//                               shadowColor: Colors.transparent,
//                               shape:   RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   side: BorderSide(color: UIColors.black10,width: 1)
//                               )
//                           ),
//                           onPressed: (){
//
//                           },
//                           child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.white,height: 16,)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: SpaceValues.space4,),
//                   //kun vận động
//                   Row(
//                     children: [
//                       const Text(
//                         'Kun vận động:',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//
//                         ),
//                       ),
//                       Expanded(child: const SizedBox(),),
//                       SizedBox(
//                         height: 30 ,
//                         width: 30,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               minimumSize: Size.zero, // Set this
//                               padding: EdgeInsets.zero, // and this
//                               primary: UIColors.white,
//                               elevation: 0.0,
//                               shadowColor: Colors.transparent,
//                               shape:   RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft:Radius.circular(7)),
//                                   side: BorderSide(color: UIColors.black10,width: 1)
//                               )
//                           ),
//                           onPressed: (){
//
//                           },
//                           child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
//                         ),
//                       ),
//                       Container(
//                         height: 30,
//                         decoration: const BoxDecoration(
//                             border: Border.symmetric(
//                                 horizontal:
//                                 BorderSide(
//                                   color: UIColors.black10,
//                                   width: 1,
//                                 ))
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.only(left: 15,right: 15),
//                           child: Center(child: Text('10',style: TextStyle(fontSize:12 ),)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30 ,
//                         width: 30,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               minimumSize: Size.zero, // Set this
//                               padding: EdgeInsets.zero, // and this
//                               primary: UIColors.white,
//                               elevation: 0.0,
//                               shadowColor: Colors.transparent,
//                               shape:   const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(topRight: Radius.circular(7),bottomRight:Radius.circular(7)),
//                                   side: BorderSide(color: UIColors.black10,width: 1)
//                               )
//                           ),
//                           onPressed: (){
//
//                           },
//                           child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.black40,height: 10,)),
//                         ),
//                       ),
//                       SizedBox(width: SpaceValues.space8,),
//                       SizedBox(
//                         height: 25 ,
//                         width: 25,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: UIColors.red,
//                               minimumSize: Size.zero, // Set this
//                               padding: EdgeInsets.zero, // and this
//                               elevation: 0.0,
//                               shadowColor: Colors.transparent,
//                               shape:   RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   side: BorderSide(color: UIColors.black10,width: 1)
//                               )
//                           ),
//                           onPressed: (){
//
//                           },
//                           child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.white,height: 16,)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
// }