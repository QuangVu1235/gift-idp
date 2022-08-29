import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class TabWareHouse extends StatefulWidget {
  const TabWareHouse({Key? key}) : super(key: key);

  @override
  State<TabWareHouse> createState() => _TabWareHouseState();
}

class _TabWareHouseState extends State<TabWareHouse> {
  bool _customTileExpanded = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: UIColors.white,
        child: Padding(
        padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
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
                  borderSide: const BorderSide(color: UIColors.black10),
                  borderRadius: BorderRadius.circular(SpaceValues.space8),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                  maxHeight: SpaceValues.space24, minWidth: 0),
                  suffixIcon: InkWell(
                  onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                  }
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
                      InkWell(
                        onTap: (){
                          showModalBottomSheet<void>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  color: UIColors.white,
                                ),
                                height: MediaQuery.of(context).size.height*1,
                                child: Column(
                                  children:[
                                    const SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: IconButton(
                                              onPressed: () => Navigator.pop(context),
                                              icon: const Icon(Icons.close)),
                                        ),
                                        const Expanded(
                                            flex: 4,
                                            child: Center(child: Text('Bộ lọc sản phẩm',style: TextStyle(fontSize: 16,color: UIColors.black,fontWeight: FontWeight.w700),))),
                                        const Expanded(flex: 1,child: SizedBox())
                                      ],
                                    ),
                                    const Padding(
                                      padding:  EdgeInsets.only(left: 16.0,right: 8,top: 8,bottom: 8),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                          child: Text('Kích thước',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ),)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("37"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("38"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("39"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("40"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          const Expanded(
                                            child: SizedBox(width: 20,),
                                          ),
                                          const SizedBox(width: 4,)
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Màu sắc',style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w700 ), )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("S"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("M"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("L"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("XL"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTileTheme(
                                              contentPadding: EdgeInsets.zero,
                                              child: CheckboxListTile(
                                                title: const Text("XXL"),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                value: true,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },),
                                            ),
                                          ),
                                          const SizedBox(width: 4,)
                                        ],
                                      ),
                                    ),
                                    const Divider(height: 1,color: UIColors.black,),
                                    Container(
                                      margin: const EdgeInsets.only(left: 12,right:12,bottom: 8,top: 8),
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: (){},
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Áp dụng bộ lọc'),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset(IconAssets.Filter,
                        color: UIColors.fontGray),
                      ),
                      const SizedBox(
                      width: SpaceValues.space16,
                      ),
                      ],
                    ),
                   ),
                  ),
                ),
              const SizedBox(height: SpaceValues.space24,),
              const Text('KHO QUÀ KUN',style: TextStyle(
                color: UIColors.greenKun,
                fontWeight: FontWeight.w700
                ),),
              ExpansionTile(
                title: const Text('Sản phẩm quà tặng đồng hồ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                // collapsedTextColor: UIColors.black,
                textColor: UIColors.black40,
                iconColor: UIColors.black40,
                trailing: Icon(
                _customTileExpanded
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.keyboard_arrow_right,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(ImageAssets.watchKun),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('#12345',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                const SizedBox(height: 4,),
                                const Text('Đồng hồ Thông minh Kun',style:  TextStyle(color: UIColors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                     Text('Số lượng nhập'),
                                     Text('100',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                     Text('Số lượng xuất'),
                                     Text('50',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                     Text('Số lượng tồn kho'),
                                     Text('50',style:  TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
                onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
                },
                ),
              ExpansionTile(
                title: const Text('Sản phẩm quà tặng áo thun',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                // collapsedTextColor: UIColors.black,
                textColor: UIColors.black40,
                iconColor: UIColors.black40,
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_right,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(ImageAssets.watchKun),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('#12345',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                const SizedBox(height: 4,),
                                const Text('Đồng hồ Thông minh Kun',style:  TextStyle(color: UIColors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Số lượng nhập'),
                                    Text('100',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                    Text('Số lượng xuất'),
                                    Text('50',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                    Text('Số lượng tồn kho'),
                                    Text('50',style:  TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
              ExpansionTile(
                title: const Text('Sản phẩm quà tặng giày thể thao',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                // collapsedTextColor: UIColors.black,
                textColor: UIColors.black40,
                iconColor: UIColors.black40,
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_right,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(ImageAssets.watchKun),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('#12345',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                const SizedBox(height: 4,),
                                const Text('Đồng hồ Thông minh Kun',style:  TextStyle(color: UIColors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Số lượng nhập'),
                                    Text('100',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                    Text('Số lượng xuất'),
                                    Text('50',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                    Text('Số lượng tồn kho'),
                                    Text('50',style:  TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
              ExpansionTile(
                title: const Text('Sản phẩm quà tặng học tập',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                // collapsedTextColor: UIColors.black,
                textColor: UIColors.black40,
                iconColor: UIColors.black40,
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.keyboard_arrow_down_outlined
                      : Icons.keyboard_arrow_right,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.asset(ImageAssets.watchKun),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('#12345',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                const SizedBox(height: 4,),
                                const Text('Đồng hồ Thông minh Kun',style:  TextStyle(color: UIColors.black,fontWeight: FontWeight.bold),),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Số lượng nhập'),
                                    Text('100',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                    Text('Số lượng xuất'),
                                    Text('50',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                const SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const[
                                    Text('Số lượng tồn kho'),
                                    Text('50',style:  TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),

        //   ListView.builder(
        //       shrinkWrap: true ,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemCount: 4,
        //       itemBuilder: (BuildContext context, int index) {
        //         return ListTile(
        //           title: const Text(
        //             "Sản phẩm quà tặng đồng hồ",
        //             style: TextStyle(fontWeight: FontWeight.w700),
        //           ),
        //           tileColor: Colors.transparent,
        //           contentPadding: EdgeInsets.zero,
        //           minVerticalPadding: 0,
        //           trailing: SvgPicture.asset('resources/icons/hardware/keyboard_arrow_right.svg'),
        //           onTap: () {
        //           },
        //         );
        // }),
            const SizedBox(height: SpaceValues.space24,),
            const Text('KHO QUÀ LOF',style: TextStyle(
                  color: UIColors.red,
                  fontWeight: FontWeight.w700
                  ),),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true ,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                return ListTile(
                title: const Text(
                "Sản phẩm quà tặng đồng hồ",
                style: TextStyle(fontWeight: FontWeight.w700),
                ),
                tileColor: Colors.transparent,
                trailing: SvgPicture.asset('resources/icons/hardware/keyboard_arrow_right.svg'),
                onTap: () {
                },
            );
            }),

            ],
            ),
          ),
          ),
          );
  }
}


