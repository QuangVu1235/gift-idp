import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/statistic_store/app/tab_inex/gift_card_statistics_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/statistic_store/app/tab_inex/orderstatistics_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
class StatisticStoreManageScreen extends StatefulWidget {
  const StatisticStoreManageScreen({Key? key}) : super(key: key);

  @override
  State<StatisticStoreManageScreen> createState() => _StatisticStoreManageScreenState();
}

class _StatisticStoreManageScreenState extends ViewWidget<StatisticStoreManageScreen,StatisticStoreModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thống kê"),
          shape: Border(
              bottom: BorderSide(color: UIColors.border10))
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SpaceValues.space24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Obx(
                  ()=> InkWell(
                    onTap: (){
                      viewModel.index.value = 0;
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Text("Đơn hàng",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            color: Color(0xff1B68B5)
                          ),
                          ),
                          SizedBox(
                            height:  SpaceValues.space12,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .5,
                            height: 3,
                            color: viewModel.index == 0? Color(0xff1B68B5):Color.fromRGBO(11, 10, 10, 0.1),
                          )


                        ],
                      ),
                    ),
                  ),
                ),
                  Obx(
                  ()=> InkWell(
                      onTap: (){
                        viewModel.index.value = 1;
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Text("Thẻ quà tặng",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  height: 1.4,
                                  color: Color(0xff1B68B5)
                              ),
                            ),
                            SizedBox(
                              height: SpaceValues.space12,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
                              height: 3,
                              color: viewModel.index == 1? Color(0xff1B68B5):Color.fromRGBO(11, 10, 10, 0.1),
                            )


                          ],
                        ),
                      ),
                    ),
                  ),


              ],),
              Obx(()=> viewModel.index == 0 ? OrderStatisticsScreen(viewModel: viewModel):SizedBox()),
              Obx(()=> viewModel.index == 1 ? GiftCardStatisticsScreen(viewModel: viewModel):SizedBox())
            ],
          ),
        ),
      ),
  );
  }
    @override
    StatisticStoreModel createViewModel() => getIt<StatisticStoreModel>();
  }






