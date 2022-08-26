import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/modules/productdetail/product_detail_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key, required this.idCategory, required this.heroTag, required this.title}) : super(key: key);
  String idCategory;
  String? heroTag;
  final String title;
  @override
  State<ProductDetail> createState() => _ProductDetailState(idCategory: idCategory);
}

class _ProductDetailState extends ViewWidget<ProductDetail, ProductDetailModel> {
  _ProductDetailState({required this.idCategory}) : super();
  String idCategory;
  String? _herotag;
  String get herotag {
    _herotag ??= '${widget.idCategory.toString()}${Random().nextDouble()}';
    return _herotag!;
  }

  final List<String> entries = <String>['A', 'B', 'C','D','E'];
  String color = 'Màu';
  var colors = [
    'Màu',
    'Item 1',
  ];
  @override
  void initState() {
    super.initState();
    // viewModel.idProduct = widget.idCategory;
    viewModel.getProductByCategoryId(widget.idCategory);
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale:"vi_VN", symbol: "đ");
    CarouselController _carouselController = CarouselController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title:  Text(
          widget.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        actions: [
        ],
      ),
      backgroundColor: UIColors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(()=>  Stack(children: [
                  viewModel.productResp.isNotEmpty
                      ? Container(
                    color: UIColors.white,
                    child: CarouselSlider(
                      items: viewModel.productResp.map((item) => Center(
                        child: GlobalImage(item.thumbnail),
                      )).toList(),
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          viewModel.indexSlider.value = index;
                        },
                      ),
                    ),
                  )
                      : CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                    items: [GlobalImage('viewModel.productDetail.value?.productThumbnails?.toString()', width: MediaQuery.of(context).size.width,)],
                  ),
                  // Obx(() => 5 != 0
                  //     ? Container(
                  //   color: UIColors.white,
                  //   child: CarouselSlider(
                  //     items: entries.map((item) => Center(
                  //       child: GlobalImage(''),
                  //     )).toList(),
                  //     carouselController: _carouselController,
                  //     options: CarouselOptions(
                  //       autoPlay: true,
                  //       enlargeCenterPage: true,
                  //       onPageChanged: (index, reason) {
                  //         viewModel.indexSlider.value = index;
                  //       },
                  //     ),
                  //   ),
                  // )
                  //     : CarouselSlider(
                  //   options: CarouselOptions(
                  //     autoPlay: true,
                  //   ),
                  //   items: [GlobalImage('viewModel.productDetail.value?.productThumbnails?.toString()', width: MediaQuery.of(context).size.width,)],
                  // ),
                  // ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: UIColors.black10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      // Text('123'),
                      child: Obx(() {
                        return Text('${viewModel.indexSlider.value + 1}/${viewModel.productResp.length}');
                      }
                      ),
                    ),
                  )
                ])),
                Obx(()=>Container(
                  color: UIColors.white,
                  height: 64,
                  width: double.infinity,
                  child: Visibility(
                    visible: viewModel.productResp.isNotEmpty,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.productResp.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              if (_carouselController.ready) {
                                viewModel.indexSlider.value = i;
                                _carouselController.animateToPage(i);
                              }
                            },
                            child: Obx(()=>Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: UIColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: viewModel.indexSlider.value == i ? UIColors.brandA : UIColors.border10)),
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: GlobalImage(
                                viewModel.productResp[i].thumbnail,
                                fit: BoxFit.contain,
                                height: 56,
                              ),
                            ),)
                          );

                        },
                      ),
                    ),
                    replacement: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: UIColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color:  UIColors.brandA),
                          ),
                          child: const GlobalImage(null, height: 56, width: 56,),
                        ),
                      ],
                    ),
                  ),
                ),),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Text(
                      'Binh nước giữa nhiệt Kun  (8 QK/ 2 KVĐ)',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 16,left: 16),
                  child: Row(
                    children: [
                      Text(
                        'Số lượng chọn: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      Expanded(child: const SizedBox()),
                      SizedBox(
                        height: 35 ,
                        width: MediaQuery.of(context).size.width * 0.075 ,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero, // Set this
                              padding: EdgeInsets.zero, // and this
                              primary: UIColors.white,
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              shape:   const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft:Radius.circular(4)),
                                  side: BorderSide(color: UIColors.black10,width: 1)
                              )
                          ),
                          onPressed: () async{
                            // viewModel.dataCart.value?.details?[index].quantity =  (viewModel.dataCart.value?.details?[index].quantity ?? 0 ) - 1;
                          },
                          child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.black40,height: 10,)),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width *0.2,
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
                                '12',
                                style: TextStyle(fontSize:12 ),)),
                        ),
                      ),
                      SizedBox(
                        height: 35 ,
                        width: MediaQuery.of(context).size.width * 0.075 ,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.zero, // Set this
                              padding: EdgeInsets.zero, // and this
                              primary: UIColors.white,
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              shape:   const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(6),bottomRight:Radius.circular(6)),
                                  side: BorderSide(color: UIColors.black10,width: 1)
                              )
                          ),
                          onPressed: () async{
                          },
                          child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.black40,height: 10,)),
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16,left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kiểu dáng: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                        height: 35,
                        child: Center(
                          child: InputDecorator(
                            decoration:InputDecoration(
                                isDense: true,
                                focusColor: UIColors.black10,
                                hintText: "Size",
                                contentPadding: EdgeInsets.only(left: 2),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.black10),
                                  borderRadius: BorderRadius.circular(SpaceValues.space4),)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  iconEnabledColor: UIColors.black40,
                                  elevation: 0,
                                  alignment: Alignment.center,
                                  dropdownColor: UIColors.white,
                                  isExpanded: false,
                                  isDense: false,
                                  value: color,
                                  items: colors.map((String items)
                                  =>  DropdownMenuItem(
                                    alignment: Alignment.center,
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(items,style: const TextStyle(
                                          color: UIColors.fontGray,
                                          fontSize: 10,
                                        ),),
                                      ),
                                    ),
                                  )).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      color = newValue!;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16,left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thẻ quy đổi: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                        height: 35,
                        child: Center(
                          child: InputDecorator(
                            decoration:InputDecoration(
                                isDense: true,
                                focusColor: UIColors.black10,
                                hintText: "Size",
                                contentPadding: EdgeInsets.only(left: 2),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.black10),
                                  borderRadius: BorderRadius.circular(SpaceValues.space4),)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  iconEnabledColor: UIColors.black40,
                                  elevation: 0,
                                  alignment: Alignment.center,
                                  dropdownColor: UIColors.white,
                                  isExpanded: false,
                                  isDense: false,
                                  value: color,
                                  items: colors.map((String items)
                                  =>  DropdownMenuItem(
                                    alignment: Alignment.center,
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(items,style: const TextStyle(
                                          color: UIColors.fontGray,
                                          fontSize: 10,
                                        ),),
                                      ),
                                    ),
                                  )).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      color = newValue!;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right: 16,left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Số thẻ cần: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                        height: 35,
                        child: Center(
                          child: InputDecorator(
                            decoration:InputDecoration(
                                isDense: true,
                                focusColor: UIColors.black10,
                                hintText: "Size",
                                contentPadding: EdgeInsets.only(left: 2),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.black10),
                                  borderRadius: BorderRadius.circular(SpaceValues.space4),)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  iconEnabledColor: UIColors.black40,
                                  elevation: 0,
                                  alignment: Alignment.center,
                                  dropdownColor: UIColors.white,
                                  isExpanded: false,
                                  isDense: false,
                                  value: color,
                                  items: colors.map((String items)
                                  =>  DropdownMenuItem(
                                    alignment: Alignment.center,
                                    value: items,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(items,style: const TextStyle(
                                          color: UIColors.fontGray,
                                          fontSize: 10,
                                        ),),
                                      ),
                                    ),
                                  )).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      color = newValue!;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: UIColors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 36,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.43,
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                          color: UIColors.brandA,
                          width: 1.0,
                        )),
                    child: const Text('Thêm vào giỏ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: UIColors.brandA)),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    child: const Text('Mua ngay'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProductDetailModel createViewModel() => getIt<ProductDetailModel>();
}
