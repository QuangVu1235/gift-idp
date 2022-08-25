import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/global_modules/widget/global_image.dart';
import 'package:idp_gift_app/src/modules/productdetail/product_detail_model.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key, required this.idProduct, required this.heroTag}) : super(key: key);
  int idProduct;
  String? heroTag;
  @override
  State<ProductDetail> createState() => _ProductDetailState(idProduct: idProduct);
}

class _ProductDetailState extends ViewWidget<ProductDetail, ProductDetailModel> {
  _ProductDetailState({required this.idProduct}) : super();
  int idProduct;
  String? _herotag;
  String get herotag {
    _herotag ??= '${widget.idProduct.toString()}${Random().nextDouble()}';
    return _herotag!;
  }

  final List<String> entries = <String>['A', 'B', 'C','D','E'];

  @override
  void initState() {
    super.initState();
    viewModel.idProduct = widget.idProduct;
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
        centerTitle: false,
        title: const Text(
          'Chi tiết sản phẩm',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
        ],
      ),
      backgroundColor: UIColors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    5 != 0
                        ? Container(
                      color: UIColors.white,
                      child: CarouselSlider(
                        items: entries.map((item) => Center(
                          child: GlobalImage('https://filebroker-cdn.lazada.vn/kf/Sb044e4427ad740f59633110d759325c28.jpg'),
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
                          return Text('${viewModel.indexSlider.value + 1}/${5}');
                        }
                        ),
                      ),
                    )
                  ]),
                  Container(
                    color: UIColors.white,
                    height: 64,
                    width: double.infinity,
                    child: Visibility(
                      visible: 5 != 0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return Obx(()=> InkWell(
                            onTap: () {
                              if (_carouselController.ready) {
                                viewModel.indexSlider.value = i;
                                _carouselController.animateToPage(i);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: UIColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: viewModel.indexSlider.value == i ? UIColors.brandA : UIColors.border10)),
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: GlobalImage(
                                'https://filebroker-cdn.lazada.vn/kf/Sb044e4427ad740f59633110d759325c28.jpg',
                                fit: BoxFit.contain,
                                height: 56,
                              ),
                            ),
                          ));

                        },
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
                  ),
                  // Obx(() =>
                  //     Padding(
                  //       padding: const EdgeInsets.all(16.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(viewModel.productDetail.value?.name ?? '...',
                  //               style: const TextStyle(
                  //                   fontSize: 14, fontWeight: FontWeight.w700)),
                  //           const SizedBox(height: 12),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Visibility(
                  //                     visible: (viewModel.productDetail.value?.discount?.percent ?? 0) !=0 ,
                  //                     child: Row(
                  //                       children: [
                  //                         Text(
                  //                             formatCurrency.format((viewModel.productDetail.value?.price ?? 0)
                  //                                 - ((viewModel.productDetail.value?.price ?? 0) * (viewModel.productDetail.value?.discount?.percent ?? 0)/100)
                  //                             ),
                  //                             style: const TextStyle(
                  //                                 fontSize: 18,
                  //                                 fontWeight: FontWeight.w700,
                  //                                 color: UIColors.brandA)
                  //                         ),
                  //                         Container(
                  //                           padding:
                  //                           const EdgeInsets.only(left: 7, top: 7),
                  //                           child: Text(
                  //                             formatCurrency.format(viewModel.productDetail.value?.price?.toDouble() ?? 0),
                  //                             style: const TextStyle(
                  //                               fontSize: 10.0,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: Colors.black54,
                  //                               decoration: TextDecoration.lineThrough,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     replacement: Text(
                  //                         formatCurrency.format(viewModel.productDetail.value?.price?.toDouble() ?? 0),
                  //                         style: const TextStyle(
                  //                             fontSize: 18,
                  //                             fontWeight: FontWeight.w700,
                  //                             color: UIColors.brandA)
                  //                     ),
                  //                   ),
                  //
                  //
                  //                   Visibility(
                  //                     visible: (viewModel.productDetail.value?.discount?.percent ?? 0) != 0,
                  //                     child: Container(
                  //                       margin: const EdgeInsets.only(left: 10),
                  //                       decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.circular(5),
                  //                         color: UIColors.brandA,
                  //                       ),
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.all(5),
                  //                         child: Text(
                  //                             (viewModel.productDetail.value?.discount?.percent != 0 ? '${viewModel.productDetail.value?.discount?.percent.toString()}%':''),
                  //                             style: const TextStyle(
                  //                                 color: Colors.white, fontSize: 10)),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //
                  //             ],
                  //           ),
                  //           ListTile(
                  //             dense: true,
                  //             contentPadding:
                  //             const EdgeInsets.only(left: 0.0, right: 0.0),
                  //             title: const Text("SẢN PHẨM TƯƠNG TỰ",
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w700, fontSize: 14)),
                  //             tileColor: Colors.transparent,
                  //             trailing: GestureDetector(
                  //               onTap:(){
                  //                 Get.back();
                  //                 Get.to(ListProductNew(categoryId: viewModel.productDetail.value?.subCategory?.category?.id ?? 1,title: viewModel.productDetail.value?.subCategory?.category?.name,));
                  //               },
                  //               child: const Text("Xem thêm >",
                  //                   style: TextStyle(
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w400,
                  //                       color: UIColors.brandA)),
                  //             ),
                  //             onTap: () {},
                  //           ),
                  //           ProductSellingScreen(categoryId: viewModel.productDetail.value?.subCategory?.category?.id ?? 1),
                  //           const SizedBox(
                  //             height: 24,
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  // ),
                ],
              ),
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
