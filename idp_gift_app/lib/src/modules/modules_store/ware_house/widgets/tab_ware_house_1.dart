import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class TabWareHouse extends StatelessWidget{
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
                      borderSide: BorderSide(color: UIColors.black10),
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
                          SvgPicture.asset(IconAssets.Filter,
                              color: UIColors.fontGray),
                          const SizedBox(
                            width: SpaceValues.space16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SpaceValues.space24,),
                Text('KHO QUÀ KUN',style: TextStyle(
                  color: UIColors.greenKun,
                  fontWeight: FontWeight.w700
                ),),
                ListView.builder(
                    shrinkWrap: true ,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: const Text(
                          "Sản phẩm quà tặng đồng hồ",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        tileColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        minVerticalPadding: 0,
                        trailing: SvgPicture.asset('resources/icons/hardware/keyboard_arrow_right.svg'),
                        onTap: () {
                        },
                      );
              }),
                SizedBox(height: SpaceValues.space24,),
                Text('KHO QUÀ LOF',style: TextStyle(
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