import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';

import 'orderstatistics_screen.dart';

class GiftCardStatisticsScreen extends StatefulWidget {
  const GiftCardStatisticsScreen({Key? key,required this.viewModel}) : super(key: key);
  final StatisticStoreModel viewModel;

  @override
  State<GiftCardStatisticsScreen> createState() => _GiftCardStatisticsScreenState();
}

class _GiftCardStatisticsScreenState extends State<GiftCardStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height:  SpaceValues.space24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardImage(ImagePath: SvgImageAssets.giftcard_green, Number: '50', TextCard: 'Thẻ quà Kun'),
                CardImage(ImagePath: SvgImageAssets.giftcard_green, Number: '10', TextCard: 'Thẻ Kun Vận Động')
              ],
            ),
            SizedBox(height: SpaceValues.space16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardImage(ImagePath: SvgImageAssets.giftcard_red, Number: '4', TextCard: 'Thẻ hạnh phúc'),
                CardImage(ImagePath: SvgImageAssets.giftcard_red, Number: '2', TextCard: 'Thẻ chân ái')
              ],

            ),
            SizedBox(height: SpaceValues.space16,),
            Row(
              children: [
                CardImage(ImagePath: SvgImageAssets.giftcard_red, Number: '50', TextCard: 'Thẻ yêu thương'),
              ],
            ),
            SizedBox(height: SpaceValues.space16,),
          ],
        ),
      ),
    );
  }
}
