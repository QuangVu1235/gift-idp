import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/cart/widgets/cart_lof_widget.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class CartAdvanceScreen extends StatefulWidget {
  const CartAdvanceScreen({Key? key}) : super(key: key);

  @override
  State<CartAdvanceScreen> createState() => _CartAdvanceScreenState();
}

class _CartAdvanceScreenState extends State<CartAdvanceScreen> {
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

  final List<String> entries = <String>['resources/icons/change_point/ao.png', 'resources/icons/change_point/goi.png'];

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.white,
        title: Text('Tạo đơn tạm ứng', style: TextStyle(color: UIColors.black,fontWeight: FontWeight.w700),),
        shape: const Border(bottom: BorderSide(color: UIColors.black10)),
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
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: entries.length,
                      itemBuilder: (context, int index) {
                        return Card(
                          elevation: 0.0,
                          margin: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.25,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(entries[index],height: 90,width: 90),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,10,10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text('#12345',
                                        style: const TextStyle(
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
                                              'Bình nước giữ nhiệt kun',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 100,),
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
                                              onPressed: (){
                                              },
                                              child: SvgPicture.asset(SvgImageAssets.trash,height: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Số lượng tạm ứng: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,

                                            ),
                                          ),
                                          SizedBox(height: 6,),
                                         Row(
                                           children: [
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
                                                         borderRadius:  BorderRadius.only(topLeft:  Radius.circular(7),bottomLeft:Radius.circular(7)),
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
                                                 padding: const EdgeInsets.only(left: 15,right: 15),
                                                 child: Center(
                                                     child: Text(
                                                       '20',
                                                       style: const TextStyle(fontSize:12 ),)),
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
                                         )
                                        ],
                                      ),
                                      const SizedBox(height: SpaceValues.space6,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 30,
                                              child: InputDecorator(
                                                decoration:InputDecoration(
                                                  focusColor: UIColors.black10,
                                                  hintText: "Kiểu dáng",
                                                  contentPadding: const EdgeInsets.only(left: 2),
                                                  border: InputBorder.none,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: UIColors.black10),
                                                    borderRadius: BorderRadius.circular(SpaceValues.space8),
                                                  ),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                      iconEnabledColor: UIColors.black40,
                                                      dropdownColor: UIColors.white,
                                                      isExpanded: false,
                                                      isDense: false,
                                                      value: design,
                                                      items: designs.map((String items)
                                                      =>  DropdownMenuItem(
                                                        value: items,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 5),
                                                          child: Text(items,style:  const TextStyle(
                                                            color: UIColors.fontGray,
                                                            fontSize: 10,
                                                          ),),
                                                        ),
                                                      )).toList(),
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          design = newValue!;
                                                        });
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: SpaceValues.space12,),
                                          Expanded(
                                            child: SizedBox(
                                              height: 30,
                                              child: InputDecorator(
                                                decoration:InputDecoration(
                                                  focusColor: UIColors.black10,
                                                  hintText: "Kiểu dáng",
                                                  contentPadding: const EdgeInsets.only(left: 2),
                                                  border: InputBorder.none,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: UIColors.black10),
                                                    borderRadius: BorderRadius.circular(SpaceValues.space8),
                                                  ),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                      iconEnabledColor: UIColors.black40,
                                                      dropdownColor: UIColors.white,
                                                      isExpanded: false,
                                                      isDense: false,
                                                      value: design,
                                                      items: designs.map((String items)
                                                      =>  DropdownMenuItem(
                                                        value: items,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 5),
                                                          child: Text(items,style:  const TextStyle(
                                                            color: UIColors.fontGray,
                                                            fontSize: 10,
                                                          ),),
                                                        ),
                                                      )).toList(),
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          design = newValue!;
                                                        });
                                                      }),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                      const SizedBox(height: SpaceValues.space8,),
                                      Visibility(
                                        visible: false,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 30,
                                                child: InputDecorator(
                                                  decoration:InputDecoration(
                                                    focusColor: UIColors.black10,
                                                    hintText: "Kiểu dáng",
                                                    contentPadding: const EdgeInsets.only(left: 2),
                                                    border: InputBorder.none,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(color: UIColors.black10),
                                                      borderRadius: BorderRadius.circular(SpaceValues.space8),
                                                    ),
                                                  ),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                        iconEnabledColor: UIColors.black40,
                                                        dropdownColor: UIColors.white,
                                                        isExpanded: false,
                                                        isDense: false,
                                                        value: design,
                                                        items: designs.map((String items)
                                                        =>  DropdownMenuItem(
                                                          value: items,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5),
                                                            child: Text(items,style:  const TextStyle(
                                                              color: UIColors.fontGray,
                                                              fontSize: 10,
                                                            ),),
                                                          ),
                                                        )).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            design = newValue!;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: SpaceValues.space12,),
                                            Expanded(
                                              child: SizedBox(
                                                height: 30,
                                                child: InputDecorator(
                                                  decoration:InputDecoration(
                                                    focusColor: UIColors.black10,
                                                    hintText: "Kiểu dáng",
                                                    contentPadding: const EdgeInsets.only(left: 2),
                                                    border: InputBorder.none,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(color: UIColors.black10),
                                                      borderRadius: BorderRadius.circular(SpaceValues.space8),
                                                    ),
                                                  ),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                        iconEnabledColor: UIColors.black40,
                                                        dropdownColor: UIColors.white,
                                                        isExpanded: false,
                                                        isDense: false,
                                                        value: design,
                                                        items: designs.map((String items)
                                                        =>  DropdownMenuItem(
                                                          value: items,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5),
                                                            child: Text(items,style:  const TextStyle(
                                                              color: UIColors.fontGray,
                                                              fontSize: 10,
                                                            ),),
                                                          ),
                                                        )).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            design = newValue!;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        replacement:Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.18,
                                              height: 30,
                                              child: Center(
                                                child: InputDecorator(
                                                  decoration:InputDecoration(
                                                      isDense: true,
                                                      focusColor: UIColors.black10,
                                                      hintText: "Size",
                                                      contentPadding: const EdgeInsets.only(left: 2),
                                                      border: InputBorder.none,
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(color: UIColors.black10),
                                                        borderRadius: BorderRadius.circular(SpaceValues.space8),)
                                                  ),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                        iconEnabledColor: UIColors.black40,
                                                        elevation: 0,
                                                        alignment: Alignment.center,
                                                        dropdownColor: UIColors.white,
                                                        isExpanded: false,
                                                        isDense: false,
                                                        value: sizeItem,
                                                        items: sizes.map((String items)
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
                                                            sizeItem = newValue!;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 4,),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.18,
                                              height: 30,
                                              child: Center(
                                                child: InputDecorator(
                                                  decoration:InputDecoration(
                                                      isDense: true,
                                                      focusColor: UIColors.black10,
                                                      hintText: "Size",
                                                      contentPadding: const EdgeInsets.only(left: 2),
                                                      border: InputBorder.none,
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(color: UIColors.black10),
                                                        borderRadius: BorderRadius.circular(SpaceValues.space8),)
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
                                                            sizeItem = newValue!;
                                                          });
                                                        }),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 4,),
                                            Expanded(
                                              child: SizedBox(
                                                height: 30,
                                                child: InputDecorator(
                                                  decoration:InputDecoration(
                                                    focusColor: UIColors.black10,
                                                    hintText: "Kiểu dáng",
                                                    contentPadding: const EdgeInsets.only(left: 2),
                                                    border: InputBorder.none,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(color: UIColors.black10),
                                                      borderRadius: BorderRadius.circular(SpaceValues.space8),
                                                    ),
                                                  ),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                        iconEnabledColor: UIColors.black40,
                                                        dropdownColor: UIColors.white,
                                                        isExpanded: false,
                                                        isDense: false,
                                                        value: design,
                                                        items: designs.map((String items)
                                                        =>  DropdownMenuItem(
                                                          value: items,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5),
                                                            child: Text(items,style:  const TextStyle(
                                                              color: UIColors.fontGray,
                                                              fontSize: 10,
                                                            ),),
                                                          ),
                                                        )).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            design = newValue!;
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
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    ),
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
                            Icon(Icons.add_circle_outline),
                            // SvgPicture.asset(SvgImageAssets.qrCode,height: 25,color: UIColors.white,),
                            const SizedBox(width: SpaceValues.space16,),
                            const Text(
                              'Thêm sản phẩm tạm ứng',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )),
                   const SizedBox(height: SpaceValues.space12,),
                   Text('Địa điểm giao', style: TextStyle(color: UIColors.black,fontWeight: FontWeight.w700),),
                    const SizedBox(height: SpaceValues.space12,),
                    Card(
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
                                  'Cửa hàng Thị Huệ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                              
                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const[
                                Text('SĐT:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                  ),),
                                SizedBox(width: 6,),
                                Text('0522932657',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                  ),)
                              ],
                            ),
                            SizedBox(width: SpaceValues.space12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  const [
                                Text(
                                  'Địa chỉ: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Phường Thạnh Xuân, Quận 12, Thành phố Hồ Chí Minh',
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
                    ),
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
                        onPressed: (){

                        },
                        child: Text(
                          'Xoá đơn tạm ứng',
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

                        },
                        child: Text(
                          'Xác nhận đơn tạm ứng',
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
}
