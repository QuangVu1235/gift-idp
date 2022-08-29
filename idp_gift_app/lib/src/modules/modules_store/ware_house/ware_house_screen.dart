import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/modules/modules_store/ware_house/widgets/tab_ware_house_1.dart';
import 'package:idp_gift_app/src/modules/modules_store/ware_house/widgets/tab_ware_house_2.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class WareHouseScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _WareHouseScreen();

}
class _WareHouseScreen extends State<WareHouseScreen>{
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children:  <Widget> [
            Container(
              width: double.infinity,
              color: UIColors.white,
              child: const TabBar(
                labelColor: UIColors.brandA,
                labelStyle:  TextStyle(fontWeight: FontWeight.w700),
                unselectedLabelColor: UIColors.navNonSelected,
                unselectedLabelStyle:  TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                indicatorWeight: 2,
                labelPadding: EdgeInsets.only(top: SpaceValues.space24,bottom: SpaceValues.space16),
                tabs: [
                  Text('Tồn kho'),
                  Text('Tạm ứng'),
                ],
              ),
            ),
            const Expanded(
                child: TabBarView(
                  children: [
                    TabWareHouse(),
                    TabWareHouse2(),
                  ],
                ))
          ],
        ),
      ),

    );
  }


}