import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/modules_store/%20create_gift_order/create_gift_order_model.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

class CreateGiftOrder extends StatefulWidget{
  const CreateGiftOrder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateGiftOrder();

}
class _CreateGiftOrder extends ViewWidget<CreateGiftOrder,CreateGiftOrderModel>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('123'),
        ),
      );
  }

  @override
  CreateGiftOrderModel createViewModel() => getIt<CreateGiftOrderModel>();

}