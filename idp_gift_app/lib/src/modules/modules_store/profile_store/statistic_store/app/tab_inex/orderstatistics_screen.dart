import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';

class OrderStatisticsScreen extends StatefulWidget {
  const OrderStatisticsScreen({Key? key,required this.viewModel}) : super(key: key);
  final StatisticStoreModel viewModel;

  @override
  State<OrderStatisticsScreen> createState() => _OrderStatisticsScreenState();
}

class _OrderStatisticsScreenState extends State<OrderStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: SpaceValues.space24,),
            Row(
              mainAxisAlignment:  MainAxisAlignment.spaceAround,
              children: [
               CardImage(ImagePath: SvgImageAssets.pending_actions, Number: '2', TextCard: 'Chờ xác nhận'),
                CardImage(ImagePath: SvgImageAssets.published_with_changes, Number: '6', TextCard: 'Đã xác nhận')
              ],
            ),
            SizedBox(height: SpaceValues.space24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardImage(ImagePath: SvgImageAssets.task_alt, Number: '5', TextCard: 'Đã hoàn thành'),
                CardImage(ImagePath: SvgImageAssets.highlight_off, Number: '1', TextCard: 'Đã hủy')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final ImagePath;
  final String Number;
  final String TextCard;
  const CardImage({Key? key,required this.ImagePath,required this.Number,required this.TextCard }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * .45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.5,color: Color(0xffE3E5E6)),
        ),

          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                SvgPicture.asset(ImagePath,width: MediaQuery.of(context).size.width *.25,),
                SizedBox(height: SpaceValues.space8,),
                Text(Number,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff0B0A0A
                    )

                  ),),
                SizedBox(height: SpaceValues.space8,),
                Text(TextCard,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0B0A0A
                      ),
                    height: 1.4
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

