import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class CartLofWidget extends StatefulWidget{
  final String img;
  final String giftId;
  final String name;
  final String quantity;
  final String quantityOfpicks;
  final bool? display;

  const CartLofWidget({Key? key,
    required this.img,
    required this.giftId,
    required this.name,
    required this.quantity,
    required this.quantityOfpicks,
    this.display,

  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CartLofWidget();

}
class _CartLofWidget extends State<CartLofWidget>{
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.25,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(widget.img,height: 90,width: 90),
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
                          onPressed: (){
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
                        widget.quantity,
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
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: InputDecorator(
                            decoration:InputDecoration(
                              focusColor: UIColors.black10,
                              hintText: "Kiểu dáng",
                              contentPadding: EdgeInsets.only(left: 2),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: UIColors.black10),
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
                      SizedBox(width: SpaceValues.space12,),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: InputDecorator(
                            decoration:InputDecoration(
                              focusColor: UIColors.black10,
                              hintText: "Kiểu dáng",
                              contentPadding: EdgeInsets.only(left: 2),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: UIColors.black10),
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
                  SizedBox(height: SpaceValues.space8,),
                  Visibility(
                    visible:  widget.display == true,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: InputDecorator(
                              decoration:InputDecoration(
                                focusColor: UIColors.black10,
                                hintText: "Kiểu dáng",
                                contentPadding: EdgeInsets.only(left: 2),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.black10),
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
                        SizedBox(width: SpaceValues.space12,),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: InputDecorator(
                              decoration:InputDecoration(
                                focusColor: UIColors.black10,
                                hintText: "Kiểu dáng",
                                contentPadding: EdgeInsets.only(left: 2),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.black10),
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
                                  contentPadding: EdgeInsets.only(left: 2),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: UIColors.black10),
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
                                  contentPadding: EdgeInsets.only(left: 2),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: UIColors.black10),
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
                        SizedBox(width: 4,),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: InputDecorator(
                              decoration:InputDecoration(
                                focusColor: UIColors.black10,
                                hintText: "Kiểu dáng",
                                contentPadding: EdgeInsets.only(left: 2),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.black10),
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
  }

}